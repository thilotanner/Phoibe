INSERT INTO `ReportType` VALUES(1, '2011-11-17 18:18:34', '2011-12-06 22:15:40', 'Offerte', 'GREEN', 1, '');
INSERT INTO `ReportType` VALUES(2, '2011-11-17 18:18:34', '2011-12-06 22:15:40', 'Angebot', 'GREEN', 0, '');
INSERT INTO `ReportType` VALUES(3, '2011-11-17 18:19:52', '2011-12-06 22:15:47', 'Auftragsbestätigung', 'BLUE', 0, '');
INSERT INTO `ReportType` VALUES(4, '2011-11-17 18:20:20', '2011-12-06 22:16:48', 'Arbeitsrapport', 'YELLOW', 1, '');
INSERT INTO `ReportType` VALUES(5, '2011-11-17 18:20:46', '2011-12-06 22:15:53', 'Rechnung', 'RED', 0, '');
INSERT INTO `ReportType` VALUES(6, '2011-11-17 18:21:19', '2011-12-06 22:15:58', 'Buchung', 'RED', 0, '');

UPDATE `ReportType` SET `template` = '<?xml version="1.0" encoding="UTF-8"?>\r\n<jasperReport xmlns="http://jasperreports.sourceforge.net/jasperreports" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://jasperreports.sourceforge.net/jasperreports http://jasperreports.sourceforge.net/xsd/jasperreport.xsd" name="testReport" language="groovy" pageWidth="595" pageHeight="842" columnWidth="483" leftMargin="56" rightMargin="56" topMargin="22" bottomMargin="22" isSummaryWithPageHeaderAndFooter="true">\r\n	<property name="ireport.zoom" value="2.0"/>\r\n	<property name="ireport.x" value="0"/>\r\n	<property name="ireport.y" value="0"/>\r\n	<style name="style1" fontName="Helvetica" fontSize="8" isUnderline="false" isStrikeThrough="false"/>\r\n	<parameter name="report" class="models.Report"/>\r\n	<field name="amount" class="java.lang.Double"/>\r\n	<field name="description" class="java.lang.String"/>\r\n	<field name="retailPricePerMetric" class="models.Money"/>\r\n	<field name="totalPrice" class="models.Money"/>\r\n	<field name="metric" class="models.Metric"/>\r\n	<field name="valueAddedTaxRate" class="models.ValueAddedTaxRate"/>\r\n	<background>\r\n		<band splitType="Stretch"/>\r\n	</background>\r\n	<title>\r\n		<band height="314" splitType="Stretch">\r\n			<textField>\r\n				<reportElement x="0" y="258" width="483" height="19"/>\r\n				<textElement>\r\n					<font fontName="Arial" size="16" isBold="true"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.reportType.name + " - Nr. " + $P{report}.id]]></textFieldExpression>\r\n			</textField>\r\n			<staticText>\r\n				<reportElement x="0" y="287" width="39" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<text><![CDATA[Betreff:]]></text>\r\n			</staticText>\r\n			<staticText>\r\n				<reportElement x="0" y="299" width="39" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<text><![CDATA[Objekt:]]></text>\r\n			</staticText>\r\n			<textField>\r\n				<reportElement x="0" y="244" width="223" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA["Referenz-Nr. " + $P{report}.order.id]]></textFieldExpression>\r\n			</textField>\r\n			<textField>\r\n				<reportElement x="263" y="125" width="220" height="93"/>\r\n				<textElement>\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.order.billingContact.getFormattedContact()]]></textFieldExpression>\r\n			</textField>\r\n			<textField>\r\n				<reportElement x="39" y="287" width="273" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.order.description]]></textFieldExpression>\r\n			</textField>\r\n			<textField isStretchWithOverflow="true">\r\n				<reportElement x="39" y="299" width="273" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.order.shippingContact.getFormattedContact()]]></textFieldExpression>\r\n			</textField>\r\n			<textField pattern="dd.MM.yyyy">\r\n				<reportElement x="330" y="244" width="153" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[new java.util.Date()]]></textFieldExpression>\r\n			</textField>\r\n			<staticText>\r\n				<reportElement x="263" y="244" width="65" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<text><![CDATA[9100 Herisau, ]]></text>\r\n			</staticText>\r\n		</band>\r\n	</title>\r\n	<pageHeader>\r\n		<band height="16" splitType="Stretch"/>\r\n	</pageHeader>\r\n	<columnHeader>\r\n		<band height="11" splitType="Stretch">\r\n			<staticText>\r\n				<reportElement x="0" y="0" width="223" height="11"/>\r\n				<textElement>\r\n					<font fontName="Arial" size="8" isBold="true" isItalic="true" isPdfEmbedded="true"/>\r\n				</textElement>\r\n				<text><![CDATA[Beschreibung]]></text>\r\n			</staticText>\r\n			<staticText>\r\n				<reportElement style="style1" x="223" y="0" width="40" height="11"/>\r\n				<textElement>\r\n					<font fontName="Arial" size="8" isBold="true" isItalic="true" isPdfEmbedded="true"/>\r\n				</textElement>\r\n				<text><![CDATA[Einheit]]></text>\r\n			</staticText>\r\n			<staticText>\r\n				<reportElement style="style1" x="303" y="0" width="70" height="11"/>\r\n				<textElement textAlignment="Right">\r\n					<font fontName="Arial" size="8" isBold="true" isItalic="true"/>\r\n				</textElement>\r\n				<text><![CDATA[Preis]]></text>\r\n			</staticText>\r\n			<staticText>\r\n				<reportElement style="style1" x="413" y="0" width="70" height="11"/>\r\n				<textElement textAlignment="Right">\r\n					<font fontName="Arial" size="8" isBold="true" isItalic="true"/>\r\n				</textElement>\r\n				<text><![CDATA[Summe]]></text>\r\n			</staticText>\r\n			<staticText>\r\n				<reportElement style="style1" x="383" y="0" width="30" height="11"/>\r\n				<textElement>\r\n					<font fontName="Arial" size="8" isBold="true" isItalic="true"/>\r\n				</textElement>\r\n				<text><![CDATA[Steuer]]></text>\r\n			</staticText>\r\n			<staticText>\r\n				<reportElement style="style1" mode="Transparent" x="263" y="0" width="40" height="11"/>\r\n				<textElement>\r\n					<font fontName="Arial" size="8" isBold="true" isItalic="true" isPdfEmbedded="true"/>\r\n				</textElement>\r\n				<text><![CDATA[Anzahl]]></text>\r\n			</staticText>\r\n			<line>\r\n				<reportElement x="0" y="10" width="483" height="1"/>\r\n				<graphicElement>\r\n					<pen lineWidth="0.5"/>\r\n				</graphicElement>\r\n			</line>\r\n		</band>\r\n	</columnHeader>\r\n	<detail>\r\n		<band height="20" splitType="Stretch">\r\n			<textField isStretchWithOverflow="true">\r\n				<reportElement mode="Transparent" x="0" y="4" width="223" height="12"/>\r\n				<textElement verticalAlignment="Top" markup="html">\r\n					<font fontName="Arial" isBold="false"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$F{description}]]></textFieldExpression>\r\n			</textField>\r\n			<textField>\r\n				<reportElement x="263" y="4" width="40" height="12"/>\r\n				<textElement verticalAlignment="Top">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$F{amount}]]></textFieldExpression>\r\n			</textField>\r\n			<textField>\r\n				<reportElement x="413" y="4" width="70" height="12"/>\r\n				<textElement textAlignment="Right" verticalAlignment="Top">\r\n					<font fontName="Arial" isBold="true"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$F{totalPrice}]]></textFieldExpression>\r\n			</textField>\r\n			<textField>\r\n				<reportElement x="303" y="4" width="70" height="12"/>\r\n				<textElement textAlignment="Right" verticalAlignment="Top">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$F{retailPricePerMetric}]]></textFieldExpression>\r\n			</textField>\r\n			<textField>\r\n				<reportElement x="223" y="4" width="40" height="12"/>\r\n				<textElement verticalAlignment="Top">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$F{metric}.symbol]]></textFieldExpression>\r\n			</textField>\r\n			<textField>\r\n				<reportElement x="383" y="4" width="30" height="12"/>\r\n				<textElement textAlignment="Left" verticalAlignment="Top">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$F{valueAddedTaxRate}]]></textFieldExpression>\r\n			</textField>\r\n		</band>\r\n	</detail>\r\n	<columnFooter>\r\n		<band height="12" splitType="Stretch"/>\r\n	</columnFooter>\r\n	<pageFooter>\r\n		<band height="17" splitType="Stretch">\r\n			<line>\r\n				<reportElement x="0" y="0" width="483" height="1"/>\r\n				<graphicElement>\r\n					<pen lineWidth="0.5"/>\r\n				</graphicElement>\r\n			</line>\r\n			<textField>\r\n				<reportElement x="364" y="4" width="119" height="13"/>\r\n				<textElement textAlignment="Right">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA["Seite "+$V{PAGE_NUMBER}]]></textFieldExpression>\r\n			</textField>\r\n		</band>\r\n	</pageFooter>\r\n	<summary>\r\n		<band height="161" splitType="Stretch">\r\n			<staticText>\r\n				<reportElement positionType="Float" x="0" y="141" width="273" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<text><![CDATA[Wir danken Ihnen für den geschätzten Auftrag.]]></text>\r\n			</staticText>\r\n			<staticText>\r\n				<reportElement x="223" y="17" width="100" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial" isBold="true"/>\r\n				</textElement>\r\n				<text><![CDATA[Warenwert gesamt]]></text>\r\n			</staticText>\r\n			<line>\r\n				<reportElement positionType="Float" x="0" y="57" width="483" height="1"/>\r\n				<graphicElement>\r\n					<pen lineWidth="0.5"/>\r\n				</graphicElement>\r\n			</line>\r\n			<staticText>\r\n				<reportElement positionType="Float" x="0" y="60" width="223" height="14"/>\r\n				<textElement>\r\n					<font fontName="Arial" size="12" isBold="true"/>\r\n				</textElement>\r\n				<text><![CDATA[Gesamtbetrag]]></text>\r\n			</staticText>\r\n			<line>\r\n				<reportElement positionType="Float" x="0" y="76" width="483" height="1"/>\r\n				<graphicElement>\r\n					<pen lineWidth="2.0" lineStyle="Double"/>\r\n				</graphicElement>\r\n			</line>\r\n			<textField>\r\n				<reportElement x="323" y="17" width="160" height="12"/>\r\n				<textElement textAlignment="Right">\r\n					<font fontName="Arial" isBold="true"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.getTotalPrice()]]></textFieldExpression>\r\n			</textField>\r\n			<textField>\r\n				<reportElement positionType="Float" x="323" y="60" width="160" height="14"/>\r\n				<textElement textAlignment="Right">\r\n					<font fontName="Arial" size="12" isBold="true"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.getTaxedTotalPrice().asRounded()]]></textFieldExpression>\r\n			</textField>\r\n			<textField isStretchWithOverflow="true">\r\n				<reportElement positionType="Float" x="0" y="92" width="223" height="12"/>\r\n				<textElement textAlignment="Left">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.getUsedVatRatesAsString()]]></textFieldExpression>\r\n			</textField>\r\n			<staticText>\r\n				<reportElement positionType="Float" x="0" y="80" width="223" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<text><![CDATA[Rekapitulation MWSt.:]]></text>\r\n			</staticText>\r\n			<textField isStretchWithOverflow="true">\r\n				<reportElement positionType="Float" x="223" y="92" width="150" height="12"/>\r\n				<textElement textAlignment="Left">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.getTotalsPerVatAsString()]]></textFieldExpression>\r\n			</textField>\r\n			<textField isStretchWithOverflow="true">\r\n				<reportElement positionType="Float" x="373" y="92" width="110" height="12"/>\r\n				<textElement textAlignment="Right">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.getTaxPerVatAsString()]]></textFieldExpression>\r\n			</textField>\r\n			<staticText>\r\n				<reportElement positionType="Float" x="0" y="104" width="223" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<text><![CDATA[MWSt-Nummer: 110 653]]></text>\r\n			</staticText>\r\n			<line>\r\n				<reportElement x="0" y="0" width="483" height="1"/>\r\n				<graphicElement>\r\n					<pen lineWidth="0.5"/>\r\n				</graphicElement>\r\n			</line>\r\n			<textField isStretchWithOverflow="true">\r\n				<reportElement positionType="Float" x="0" y="129" width="483" height="12"/>\r\n				<textElement textAlignment="Left">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.conditions]]></textFieldExpression>\r\n			</textField>\r\n			<textField isStretchWithOverflow="true">\r\n				<reportElement x="323" y="29" width="160" height="12"/>\r\n				<textElement textAlignment="Right">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.getChargeValues()]]></textFieldExpression>\r\n			</textField>\r\n			<textField isStretchWithOverflow="true">\r\n				<reportElement x="223" y="29" width="100" height="12"/>\r\n				<textElement textAlignment="Left">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.getChargeTexts()]]></textFieldExpression>\r\n			</textField>\r\n		</band>\r\n	</summary>\r\n</jasperReport>\r\n';

UPDATE `ReportType` SET `template` = '<?xml version="1.0" encoding="UTF-8"?>\r\n<jasperReport xmlns="http://jasperreports.sourceforge.net/jasperreports" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://jasperreports.sourceforge.net/jasperreports http://jasperreports.sourceforge.net/xsd/jasperreport.xsd" name="testReport" language="groovy" pageWidth="595" pageHeight="842" columnWidth="483" leftMargin="56" rightMargin="56" topMargin="22" bottomMargin="22" isSummaryWithPageHeaderAndFooter="true">\r\n	<property name="ireport.zoom" value="2.0"/>\r\n	<property name="ireport.x" value="0"/>\r\n	<property name="ireport.y" value="0"/>\r\n	<style name="style1" fontName="Helvetica" fontSize="8" isUnderline="false" isStrikeThrough="false"/>\r\n	<parameter name="report" class="models.Report"/>\r\n	<field name="amount" class="java.lang.Double"/>\r\n	<field name="description" class="java.lang.String"/>\r\n	<field name="retailPricePerMetric" class="models.Money"/>\r\n	<field name="totalPrice" class="models.Money"/>\r\n	<field name="metric" class="models.Metric"/>\r\n	<field name="valueAddedTaxRate" class="models.ValueAddedTaxRate"/>\r\n	<background>\r\n		<band splitType="Stretch"/>\r\n	</background>\r\n	<title>\r\n		<band height="132" splitType="Stretch">\r\n			<textField>\r\n				<reportElement x="0" y="0" width="483" height="19"/>\r\n				<textElement>\r\n					<font fontName="Arial" size="16" isBold="true"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.reportType.name + " - Nr. " + $P{report}.id]]></textFieldExpression>\r\n			</textField>\r\n			<staticText>\r\n				<reportElement x="0" y="45" width="110" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial" isBold="true"/>\r\n				</textElement>\r\n				<text><![CDATA[Betreff:]]></text>\r\n			</staticText>\r\n			<staticText>\r\n				<reportElement positionType="Float" x="0" y="86" width="483" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial" isBold="true"/>\r\n				</textElement>\r\n				<text><![CDATA[Objekt:]]></text>\r\n			</staticText>\r\n			<textField>\r\n				<reportElement x="110" y="25" width="373" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.order.id]]></textFieldExpression>\r\n			</textField>\r\n			<textField>\r\n				<reportElement x="110" y="45" width="373" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.order.description]]></textFieldExpression>\r\n			</textField>\r\n			<textField isStretchWithOverflow="true">\r\n				<reportElement positionType="Float" x="110" y="86" width="373" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.order.shippingContact.getFormattedFullContact()]]></textFieldExpression>\r\n			</textField>\r\n			<staticText>\r\n				<reportElement x="0" y="65" width="110" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial" isBold="true"/>\r\n				</textElement>\r\n				<text><![CDATA[Auftraggeber:]]></text>\r\n			</staticText>\r\n			<staticText>\r\n				<reportElement positionType="Float" x="0" y="106" width="483" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial" isBold="true"/>\r\n				</textElement>\r\n				<text><![CDATA[Rechnungsadresse:]]></text>\r\n			</staticText>\r\n			<staticText>\r\n				<reportElement x="0" y="25" width="110" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial" isBold="true"/>\r\n				</textElement>\r\n				<text><![CDATA[Referenz-Nr.:]]></text>\r\n			</staticText>\r\n			<textField isStretchWithOverflow="true">\r\n				<reportElement positionType="Float" x="110" y="106" width="373" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.order.billingContact.getFormattedFullContact()]]></textFieldExpression>\r\n			</textField>\r\n			<textField isStretchWithOverflow="true">\r\n				<reportElement x="110" y="65" width="373" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.order.orderingContact.getFormattedFullContact()]]></textFieldExpression>\r\n			</textField>\r\n		</band>\r\n	</title>\r\n	<pageHeader>\r\n		<band height="16" splitType="Stretch"/>\r\n	</pageHeader>\r\n	<columnHeader>\r\n		<band height="11" splitType="Stretch">\r\n			<staticText>\r\n				<reportElement x="0" y="0" width="223" height="11"/>\r\n				<textElement>\r\n					<font fontName="Arial" size="8" isBold="true" isItalic="true" isPdfEmbedded="true"/>\r\n				</textElement>\r\n				<text><![CDATA[Beschreibung]]></text>\r\n			</staticText>\r\n			<staticText>\r\n				<reportElement style="style1" x="223" y="0" width="40" height="11"/>\r\n				<textElement>\r\n					<font fontName="Arial" size="8" isBold="true" isItalic="true" isPdfEmbedded="true"/>\r\n				</textElement>\r\n				<text><![CDATA[Einheit]]></text>\r\n			</staticText>\r\n			<staticText>\r\n				<reportElement style="style1" x="303" y="0" width="70" height="11"/>\r\n				<textElement textAlignment="Right">\r\n					<font fontName="Arial" size="8" isBold="true" isItalic="true"/>\r\n				</textElement>\r\n				<text><![CDATA[Preis]]></text>\r\n			</staticText>\r\n			<staticText>\r\n				<reportElement style="style1" x="413" y="0" width="70" height="11"/>\r\n				<textElement textAlignment="Right">\r\n					<font fontName="Arial" size="8" isBold="true" isItalic="true"/>\r\n				</textElement>\r\n				<text><![CDATA[Summe]]></text>\r\n			</staticText>\r\n			<staticText>\r\n				<reportElement style="style1" x="383" y="0" width="30" height="11"/>\r\n				<textElement>\r\n					<font fontName="Arial" size="8" isBold="true" isItalic="true"/>\r\n				</textElement>\r\n				<text><![CDATA[Steuer]]></text>\r\n			</staticText>\r\n			<staticText>\r\n				<reportElement style="style1" mode="Transparent" x="263" y="0" width="40" height="11"/>\r\n				<textElement>\r\n					<font fontName="Arial" size="8" isBold="true" isItalic="true" isPdfEmbedded="true"/>\r\n				</textElement>\r\n				<text><![CDATA[Anzahl]]></text>\r\n			</staticText>\r\n			<line>\r\n				<reportElement x="0" y="10" width="483" height="1"/>\r\n				<graphicElement>\r\n					<pen lineWidth="0.5"/>\r\n				</graphicElement>\r\n			</line>\r\n		</band>\r\n	</columnHeader>\r\n	<detail>\r\n		<band height="20" splitType="Stretch">\r\n			<textField isStretchWithOverflow="true">\r\n				<reportElement mode="Transparent" x="0" y="4" width="223" height="12"/>\r\n				<textElement verticalAlignment="Top" markup="html">\r\n					<font fontName="Arial" isBold="false"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$F{description}]]></textFieldExpression>\r\n			</textField>\r\n			<textField>\r\n				<reportElement x="263" y="4" width="40" height="12"/>\r\n				<textElement verticalAlignment="Top">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$F{amount}]]></textFieldExpression>\r\n			</textField>\r\n			<textField>\r\n				<reportElement x="413" y="4" width="70" height="12"/>\r\n				<textElement textAlignment="Right" verticalAlignment="Top">\r\n					<font fontName="Arial" isBold="true"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$F{totalPrice}]]></textFieldExpression>\r\n			</textField>\r\n			<textField>\r\n				<reportElement x="303" y="4" width="70" height="12"/>\r\n				<textElement textAlignment="Right" verticalAlignment="Top">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$F{retailPricePerMetric}]]></textFieldExpression>\r\n			</textField>\r\n			<textField>\r\n				<reportElement x="223" y="4" width="40" height="12"/>\r\n				<textElement verticalAlignment="Top">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$F{metric}.symbol]]></textFieldExpression>\r\n			</textField>\r\n			<textField>\r\n				<reportElement x="383" y="4" width="30" height="12"/>\r\n				<textElement textAlignment="Left" verticalAlignment="Top">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$F{valueAddedTaxRate}]]></textFieldExpression>\r\n			</textField>\r\n		</band>\r\n	</detail>\r\n	<columnFooter>\r\n		<band height="12" splitType="Stretch"/>\r\n	</columnFooter>\r\n	<pageFooter>\r\n		<band height="17" splitType="Stretch">\r\n			<line>\r\n				<reportElement x="0" y="0" width="483" height="1"/>\r\n				<graphicElement>\r\n					<pen lineWidth="0.5"/>\r\n				</graphicElement>\r\n			</line>\r\n			<textField>\r\n				<reportElement x="364" y="4" width="119" height="13"/>\r\n				<textElement textAlignment="Right">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA["Seite "+$V{PAGE_NUMBER}]]></textFieldExpression>\r\n			</textField>\r\n		</band>\r\n	</pageFooter>\r\n	<summary>\r\n		<band height="161" splitType="Stretch">\r\n			<line>\r\n				<reportElement x="0" y="0" width="483" height="1"/>\r\n				<graphicElement>\r\n					<pen lineWidth="0.5"/>\r\n				</graphicElement>\r\n			</line>\r\n			<staticText>\r\n				<reportElement positionType="Float" x="0" y="58" width="223" height="14"/>\r\n				<textElement>\r\n					<font fontName="Arial" size="12" isBold="true"/>\r\n				</textElement>\r\n				<text><![CDATA[Gesamtbetrag]]></text>\r\n			</staticText>\r\n			<textField>\r\n				<reportElement x="323" y="15" width="160" height="12"/>\r\n				<textElement textAlignment="Right">\r\n					<font fontName="Arial" isBold="true"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.getTotalPrice()]]></textFieldExpression>\r\n			</textField>\r\n			<textField isStretchWithOverflow="true">\r\n				<reportElement x="323" y="27" width="160" height="12"/>\r\n				<textElement textAlignment="Right">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.getChargeValues()]]></textFieldExpression>\r\n			</textField>\r\n			<textField isStretchWithOverflow="true">\r\n				<reportElement positionType="Float" x="0" y="127" width="483" height="12"/>\r\n				<textElement textAlignment="Left">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.conditions]]></textFieldExpression>\r\n			</textField>\r\n			<staticText>\r\n				<reportElement x="223" y="15" width="100" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial" isBold="true"/>\r\n				</textElement>\r\n				<text><![CDATA[Warenwert gesamt]]></text>\r\n			</staticText>\r\n			<staticText>\r\n				<reportElement positionType="Float" x="0" y="78" width="223" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<text><![CDATA[Rekapitulation MWSt.:]]></text>\r\n			</staticText>\r\n			<staticText>\r\n				<reportElement positionType="Float" x="0" y="139" width="273" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<text><![CDATA[Wir danken Ihnen für den geschätzten Auftrag.]]></text>\r\n			</staticText>\r\n			<staticText>\r\n				<reportElement positionType="Float" x="0" y="102" width="223" height="12"/>\r\n				<textElement>\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<text><![CDATA[MWSt-Nummer: 110 653]]></text>\r\n			</staticText>\r\n			<textField isStretchWithOverflow="true">\r\n				<reportElement positionType="Float" x="223" y="90" width="150" height="12"/>\r\n				<textElement textAlignment="Left">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.getTotalsPerVatAsString()]]></textFieldExpression>\r\n			</textField>\r\n			<textField isStretchWithOverflow="true">\r\n				<reportElement positionType="Float" x="0" y="90" width="223" height="12"/>\r\n				<textElement textAlignment="Left">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.getUsedVatRatesAsString()]]></textFieldExpression>\r\n			</textField>\r\n			<line>\r\n				<reportElement positionType="Float" x="0" y="55" width="483" height="1"/>\r\n				<graphicElement>\r\n					<pen lineWidth="0.5"/>\r\n				</graphicElement>\r\n			</line>\r\n			<textField isStretchWithOverflow="true">\r\n				<reportElement x="223" y="27" width="100" height="12"/>\r\n				<textElement textAlignment="Left">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.getChargeTexts()]]></textFieldExpression>\r\n			</textField>\r\n			<line>\r\n				<reportElement positionType="Float" x="0" y="74" width="483" height="1"/>\r\n				<graphicElement>\r\n					<pen lineWidth="2.0" lineStyle="Double"/>\r\n				</graphicElement>\r\n			</line>\r\n			<textField isStretchWithOverflow="true">\r\n				<reportElement positionType="Float" x="373" y="90" width="110" height="12"/>\r\n				<textElement textAlignment="Right">\r\n					<font fontName="Arial"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.getTaxPerVatAsString()]]></textFieldExpression>\r\n			</textField>\r\n			<textField>\r\n				<reportElement positionType="Float" x="323" y="58" width="160" height="14"/>\r\n				<textElement textAlignment="Right">\r\n					<font fontName="Arial" size="12" isBold="true"/>\r\n				</textElement>\r\n				<textFieldExpression><![CDATA[$P{report}.getTaxedTotalPrice().asRounded()]]></textFieldExpression>\r\n			</textField>\r\n		</band>\r\n	</summary>\r\n</jasperReport>\r\n' WHERE id = 4;
