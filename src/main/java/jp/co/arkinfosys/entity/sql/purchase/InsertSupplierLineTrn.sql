INSERT INTO
    SUPPLIER_LINE_TRN_/*$domainId*/
(
	SUPPLIER_LINE_ID,
	STATUS,
	SUPPLIER_SLIP_ID,
	LINE_NO,
	PRODUCT_CODE,
	SUPPLIER_PCODE,
	PRODUCT_ABSTRACT,
	SUPPLIER_DETAIL_CATEGORY,
	DELIVERY_PROCESS_CATEGORY,
	TEMP_UNIT_PRICE_CATEGORY,
	TAX_CATEGORY,
	DELIVERY_DATE,
	QUANTITY,
	UNIT_PRICE,
	PRICE,
	CTAX_RATE,
	CTAX_PRICE,
	DOL_UNIT_PRICE,
	DOL_PRICE,
	RATE,
	REMARKS,
	PRODUCT_REMARKS,
	RACK_CODE,
	RACK_NAME,
	PO_LINE_ID,
	PAYMENT_LINE_ID,
	MADE_DATE,
	CRE_FUNC,
	CRE_DATETM,
	CRE_USER,
	UPD_FUNC,
	UPD_DATETM,
	UPD_USER
)
VALUES
(
	/*supplierLineId*/,
	/*status*/,
	/*supplierSlipId*/,
	/*lineNo*/,
	/*productCode*/,
	/*supplierPcode*/,
	/*productAbstract*/,
	/*supplierDetailCategory*/,
	/*deliveryProcessCategory*/,
	/*tempUnitPriceCategory*/,
	/*taxCategory*/,
	/*deliveryDate*/,
	/*quantity*/,
	/*unitPrice*/,
	/*price*/,
	/*ctaxRate*/,
	/*ctaxPrice*/,
	/*dolUnitPrice*/,
	/*dolPrice*/,
	/*rate*/,
	/*remarks*/,
	/*productRemarks*/,
	/*rackCode*/,
	/*rackName*/,
	/*poLineId*/,
	/*paymentLineId*/,
	/*madeDate*/,
	/*creFunc*/,
	now(),
	/*creUser*/,
	/*updFunc*/,
	now(),
	/*updUser*/
);
