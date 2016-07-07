<table style="width: 750px;">
	<tr>
		<td style="text-align: left; color: #FFFFFF;">検索結果件数: ${searchResultCount}件</td>
		<td style="text-align: right;">
			<span style="color: red">
			 	<html:messages id="resultThreshold" message="true">
			 		<bean:write name="resultThreshold" filter="false"/>
			 	</html:messages>
			</span>
		</td>
	</tr>
</table>

<div id="${dialogId}Div"
	style="border: none; width: 730px; height: 320px; overflow: hidden;">
<table class="dialog_resultList"  id="${dialogId}List" summary="商品検索結果" style="width: 100%;">
	<colgroup>
		<col span="1" style="width: 25%">
		<col span="1" style="width: 45%">
		<col span="1" style="width: 20%">
		<col span="1" style="width: 5%">
		<col span="1" style="width: 5%">
	</colgroup>
	<tr>
		<th>商品コード</th>
		<th>商品名</th>
		<th>倉庫（棚番）</th>
		<th>引当可能数</th>
		<th>総在庫数</th>
	</tr>
	<c:forEach var="bean" items="${searchResultList}" varStatus="status">
			<c:if test="${f:h(bean.stokInfoList==null)}">
				<tr>
				<td>
					<a href="javascript:void(0)"  tabindex="5100" style="color: #1D9CCC" onclick="_selectLinkSearchResultAjax( '${dialogId}', '${f:h(bean.productCode)}', ProductParams, 'productCode' );
					$('#${dialogId}').dialog('close');" >${f:h(bean.productCode)}</a>
				</td>
				<td>${f:h(bean.productName)}</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				</tr>
			</c:if>
			<c:if test="${f:h(bean.stokInfoList!=null)}">
				<c:forEach var="bean2" items="${bean.stokInfoList}" varStatus="status2">
				<tr>
					<c:if test="${status2.index==0}">
						<td>${f:h(bean2.productCode)}</td>
						<td>${f:h(bean2.productName)}</td>
					</c:if>	
					<c:if test="${status2.index!=0}">
						<td></td>
						<td></td>
					</c:if>	
				<td>
					<a href="javascript:void(0)"  tabindex="5100" style="color: #1D9CCC" 
						onclick="_selectLinkSearchResultAjax2( '${dialogId}', '${f:h(bean.productCode)}', ProductParams, 'productCode',{rackCode:'${bean2.rackCode}', rackName:'${bean2.warehouseName}'} );
						$('#${dialogId}').dialog('close');" >${f:h(bean2.warehouseName)}(${bean2.rackCode})</a>
				</td>
				<td>${bean2.formattedPossibleDrawQuantity}</td>
				<td>${bean2.currentTotalQuantity}</td>
				</tr>
				</c:forEach>
			</c:if>
	</c:forEach>
</table>
</div>
