INSERT INTO EAD_MADEDATE_TRN_/*$domainId*/ (
	EAD_MADEDATE_ID,
	EAD_SLIP_ID,
	PRODUCT_CODE,
	RACK_CODE,
	MADE_DATE,
	QUANTITY,
	CRE_FUNC,
	CRE_DATETM,
	CRE_USER
) VALUES (
	/*eadMadedateId*/,
	/*eadSlipId*/,
	/*productCode*/,
	/*rackCode*/,
	/*madeDate*/,
	/*quantity*/,
	/*creFunc*/NULL,
	now(),
	/*creUser*/NULL
)
