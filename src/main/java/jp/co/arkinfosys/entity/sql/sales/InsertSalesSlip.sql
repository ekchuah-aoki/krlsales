INSERT
    INTO
	SALES_SLIP_TRN_/*$domainId*/ (
		SALES_SLIP_ID
		,STATUS
		,SALES_ANNUAL
		,SALES_MONTHLY
		,SALES_YM
		,RO_SLIP_ID
		,BILL_ID
		,SALES_BILL_ID
		,BILL_DATE
		,BILL_CUTOFF_GROUP
		,PAYBACK_CYCLE_CATEGORY
		,BILL_CUTOFF_DATE
		,BILL_CUTOFF_PDATE
		,SALES_DATE
		,DELIVERY_DATE
		,RECEPT_NO
		,CUSTOMER_SLIP_NO
		,SALES_CM_CATEGORY
		,SALES_CUTOFF_DATE
		,SALES_CUTOFF_PDATE
		,USER_ID
		,USER_NAME
		,REMARKS
		,PICKING_REMARKS
		,DC_CATEGORY
		,DC_NAME
		,DC_TIMEZONE_CATEGORY
		,DC_TIMEZONE
		,CUSTOMER_CODE
		,CUSTOMER_NAME
		,CUSTOMER_REMARKS
		,CUSTOMER_COMMENT_DATA
		,DELIVERY_CODE
		,DELIVERY_NAME
		,DELIVERY_KANA
		,DELIVERY_OFFICE_NAME
		,DELIVERY_OFFICE_KANA
		,DELIVERY_DEPT_NAME
		,DELIVERY_ZIP_CODE
		,DELIVERY_ADDRESS_1
		,DELIVERY_ADDRESS_2
		,DELIVERY_PC_NAME
		,DELIVERY_PC_KANA
		,DELIVERY_PC_PRE_CATEGORY
		,DELIVERY_PC_PRE
		,DELIVERY_TEL
		,DELIVERY_FAX
		,DELIVERY_EMAIL
		,DELIVERY_URL
		,BA_CODE
		,BA_NAME
		,BA_KANA
		,BA_OFFICE_NAME
		,BA_OFFICE_KANA
		,BA_DEPT_NAME
		,BA_ZIP_CODE
		,BA_ADDRESS_1
		,BA_ADDRESS_2
		,BA_PC_NAME
		,BA_PC_KANA
		,BA_PC_PRE_CATEGORY
		,BA_PC_PRE
		,BA_TEL
		,BA_FAX
		,BA_EMAIL
		,BA_URL
		,TAX_SHIFT_CATEGORY
		,TAX_FRACT_CATEGORY
		,PRICE_FRACT_CATEGORY
		,CTAX_PRICE_TOTAL
		,CTAX_RATE
		,PRICE_TOTAL
		,GM_TOTAL
		,COD_SC
		,BILL_PRINT_COUNT
		,DELIVERY_PRINT_COUNT
		,TEMP_DELIVERY_PRINT_COUNT
		,SHIPPING_PRINT_COUNT
		,SI_PRINT_COUNT
		,ADLABEL
		,DISCLAIMER
		,CRE_FUNC
		,CRE_DATETM
		,CRE_USER
		,UPD_FUNC
		,UPD_DATETM
		,UPD_USER
		,CUSTOMER_OFFICE_NAME
		,CUSTOMER_OFFICE_KANA
		,CUSTOMER_ABBR
		,CUSTOMER_DEPT_NAME
		,CUSTOMER_ZIP_CODE
		,CUSTOMER_ADDRESS_1
		,CUSTOMER_ADDRESS_2
		,CUSTOMER_PC_POST
		,CUSTOMER_PC_NAME
		,CUSTOMER_PC_KANA
		,CUSTOMER_PC_PRE_CATEGORY
		,CUSTOMER_PC_PRE
		,CUSTOMER_TEL
		,CUSTOMER_FAX
		,CUSTOMER_EMAIL
		,CUSTOMER_URL
		,ESTIMATE_PRINT_COUNT
		,DELBOR_PRINT_COUNT
		,PO_PRINT_COUNT
		,ART_ID
) VALUES (
		/*salesSlipId*/0
		,/*status*/NULL
		,/*salesAnnual*/0
		,/*salesMonthly*/0
		,/*salesYm*/0
		,/*roSlipId*/NULL
		,/*billId*/NULL
		,/*salesBillId*/NULL
		,/*billDate*/NULL
		,/*billCutoffGroup*/NULL
		,/*paybackCycleCategory*/NULL
		,/*billCutoffDate*/NULL
		,/*billCutoffPdate*/NULL
		,/*salesDate*/'2009/12/23'
		,/*deliveryDate*/NULL
		,/*receptNo*/NULL
		,/*customerSlipNo*/NULL
		,/*salesCmCategory*/NULL
		,/*salesCutoffDate*/NULL
		,/*salesCutoffPdate*/NULL
		,/*userId*/NULL
		,/*userName*/NULL
		,/*remarks*/NULL
		,/*pickingRemarks*/NULL
		,/*dcCategory*/NULL
		,/*dcName*/NULL
		,/*dcTimezoneCategory*/NULL
		,/*dcTimezone*/NULL
		,/*customerCode*/NULL
		,/*customerName*/NULL
		,/*customerRemarks*/NULL
		,/*customerCommentData*/NULL
		,/*deliveryCode*/NULL
		,/*deliveryName*/NULL
		,/*deliveryKana*/NULL
		,/*deliveryOfficeName*/NULL
		,/*deliveryOfficeKana*/NULL
		,/*deliveryDeptName*/NULL
		,/*deliveryZipCode*/NULL
		,/*deliveryAddress1*/NULL
		,/*deliveryAddress2*/NULL
		,/*deliveryPcName*/NULL
		,/*deliveryPcKana*/NULL
		,/*deliveryPcPreCategory*/NULL
		,/*deliveryPcPre*/NULL
		,/*deliveryTel*/NULL
		,/*deliveryFax*/NULL
		,/*deliveryEmail*/NULL
		,/*deliveryUrl*/NULL
		,/*baCode*/NULL
		,/*baName*/NULL
		,/*baKana*/NULL
		,/*baOfficeName*/NULL
		,/*baOfficeKana*/NULL
		,/*baDeptName*/NULL
		,/*baZipCode*/NULL
		,/*baAddress1*/NULL
		,/*baAddress2*/NULL
		,/*baPcName*/NULL
		,/*baPcKana*/NULL
		,/*baPcPreCategory*/NULL
		,/*baPcPre*/NULL
		,/*baTel*/NULL
		,/*baFax*/NULL
		,/*baEmail*/NULL
		,/*baUrl*/NULL
		,/*taxShiftCategory*/NULL
		,/*taxFractCategory*/NULL
		,/*priceFractCategory*/NULL
		,/*ctaxPriceTotal*/NULL
		,/*ctaxRate*/NULL
		,/*priceTotal*/NULL
		,/*gmTotal*/NULL
		,/*codSc*/NULL
		,/*billPrintCount*/NULL
		,/*deliveryPrintCount*/NULL
		,/*tempDeliveryPrintCount*/NULL
		,/*shippingPrintCount*/NULL
		,/*siPrintCount*/NULL
		,/*adlabel*/NULL
		,/*disclaimer*/NULL
		,/*creFunc*/NULL
		,now()
		,/*creUser*/NULL
		,/*updFunc*/NULL
		,now()
		,/*updUser*/NULL
		,/*customerOfficeName*/NULL
		,/*customerOfficeKana*/NULL
		,/*customerAbbr*/NULL
		,/*customerDeptName*/NULL
		,/*customerZipCode*/NULL
		,/*customerAddress1*/NULL
		,/*customerAddress2*/NULL
		,/*customerPcPost*/NULL
		,/*customerPcName*/NULL
		,/*customerPcKana*/NULL
		,/*customerPcPreCategory*/NULL
		,/*customerPcPre*/NULL
		,/*customerTel*/NULL
		,/*customerFax*/NULL
		,/*customerEmail*/NULL
		,/*customerUrl*/NULL
		,/*estimatePrintCount*/NULL
		,/*delborPrintCount*/NULL
		,/*poPrintCount*/NULL
		,/*artId*/NULL
)