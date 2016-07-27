SELECT
        A.MADE_DATE
        ,SUM(A.QUANTITY) AS QUANTITY
    FROM
        (
            SELECT
                    EM.MADE_DATE
                    ,CASE
                        WHEN ES.EAD_CATEGORY = /*eCategory*/ THEN EM.QUANTITY -- 入出庫区分「入庫」
                        WHEN ES.EAD_CATEGORY = /*dCategory*/ THEN (-1) * EM.QUANTITY -- 入出庫区分「出庫」
                    END AS QUANTITY
                FROM
                    EAD_MADEDATE_TRN_/*$domainId*/ EM INNER JOIN EAD_SLIP_TRN_/*$domainId*/ ES
                        ON EM.EAD_SLIP_ID = ES.EAD_SLIP_ID INNER JOIN RACK_MST_/*$domainId*/ R
                        ON EM.RACK_CODE = R.RACK_CODE
                        INNER JOIN PRODUCT_MST_/*$domainId*/ P ON EM.PRODUCT_CODE=P.PRODUCT_CODE
            WHERE
                ES.STOCK_PDATE IS NULL
                AND ES.EAD_DATE <= CURDATE()
				AND EM.RACK_CODE = /*rackCode*/''
				/*IF rackCategory != null */
				AND R.RACK_CATEGORY = /*rackCategory*/''
				/*END*/
				AND EM.PRODUCT_CODE = /*productCode*/
        ) A
    GROUP BY
        A.MADE_DATE
	ORDER BY
        A.MADE_DATE
