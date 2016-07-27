DELETE FROM EAD_MADEDATE_TRN_/*$domainId*/
WHERE 
EAD_SLIP_ID = /*eadSlipId*/
/*IF eadMadedateId != null */
AND EAD_MADEDATE_ID NOT IN /*eadMadedateId*/(S,S)
/*END*/
