SELECT
	S.SUPPLIER_LINE_ID,
	S.STATUS,
	S.SUPPLIER_SLIP_ID,
	S.LINE_NO,
	S.PRODUCT_CODE,
	S.SUPPLIER_PCODE,
	S.PRODUCT_ABSTRACT,
	S.SUPPLIER_DETAIL_CATEGORY,
	S.DELIVERY_PROCESS_CATEGORY,
	S.TEMP_UNIT_PRICE_CATEGORY,
	S.TAX_CATEGORY,
	S.DELIVERY_DATE,
	S.QUANTITY,
	S.UNIT_PRICE,
	S.PRICE,
	S.CTAX_RATE,
	S.CTAX_PRICE,
	S.DOL_UNIT_PRICE,
	S.DOL_PRICE,
	S.RATE,
	S.REMARKS,
	S.PRODUCT_REMARKS,
	S.RACK_CODE,
	S.RACK_NAME,
	S.MADE_DATE,
	S.MADE_DATE AS OLD_MADE_DATE,
	W.WAREHOUSE_NAME,
	S.PO_LINE_ID,
	S.PAYMENT_LINE_ID,
	S.CRE_FUNC,
	S.CRE_DATETM,
	S.CRE_USER,
	S.UPD_FUNC,
	S.UPD_DATETM,
	S.UPD_USER
FROM
	SUPPLIER_LINE_TRN_/*$domainId*/'DEFAULT' S
	LEFT OUTER JOIN RACK_MST_/*$domainId*/ R
	ON S.RACK_CODE = R.RACK_CODE
	LEFT OUTER JOIN WAREHOUSE_MST_/*$domainId*/ W
	ON R.WAREHOUSE_CODE = W.WAREHOUSE_CODE
WHERE
	SUPPLIER_SLIP_ID=/*supplierSlipId*/'default'
ORDER BY LINE_NO
