UPDATE DELIVERY_MST_/*$domainId*/ SET
	DELIVERY_NAME=/*deliveryName*/
	,DELIVERY_KANA=/*deliveryKana*/
	,DELIVERY_OFFICE_NAME=/*deliveryOfficeName*/
	,DELIVERY_OFFICE_KANA=/*deliveryOfficeKana*/
	,DELIVERY_DEPT_NAME=/*deliveryDeptName*/
	,DELIVERY_ZIP_CODE=/*deliveryZipCode*/
	,DELIVERY_ADDRESS_1=/*deliveryAddress1*/
	,DELIVERY_ADDRESS_2=/*deliveryAddress2*/
	,DELIVERY_PC_NAME=/*deliveryPcName*/
	,DELIVERY_PC_KANA=/*deliveryPcKana*/
	,DELIVERY_PC_PRE_CATEGORY=/*deliveryPcPreCategory*/
	,DELIVERY_TEL=/*deliveryTel*/
	,DELIVERY_FAX=/*deliveryFax*/
	,DELIVERY_EMAIL=/*deliveryEmail*/
	,DELIVERY_URL=/*deliveryUrl*/
	,REMARKS=/*remarks*/
	,UPD_FUNC=/*updFunc*/
	,UPD_DATETM=now()
	,UPD_USER=/*updUser*/
	,DELIVERY_KIND=/*deliveryKind*/
	,DELIVERY_PRE_CATEGORY=/*deliveryPreCategory*/
	
WHERE
    DELIVERY_CODE=/*deliveryCode*/
