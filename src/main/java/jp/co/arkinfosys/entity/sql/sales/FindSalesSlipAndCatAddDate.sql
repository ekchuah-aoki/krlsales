SELECT
	S.SALES_SLIP_ID
	,S.STATUS
	,S.SALES_ANNUAL
	,S.SALES_MONTHLY
	,S.SALES_YM
	,S.RO_SLIP_ID
	,S.BILL_ID
	,S.SALES_BILL_ID
	,S.BILL_DATE
	,S.BILL_CUTOFF_GROUP
	,S.PAYBACK_CYCLE_CATEGORY
	,S.BILL_CUTOFF_DATE
	,S.BILL_CUTOFF_PDATE
	,ADDDATE(S.SALES_DATE,1) AS SALES_DATE
	,S.DELIVERY_DATE
	,S.RECEPT_NO
	,S.CUSTOMER_SLIP_NO
	,S.SALES_CM_CATEGORY
	,S.SALES_CUTOFF_DATE
	,S.SALES_CUTOFF_PDATE
	,S.USER_ID
	,S.USER_NAME
	,S.REMARKS
	,S.PICKING_REMARKS
	,S.DC_CATEGORY
	,S.DC_NAME
	,S.DC_TIMEZONE_CATEGORY
	,S.DC_TIMEZONE
	,S.CUSTOMER_CODE
	,S.CUSTOMER_NAME
	,S.DELIVERY_CODE
	,S.DELIVERY_NAME
	,S.DELIVERY_KANA
	,S.DELIVERY_OFFICE_NAME
	,S.DELIVERY_OFFICE_KANA
	,S.DELIVERY_DEPT_NAME
	,S.DELIVERY_ZIP_CODE
	,S.DELIVERY_ADDRESS_1
	,S.DELIVERY_ADDRESS_2
	,S.DELIVERY_PC_NAME
	,S.DELIVERY_PC_KANA
	,S.DELIVERY_PC_PRE_CATEGORY
	,S.DELIVERY_PC_PRE
	,S.DELIVERY_TEL
	,S.DELIVERY_FAX
	,S.DELIVERY_EMAIL
	,S.DELIVERY_URL
	,S.BA_CODE
	,S.BA_NAME
	,S.BA_KANA
	,S.BA_OFFICE_NAME
	,S.BA_OFFICE_KANA
	,S.BA_DEPT_NAME
	,S.BA_ZIP_CODE
	,S.BA_ADDRESS_1
	,S.BA_ADDRESS_2
	,S.BA_PC_NAME
	,S.BA_PC_KANA
	,S.BA_PC_PRE_CATEGORY
	,S.BA_PC_PRE
	,S.BA_TEL
	,S.BA_FAX
	,S.BA_EMAIL
	,S.BA_URL
	,S.TAX_SHIFT_CATEGORY
	,S.TAX_FRACT_CATEGORY
	,S.PRICE_FRACT_CATEGORY
	,S.CTAX_PRICE_TOTAL
	,S.CTAX_RATE
	,S.PRICE_TOTAL
	,S.GM_TOTAL
	,S.COD_SC
	,S.BILL_PRINT_COUNT
	,S.DELIVERY_PRINT_COUNT
	,S.TEMP_DELIVERY_PRINT_COUNT
	,S.SHIPPING_PRINT_COUNT
	,S.SI_PRINT_COUNT
	,S.ADLABEL
	,S.DISCLAIMER
	,S.CRE_FUNC
	,S.CRE_DATETM
	,S.CRE_USER
	,S.UPD_FUNC
	,S.UPD_DATETM
	,S.UPD_USER
	,S.CUSTOMER_OFFICE_NAME
	,S.CUSTOMER_OFFICE_KANA
	,S.CUSTOMER_ABBR
	,S.CUSTOMER_DEPT_NAME
	,S.CUSTOMER_ZIP_CODE
	,S.CUSTOMER_ADDRESS_1
	,S.CUSTOMER_ADDRESS_2
	,S.CUSTOMER_PC_POST
	,S.CUSTOMER_PC_NAME
	,S.CUSTOMER_PC_KANA
	,S.CUSTOMER_PC_PRE_CATEGORY
	,S.CUSTOMER_PC_PRE
	,S.CUSTOMER_TEL
	,S.CUSTOMER_FAX
	,S.CUSTOMER_EMAIL
	,S.CUSTOMER_URL
	,S.ESTIMATE_PRINT_COUNT
	,S.DELBOR_PRINT_COUNT
	,S.PO_PRINT_COUNT
	,S.ART_ID
	,CAT.CATEGORY_CODE_NAME
    FROM
        SALES_SLIP_TRN_/*$domainId*/ S
        	LEFT OUTER JOIN CATEGORY_TRN_/*$domainId*/ CAT ON (S.SALES_CM_CATEGORY = CAT.CATEGORY_CODE AND CAT.CATEGORY_ID = 32 )
    /*BEGIN*/
	WHERE
		/*IF customerCode != null */
		S.CUSTOMER_CODE = /*customerCode*/'C%'
		/*END*/
		/*IF salesDate != null */
		AND S.SALES_DATE > /*salesDate*/'2009/12/01'
		/*END*/
		/*IF salesSlipId != null */
		AND S.SALES_SLIP_ID = /*salesSlipId*/0
		/*END*/
		/*IF billId != null */
		AND S.BILL_ID = /*billId*/'C%'
		/*END*/
	/*END*/
	/*BEGIN*/
	ORDER BY
		/*IF sortColumnSalesDate != null */
		S./*$sortColumnSalesDate*/
		/*END*/

		/*IF sortOrder != null*/
		/*$sortOrder*/
		/*END*/
	/*END*/
	/*BEGIN*/
		/*IF rowCount != null && offsetRow != null */
		LIMIT /*rowCount*/ OFFSET /*offsetRow*/
		/*END*/
	/*END*/
	/*IF lockRecord != null */
	/*$lockRecord*/
	/*END*/
