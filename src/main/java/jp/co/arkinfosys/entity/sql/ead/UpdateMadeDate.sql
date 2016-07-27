UPDATE EAD_MADEDATE_TRN_/*$domainId*/ 
SET
QUANTITY = /*quantity*/ 
,UPD_FUNC = /*updFunc*/NULL
,UPD_DATETM = now()
,UPD_USER = /*updUser*/NULL

WHERE 
EAD_MADEDATE_ID = /*eadMadedateId*/
