SELECT
		BANK_ID
		,BANK_CODE
		,BANK_NAME
		,STORE_CODE
		,STORE_NAME
		,DWB_TYPE
		,ACCOUNT_NUM
		,ACCOUNT_OWNER_NAME
		,ACCOUNT_OWNER_KANA
		,REMARKS
		,VALID
		,CRE_FUNC
		,CRE_DATETM
		,CRE_USER
		,UPD_FUNC
		,UPD_DATETM
		,UPD_USER
    FROM
        BANK_MST_/*$domainId*/
    /*BEGIN*/
    WHERE
    /*IF selBankId != null*/
        BANK_ID=/*selBankId*/
    /*END*/
    /*END*/
    ORDER BY
    	BANK_ID ASC