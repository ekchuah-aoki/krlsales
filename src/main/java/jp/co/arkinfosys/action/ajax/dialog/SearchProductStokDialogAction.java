/*
 * Copyright 2009-2010 Ark Information Systems.
 */
package jp.co.arkinfosys.action.ajax.dialog;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts.util.LabelValueBean;
import org.seasar.struts.annotation.ActionForm;

import jp.co.arkinfosys.common.Categories;
import jp.co.arkinfosys.common.CategoryTrns;
import jp.co.arkinfosys.dto.master.ProductDto;
import jp.co.arkinfosys.entity.join.ProductJoin;
import jp.co.arkinfosys.form.AbstractSearchForm;
import jp.co.arkinfosys.form.ajax.dialog.SearchProductStokDialogForm;
import jp.co.arkinfosys.service.CategoryService;
import jp.co.arkinfosys.service.MasterSearch;
import jp.co.arkinfosys.service.ProductService;
import jp.co.arkinfosys.service.ProductStockService;
import jp.co.arkinfosys.service.exception.ServiceException;

/**
 * 商品検索ダイアログの表示・検索処理アクションクラスです.
 *
 * @author Ark Information Systems
 *
 */
public class SearchProductStokDialogAction extends
		AbstractSearchDialogAction<ProductDto, ProductJoin> {

	/**
	 * 区分マスタに対するサービスクラスです.
	 */
	@Resource
	protected CategoryService categoryService;

	/**
	 * 商品マスタに対するサービスクラスです.
	 */
	@Resource
	protected ProductService productService;

	/**
	 * 商品在庫テーブルに対するサービスクラスです.
	 */
	@Resource
	public ProductStockService productStockService;
	
	/**
	 * アクションフォームです.
	 */
	@ActionForm
	@Resource
	public SearchProductStokDialogForm searchProductStokDialogForm;

	/**
	 * プルダウンの内容を初期化します.
	 *
	 * @throws ServiceException サービス例外発生時
	 */
	@Override
	protected void createList() throws ServiceException {
		// セット分類リストを取得
		this.searchProductStokDialogForm.setTypeCategoryList = this.categoryService
				.findCategoryLabelValueBeanListById(Categories.PRODUCT_SET_TYPE);
		this.searchProductStokDialogForm.setTypeCategoryList.add(0,
				new LabelValueBean());

		// 標準化分類リストを取得
		this.searchProductStokDialogForm.standardCategoryList = this.categoryService
				.findCategoryLabelValueBeanListById(Categories.PRODUCT_STANDARD);
		this.searchProductStokDialogForm.standardCategoryList.add(0,
				new LabelValueBean());

		// 状況分類リストを取得
		this.searchProductStokDialogForm.statusCategoryList = this.categoryService
				.findCategoryLabelValueBeanListById(Categories.PRODUCT_STATUS);
		this.searchProductStokDialogForm.statusCategoryList.add(0,
				new LabelValueBean());
	}

	/**
	 * 検索カラムと検索順序を設定します.
	 */
	@Override
	protected void doBeforeSearch() throws Exception {
		this.searchProductStokDialogForm.sortColumn = ProductService.Param.PRODUCT_CODE;
		this.searchProductStokDialogForm.sortOrderAsc = true;
	}

	/**
	 * アクションフォームを返します.
	 *
	 * @return {@link SearchProductStokDialogForm}
	 */
	@Override
	protected AbstractSearchForm<ProductDto> getActionForm() {
		return this.searchProductStokDialogForm;
	}

	/**
	 * {@link ProductDto}クラスのクラスオブジェクトを返します.
	 *
	 * @return {@link ProductDto}クラス
	 */
	@Override
	protected Class<ProductDto> getDtoClass() {
		return ProductDto.class;
	}

	/**
	 * 検索キー値を返します.
	 *
	 * @return 商品コード
	 */
	@Override
	protected String getId() {
		return this.searchProductStokDialogForm.productCode;
	}

	/**
	 * キー値での検索結果が0件だったことを通知するために、メッセージリソースのキーを返します.
	 *
	 * @return メッセージキー
	 */
	@Override
	protected String getMissingRecordMessageKey() {
		return "warns.product.not.exist";
	}

	/**
	 * {@link ProductService}クラスのインスタンスを返します.
	 *
	 * @return {@link ProductService}
	 */
	@Override
	protected MasterSearch<ProductJoin> getService() {
		return this.productService;
	}
	
	/**
	 * 検索実行後に行う処理
	 * 在庫情報を取得する
	 * AOKI
	 *
	 * @throws Exception 例外発生時
	 */
	protected void doAfterSearch() throws Exception {
		//AOKI
		List<ProductDto> proList = this.searchProductStokDialogForm.searchResultList;
		
		// 在庫情報を取得
		boolean zeroZaiko = false;
		
		if(this.searchProductStokDialogForm.zeroZaiko.equals("1")){
			zeroZaiko = true;
		}
		
		for(ProductDto pro : proList){
			if( CategoryTrns.PRODUCT_STOCK_CTL_YES.equals(pro.stockCtlCategory)){ // 在庫管理区分
					pro.stokInfoList = this.productStockService
							.calcStockRackQuantityByProductCode(pro.productCode,zeroZaiko);
			}
		}
		
		
	}
	
}
