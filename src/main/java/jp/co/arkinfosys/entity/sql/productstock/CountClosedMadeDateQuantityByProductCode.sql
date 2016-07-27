SELECT
        PS.MADE_DATE
        ,SUM(PS.STOCK_NUM) AS QUANTITY
    FROM
        PRODUCT_MADEDATE_STOCK_TRN_/*$domainId*/ PS
        INNER JOIN (
                SELECT
                	PS2.MADE_DATE
                	,MAX(PS2.STOCK_PDATE) AS LAST_PDATE
            	FROM
                	PRODUCT_MADEDATE_STOCK_TRN_/*$domainId*/ PS2 INNER JOIN PRODUCT_MST_/*$domainId*/ P ON PS2.PRODUCT_CODE = P.PRODUCT_CODE
        		WHERE
            		PS2.STOCK_PDATE IS NOT NULL
					AND PS2.PRODUCT_CODE = /*productCode*/''
        		GROUP BY
            		PS2.MADE_DATE
        ) V ON PS.STOCK_PDATE = V.LAST_PDATE AND PS.PRODUCT_CODE = V.PRODUCT_CODE
        LEFT OUTER JOIN RACK_MST_/*$domainId*/ R ON PS.RACK_CODE = R.RACK_CODE /*IF rackCategory != null */AND R.RACK_CATEGORY = /*rackCategory*/''/*END*/
   	/*BEGIN*/
	WHERE
		PS.RACK_CODE = /*rackCode*/''
		AND PS.PRODUCT_CODE = /*productCode*/''
	/*END*/
    GROUP BY
        PS.MADE_DATE
    ORDER BY
        PS.MADE_DATE