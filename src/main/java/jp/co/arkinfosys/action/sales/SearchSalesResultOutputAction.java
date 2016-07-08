/*
 * Copyright 2009-2010 Ark Information Systems.
 */
package jp.co.arkinfosys.action.sales;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import jp.co.arkinfosys.action.AbstractSearchResultAction;
import jp.co.arkinfosys.common.CategoryTrns;
import jp.co.arkinfosys.common.Constants;
import jp.co.arkinfosys.common.MessageResourcesUtil;
import jp.co.arkinfosys.common.NumberUtil;
import jp.co.arkinfosys.form.AbstractSearchForm;
import jp.co.arkinfosys.form.sales.SearchSalesForm;
import jp.co.arkinfosys.service.MasterSearch;
import jp.co.arkinfosys.service.ROrderService;
import jp.co.arkinfosys.service.exception.ServiceException;
import jp.co.arkinfosys.service.sales.SearchSalesService;

import org.seasar.framework.beans.util.BeanMap;
import org.seasar.framework.beans.util.Beans;
import org.seasar.struts.annotation.ActionForm;
import org.seasar.struts.annotation.Execute;

/**
 * 売上検索画面の検索結果をEXCELとしてクライアントに送信するアクションクラスです.
 *
 * @author Ark Information Systems
 *
 */
public class SearchSalesResultOutputAction extends
		AbstractSearchResultAction<List<Object>, BeanMap> {

	@ActionForm
	@Resource
	public SearchSalesForm searchSalesForm;

	@Resource
	private SearchSalesService searchSalesService;


	/**
	 * Excelファイルを出力します.
	 * @return 遷移先URI
	 * @throws Exception
	 */
	@Execute(validator = true, validate = "validate", input = Mapping.EXCEL)
	public String excel() throws Exception {
		this.outputExcel = true;
		this.searchSalesForm.outputExcel = true;
		return super.doSearch();
	}

	/**
	 * 検索結果件数を返します.<br>
	 * 使用しないため、必ず0を返します.
	 * @param params パラメータを設定したマップ
	 * @return 0固定
	 * @throws ServiceException
	 */
	@Override
	protected int doCount(BeanMap params) throws ServiceException {
		// カウント不要
		return 0;
	}

	/**
	 * 検索条件に応じて売上伝票を検索します.<br>
	 * @param params 検索パラメータを設定したマップ
	 * @param sortColumn ソート対象カラム名
	 * @param sortOrderAsc 昇順にソートするか否か
	 * @param rowCount 取得する検索件数
	 * @param offset 取得開始位置
	 * @return 検索結果のリスト
	 * @throws ServiceException
	 */
	@Override
	protected List<BeanMap> execSearch(BeanMap params, String sortColumn,
			boolean sortOrderAsc, int rowCount, int offset)
			throws ServiceException {
		params.put(ROrderService.Param.ROW_COUNT, null);
		return this.searchSalesService.getSearchResult(params);
	}

	/**
	 * ENTITYのリストをDTOのリストに変換します.<br>
	 * @param entityList　BeanMapのリスト
	 * @return オブジェクトのリスト
	 * @throws Exception
	 */
	@Override
	protected List<List<Object>> exchange(List<BeanMap> entityList)
			throws ServiceException {
		List<List<Object>> resultList = new ArrayList<List<Object>>();
		super.detailDispItemService.createResult(entityList, resultList, this
				.getSearchMenuID(), this.searchSalesForm.searchTarget);
		return resultList;
	}
	/**
	 * {@link AbstractSearchResultAction#doSearch()}検索後に必要な処理を行います.<br>
	 * 検索結果の合計金額を計算
	 * @throws Exception
	 */
	protected void doAfterSearch() throws Exception {
	
		// 検索条件を取得
		BeanMap params = Beans.createAndCopy(BeanMap.class, this.searchSalesForm)
				.excludesWhitespace().lrTrim().execute();
		
		List<BeanMap> resultList = this.searchSalesService.findSlipByCondition(params);
		
		if( resultList.size()==0){
			this.searchSalesForm.gmTotal = "";
			this.searchSalesForm.gmTotalPer = "";
			this.searchSalesForm.priceTotal = "";
			this.searchSalesForm.ctaxPriceTotal = "";
			this.searchSalesForm.total = "";
			
			return;
			
		}
		
		BigDecimal gmTotal = BigDecimal.ZERO;
		BigDecimal gmTotalPer = BigDecimal.ZERO;
		BigDecimal priceTotal = BigDecimal.ZERO;
		BigDecimal ctaxPriceTotal = BigDecimal.ZERO;
		BigDecimal total = BigDecimal.ZERO;
		
		for(BeanMap bean : resultList){
			gmTotal = gmTotal.add((BigDecimal)bean.get("gmTotal"));
			gmTotalPer = gmTotalPer.add((BigDecimal)bean.get("gmRate"));
			priceTotal = priceTotal.add((BigDecimal)bean.get("priceTotal"));
			ctaxPriceTotal = ctaxPriceTotal.add((BigDecimal)bean.get("ctaxPriceTotal"));
			total = total.add((BigDecimal)bean.get("slipTotal"));
		}
		
		gmTotalPer = gmTotal.divide(priceTotal, 3).multiply(new BigDecimal(100));
		
		this.searchSalesForm.gmTotal = this.convertToYenNotation(gmTotal.toString());
		this.searchSalesForm.gmTotalPer = this.convertToStaNotation(gmTotalPer.toString());
		this.searchSalesForm.priceTotal = this.convertToYenNotation(priceTotal.toString());
		this.searchSalesForm.ctaxPriceTotal = this.convertToYenNotation(ctaxPriceTotal.toString());
		this.searchSalesForm.total = this.convertToYenNotation(total.toString());
	}
	/**
	 * 売上伝票検索アクションで使用するアクションフォームを返します.<br>
	 * @return 売上伝票検索用アクションフォーム
	 */
	@Override
	protected AbstractSearchForm<List<Object>> getActionForm() {
		return this.searchSalesForm;
	}

	/**
	 * 売上伝票検索後の遷移URIを返します.<br>
	 * @return 売上伝票検索後の遷移URI
	 */
	@Override
	protected String getResultURIString() {
		return Mapping.EXCEL;
	}

	/**
	 * 売上伝票検索画面のメニューIDを返します.<br>
	 * @return 売上伝票検索画面メニューID
	 */
	@Override
	protected String getSearchMenuID() {
		return Constants.MENU_ID.SEARCH_SALES;
	}

	/**
	 * 売上伝票検索画面では検索サービスを返す必要が無いのでnullを返します.<br>
	 * @return null固定
	 */
	@Override
	protected MasterSearch<BeanMap> getService() {
		// 未使用
		return null;
	}

	/**
	 * 売上伝票検索アクションではDTOクラスを使用しないのでnullを返します.<br>
	 * @return null固定
	 */
	@SuppressWarnings("unchecked")
	@Override
	protected Class getDtoClass() {
		// 未使用
		return null;
	}
	
	/**
	 * 数値文字列を統計形式の数値文字列に変換します.<br>
	 * 数値は自社マスタで設定する統計小数桁数の桁まで四捨五入されます.また、整数部には3桁毎にカンマが挿入されます.
	 *
	 * @param l_string 数値文字列
	 * @return 統計形式の数値文字列
	 */
	private String convertToStaNotation(String l_string) {
		String temp = "";
		// 統計な端数処理
		DecimalFormat df = NumberUtil.createDecimalFormat(
				CategoryTrns.FLACT_CATEGORY_HALF_UP,
				super.mineDto.statsDecAlignment, true);
		try {
			temp = df.format(new BigDecimal(l_string));
		} catch (Exception e) {
		}
		return temp;
	}
	
	/**
	 * 数値文字列を￥記号付きの金額表示文字列に変換します.<br>
	 * 3桁毎にカンマが挿入され、文字列の先頭には￥記号が付与されます.
	 *
	 * @param l_string 数値文字列
	 * @return ￥記号付き金額文字列
	 */
	private String convertToYenNotation(String l_string) {
		String temp = "";
		// 円金額な端数処理
		DecimalFormat df = NumberUtil.createDecimalFormat(
				super.mineDto.priceFractCategory, 0, true);
		try {
			temp = df.format(new BigDecimal(l_string));
			if (temp.length() != 0) {
				temp = MessageResourcesUtil
						.getMessage("words.unit.japaneseYen")
						+ " " + temp;
			}
		} catch (Exception e) {
		}
		return temp;
	}	
}
