package models;

import play.data.validation.Required;
import play.data.validation.Valid;
import play.i18n.Messages;
import util.i18n.CurrencyProvider;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Entity
public class Creditor extends EnhancedModel {

    public static List<Creditor> getOverdueCreditors() {
        return Creditor.find("creditorStatus = 'DUE' AND due < ?", new Date()).fetch();
    }

    @Required
    @ManyToOne
    public Contact supplier;

    public String reference;

    @Valid
    @Embedded
    public Money amount;

    @ManyToOne
    public ValueAddedTaxRate valueAddedTaxRate;

    @ManyToOne
    public Account inputTaxAccount;

    @Temporal(TemporalType.DATE)
    public Date due;

    @Enumerated(EnumType.STRING)
    public CreditorStatus creditorStatus;

    @OneToMany(mappedBy = "creditor")
    public List<CreditorPayment> creditorPayments;

    @ManyToOne
    public Entry creditorEntry;
    
    @ManyToOne
    public Entry valueAddedTaxEntry;
    
    @ManyToOne
    public Entry amountDueEntry;

    @ManyToOne
    public Entry valueAddedTaxCorrectionEntry;

    public Money getAmountPaid() {
        Money sum = new Money(CurrencyProvider.getDefaultCurrency());
        if(creditorPayments != null) {
            for(CreditorPayment creditorPayment : creditorPayments) {
                sum = sum.add(creditorPayment.amount);
            }
        }
        return sum;
    }
    
    public Money getAmountDue() {
        // total price
        Money amountDue = new Money(amount);

        // minus payments
        amountDue = amountDue.subtract(getAmountPaid());

        // minus amount due entry (discount)
        if(amountDueEntry != null && amountDueEntry.amount != null) {
            amountDue = amountDue.subtract(amountDueEntry.amount);
            amountDue = amountDue.subtract(valueAddedTaxCorrectionEntry.amount);
        }

        return amountDue;
    }
    
    public boolean isOverdue() {
        return creditorStatus == CreditorStatus.DUE && due.before(new Date());
    }

    public void buildAndSaveCreditorEntries() {
        creditorEntry = new Entry();
        creditorEntry.date = new Date();
        creditorEntry.amount = getAmountDue().divide(BigDecimal.ONE.add(valueAddedTaxRate.getRateFactor()));
        creditorEntry.accountingPeriod = AccountingPeriod.getActiveAccountingPeriod();
        creditorEntry.debit = Account.getPurchasesAccount();
        creditorEntry.credit = Account.getCreditorAccount();
        creditorEntry.voucher = reference;
        creditorEntry.description = String.format("%s: %s - %s", Messages.get("creditor"), supplier.getLabel(), reference);
        creditorEntry.save();

        valueAddedTaxEntry = new Entry();
        valueAddedTaxEntry.debit = inputTaxAccount;
        valueAddedTaxEntry.credit = Account.getCreditorAccount();
        valueAddedTaxEntry.amount = amount.subtract(creditorEntry.amount);
        valueAddedTaxEntry.date = new Date();
        valueAddedTaxEntry.accountingPeriod = AccountingPeriod.getActiveAccountingPeriod();
        valueAddedTaxEntry.voucher = reference;
        valueAddedTaxEntry.description = String.format("%s %s: %s - %s", Messages.get("valueAddedTax"), Messages.get("creditor"), supplier.getLabel(), reference);
        valueAddedTaxEntry.save();
    }

    public void buildAndSaveDiscountEntries() {
        amountDueEntry = new Entry();
        amountDueEntry.date = new Date();
        amountDueEntry.accountingPeriod = AccountingPeriod.getActiveAccountingPeriod();
        amountDueEntry.debit = Account.getCreditorAccount();
        amountDueEntry.credit = Account.getPurchaseDiscountAccount();
        amountDueEntry.amount = getAmountDue().divide(BigDecimal.ONE.add(valueAddedTaxRate.getRateFactor()));
        amountDueEntry.description = String.format("%s: %s - %s", Messages.get("creditor.discount"), supplier.getLabel(), reference);
        amountDueEntry.save();

        valueAddedTaxCorrectionEntry = new Entry();
        valueAddedTaxCorrectionEntry.date = new Date();
        valueAddedTaxCorrectionEntry.accountingPeriod = AccountingPeriod.getActiveAccountingPeriod();
        valueAddedTaxCorrectionEntry.debit = Account.getCreditorAccount();
        valueAddedTaxCorrectionEntry.credit = inputTaxAccount;
        valueAddedTaxCorrectionEntry.amount = amount.subtract(getAmountPaid()).subtract(amountDueEntry.amount);
        valueAddedTaxCorrectionEntry.description = String.format("%s %s: %s - %s", Messages.get("valueAddedTax"), Messages.get("correction"), supplier.getLabel(), reference);
        valueAddedTaxCorrectionEntry.save();
    }

    public void close() {
        // close creditor
        creditorStatus = CreditorStatus.PAID;
        this.save();
    }

    public boolean isEditable() {
        return creditorStatus == CreditorStatus.DUE;
    }
}
