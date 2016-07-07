SELECT
    MAX(RO_SLIP_ID)

FROM
    RO_SLIP_TRN_/*$domainId*/
WHERE
	CUSTOMER_CODE LIKE /*customerCode*/'S%'
