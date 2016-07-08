<div style="width: 1010px; height: 25px;">
	<div style="position:absolute; left: 0px;">検索結果件数： ${searchResultCount}件</div>
	<input type="hidden" id="searchResultCount" value="${searchResultCount}">
	<input type="hidden" id="searchResult_gmTotal" value="${gmTotal}">
	<input type="hidden" id="searchResult_gmTotalPer" value="${gmTotalPer}">
	<input type="hidden" id="searchResult_priceTotal" value="${priceTotal}">
	<input type="hidden" id="searchResult_ctaxPriceTotal" value="${ctaxPriceTotal}">
	<input type="hidden" id="searchResult_total" value="${total}">

	<div style="position:absolute; width: 1160px; text-align: center;">
		${sw:pageLink(searchResultCount,rowCount,pageNo)}
	</div>

	<jsp:include page="/WEB-INF/view/common/rowcount.jsp"/>
</div>

<span id="searchResultList">
	<%@ include file="/WEB-INF/view/sales/searchSalesResultOutput/resultList.jsp" %>
</span>

<div style="position:absolute; width: 1160px; text-align: center; margin-top: 20px;">
	${sw:pageLink(searchResultCount,rowCount,pageNo)}
</div>
