/*
 * Copyright 2009-2010 Ark Information Systems.
 */
package jp.co.arkinfosys.action.ajax;

import java.util.List;

import javax.annotation.Resource;

import jp.co.arkinfosys.common.CategoryTrns;
import jp.co.arkinfosys.dto.StockInfoDto;
import jp.co.arkinfosys.entity.join.EntrustPorderRestDetail;
import jp.co.arkinfosys.entity.join.EntrustStockDetail;
import jp.co.arkinfosys.entity.join.PorderRestDetail;
import jp.co.arkinfosys.entity.join.RorderRestDetail;
import jp.co.arkinfosys.form.stock.DispProductStockForm;
import jp.co.arkinfosys.service.ProductStockService;

import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.seasar.struts.annotation.ActionForm;
import org.seasar.struts.annotation.Execute;
import org.seasar.struts.util.ActionMessagesUtil;

/**
 * 在庫照会情報を取得するアクションクラスです.
 * @author Ark Information Systems
 *
 */
public class DispProductStockListAjaxAction extends CommonAjaxResources {
	@Resource
	public ProductStockService productStockService;

	@ActionForm
	@Resource
	private DispProductStockForm dispProductStockForm;

	/**
	 * 在庫数情報
	 */
	public StockInfoDto stockInfoDto;

	/**
	 * 棚別在庫数情報 AOKI
	 */
	public List<StockInfoDto> stockInfoDtoList;
	
	
	/**
	 * 受注残明細
	 */
	public List<RorderRestDetail> rorderRestDetailList;

	/**
	 * 発注残明細
	 */
	public List<PorderRestDetail> porderRestDetailList;

	/**
	 * 委託発注残明細
	 */
	public List<EntrustPorderRestDetail> entrustPorderRestDetailList;

	/**
	 * 委託在庫明細
	 */
	public List<EntrustStockDetail> entrustStockDetailList;

	/**
	 * 画面遷移用のマッピングクラス
	 */
	public static class Mapping {
		public static final String RESULT = "/stock/dispProductStockList/dispStockInfo.jsp";
	}

	/**
	 * 在庫照会情報を設定します.
	 * @return 遷移先URI
	 * @throws Exception
	 */
	@Execute(validator = false)
	public String search() throws Exception {
		try {
			
			//AOKI 棚別在庫に変更
			this.stockInfoDto = this.productStockService
					.calcStockQuantityByProductCode(dispProductStockForm.productCode);
			
			//AOKI 在庫管理する商品の場合、棚別在庫情報の取得
			if( CategoryTrns.PRODUCT_STOCK_CTL_YES.equals(this.stockInfoDto.stockCtlCategory)){ // 在庫管理区分
				this.stockInfoDtoList = this.productStockService
						.calcStockRackQuantityByProductCode(dispProductStockForm.productCode,false);
			}
			// 該当がないのでエラーにする
			if (this.stockInfoDto.productCode==null || this.stockInfoDto.productName==null) {
				super.messages.add(ActionMessages.GLOBAL_MESSAGE,new ActionMessage("errors.dispProductPrice.none.productCode"));
				ActionMessagesUtil.addErrors(super.httpRequest, super.messages);
				return CommonAjaxResources.Mapping.ERROR_JSP;
			}
			this.rorderRestDetailList = this.productStockService.findRorderRestDetailByProductCode(dispProductStockForm.productCode);
			this.porderRestDetailList = this.productStockService.findPorderRestDetailByProductCode(dispProductStockForm.productCode);
			this.entrustPorderRestDetailList = this.productStockService.findEntrustPorderRestDetailByProductCode(dispProductStockForm.productCode);
			this.entrustStockDetailList = this.productStockService.findEntrustStockDetailByProductCode(dispProductStockForm.productCode);
		} catch (Exception e) {
			super.errorLog(e);

			// システム例外として処理する
			super.writeSystemErrorToResponse();
			return null;
		}
		return Mapping.RESULT;
	}

}
