INSERT INTO ESTIMATE_SHEET_TRN_/*$domainId*/'DEFAULT' (
		ESTIMATE_SHEET_ID
        ,ESTIMATE_ANNUAL
        ,ESTIMATE_MONTHLY
        ,ESTIMATE_YM
        ,ESTIMATE_DATE
        ,DELIVERY_INFO
        ,VALID_DATE
        ,USER_ID
        ,USER_NAME
        ,REMARKS
        ,TITLE
        ,DELIVERY_NAME
        ,ESTIMATE_CONDITION
        ,SUBMIT_NAME
        ,SUBMIT_PRE_CATEGORY
        ,SUBMIT_PRE
        ,CUSTOMER_CODE
        ,CUSTOMER_NAME
        ,CUSTOMER_REMARKS
        ,CUSTOMER_COMMENT_DATA
        ,DELIVERY_ZIP_CODE
        ,CTAX_PRICE_TOTAL
        ,CTAX_RATE
        ,COST_TOTAL
        ,RETAIL_PRICE_TOTAL
        ,ESTIMATE_TOTAL
        ,MEMO
		,CRE_FUNC
		,CRE_DATETM
		,CRE_USER
		,UPD_FUNC
		,UPD_DATETM
		,UPD_USER
		,TAX_FRACT_CATEGORY
		,PRICE_FRACT_CATEGORY
)VALUES(
		/*estimateSheetId*/'default'
        ,/*estimateAnnual*/NULL
        ,/*estimateMonthly*/NULL
        ,/*estimateYm*/NULL
        ,/*estimateDate*/NULL
        ,/*deliveryInfo*/NULL
        ,/*validDate*/NULL
        ,/*userId*/NULL
        ,/*userName*/NULL
        ,/*remarks*/NULL
        ,/*title*/NULL
        ,/*deliveryName*/NULL
        ,/*estimateCondition*/NULL
        ,/*submitName*/NULL
        ,/*submitPreCategory*/NULL
        ,/*submitPre*/NULL
        ,/*customerCode*/NULL
        ,/*customerName*/NULL
        ,/*customerRemarks*/NULL
        ,/*customerCommentData*/NULL
        ,/*deliveryZipCode*/NULL
        ,/*ctaxPriceTotal*/NULL
        ,/*ctaxRate*/NULL
        ,/*costTotal*/NULL
        ,/*retailPriceTotal*/NULL
        ,/*estimateTotal*/NULL
        ,/*memo*/NULL
        ,/*creFunc*/NULL
        ,now()
        ,/*creUser*/NULL
        ,/*updFunc*/NULL
        ,now()
        ,/*updUser*/NULL
        ,/*taxFractCategory*/NULL
        ,/*priceFractCategory*/NULL
)
