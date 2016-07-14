INSERT INTO STDDEV_PRODUCT_SALES_YM_WORK_/*$domainId*/ (
	SESSION_ID,
	YM,
	PRODUCT_CODE,
	RACK_CODE,
	QUANTITY
)
(
		SELECT
			/*sessionId*/ AS SESSION_ID,
			SS.SALES_YM,
			SL.PRODUCT_CODE,
			/*IF outtypeRack != null*/
			SL.RACK_CODE_SRC AS RACK_CODE,
			/*END*/
			/*IF outtypeRack == null*/
			'DUMMY' AS RACK_CODE,
			/*END*/
			
			SUM(SL.QUANTITY)
		FROM
			SALES_SLIP_TRN_/*$domainId*/ SS INNER JOIN SALES_LINE_TRN_/*$domainId*/ SL ON SS.SALES_SLIP_ID = SL.SALES_SLIP_ID
		WHERE
			SS.SALES_DATE BETWEEN DATE_FORMAT(DATE_SUB(now(), interval /*aggregateMonthsRange*/ month), '%Y-%m-01') AND now()
		GROUP BY
			SESSION_ID,
			SS.SALES_YM,
			SL.PRODUCT_CODE
			/*IF outtypeRack != null*/
			,SL.RACK_CODE_SRC
			/*END*/
)