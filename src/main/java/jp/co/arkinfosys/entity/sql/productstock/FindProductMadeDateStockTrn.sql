SELECT
        PS.RACK_CODE
        ,PS.PRODUCT_CODE
        ,PS.MADE_DATE
        ,PS.STOCK_PDATE
        ,PS.STOCK_ANNUAL
        ,PS.STOCK_MONTHLY
        ,PS.STOCK_YM
        ,PS.STOCK_NUM
        ,PS.ENTER_NUM
        ,PS.DISPATCH_NUM
        ,PS.REMARKS
        ,PS.CRE_FUNC
        ,PS.CRE_DATETM
        ,PS.CRE_USER
        ,PS.UPD_FUNC
        ,PS.UPD_DATETM
        ,PS.UPD_USER
    FROM
        PRODUCT_MADEDATE_STOCK_TRN_/*$domainId*/ PS
        
        WHERE   PS.RACK_CODE = /*rackCode*/
            AND PS.PRODUCT_CODE = /*productCode*/
            AND A.STOCK_ANNUAL = /*stockAnnual*/
            AND A.STOCK_MONTHLY = /*stockMonthly*/
