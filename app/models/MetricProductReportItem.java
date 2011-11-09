package models;

import play.data.validation.Required;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import java.math.BigDecimal;

@Entity
public class MetricProductReportItem extends ReportItem {

    @Required
    @ManyToOne
    public MetricProduct metricProduct;

    @Required
    public BigDecimal amount;

    @Override
    public BigDecimal getAmount() {
        return amount;
    }

    @Override
    public Metric getMetric() {
        return metricProduct.metric;
    }

    @Override
    public String getDescription() {
        return metricProduct.name;
    }

    @Override
    public Money getPricePerUnit() {
        return metricProduct.pricePerMetric;
    }

    @Override
    public ReportItem duplicate() {
        MetricProductReportItem metricProductReportItem = new MetricProductReportItem();
        metricProductReportItem.metricProduct = metricProduct;
        metricProductReportItem.amount = amount;
        return metricProductReportItem;
    }

    @Override
    public ValueAddedTaxRate getValueAddedTaxRate() {
        return metricProduct.valueAddedTaxRate;
    }
}
