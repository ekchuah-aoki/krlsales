SELECT 
	EAD_MADEDATE_ID
FROM
	EAD_MADEDATE_TRN_/*$domainId*/
WHERE	
	EAD_SLIP_ID =/*eadSlipId*/
	AND PRODUCT_CODE =/*productCode*/
	AND RACK_CODE =/*rackCode*/
	AND MADE_DATE =/*madeDate*/