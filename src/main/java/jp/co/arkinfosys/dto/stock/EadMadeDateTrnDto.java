/*
 * Copyright 2009-2010 
 */
package jp.co.arkinfosys.dto.stock;

import java.io.Serializable;
import java.sql.Timestamp;

import jp.co.arkinfosys.common.StringUtil;
import jp.co.arkinfosys.dto.AbstractLineDto;

/**
 * 入出庫伝票製造年月日明細情報を管理するDTOクラスです.
 * @author 
 * 
 */
public class EadMadeDateTrnDto extends AbstractLineDto implements Serializable {

	private static final long serialVersionUID = 1L;

	public String eadSlipId;

	public String productCode;

	public String rackCode;

	public String madeDate;

	public String quantity;

	public String creFunc;

	public Timestamp creDatetm;

	public String creUser;

	public String updFunc;

	public Timestamp updDatetm;

	public String updUser;


	/**
	 * 空行かどうか判定します.
	 * @return true空行　false:空行でない
	 */
	public boolean isEmpty() {
		if (StringUtil.hasLength(productCode) || StringUtil.hasLength(rackCode)
				|| StringUtil.hasLength(madeDate)
				|| StringUtil.hasLength(quantity)
		) {
			return false;
		}
		return true;
	}

	/**
	 * 商品コードがnull又は空白かどうか検査します.
	 * @return true:商品コーがnullまたは空白　false:商品コードはnullでも空白でもない
	 */
	@Override
	public boolean isBlank() {
		if (StringUtil.hasLength(productCode)) {
			return false;
		}
		return true;
	}

	/**
	 * 出庫情報のDTOから入庫情報のDTOを作成します.
	 * @return 入庫明細行情報のDTO
	 */
	public EadMadeDateTrnDto createStockDto() {
		EadMadeDateTrnDto stockLineDto = new EadMadeDateTrnDto();
		// 共通
		stockLineDto.eadSlipId = this.eadSlipId;
		stockLineDto.productCode = this.productCode;
		stockLineDto.rackCode = this.rackCode;
		stockLineDto.madeDate = this.madeDate;
		stockLineDto.quantity = this.quantity;
		stockLineDto.creFunc = this.creFunc;
		stockLineDto.creDatetm = this.creDatetm;
		stockLineDto.creUser = this.creUser;
		stockLineDto.updFunc = this.updFunc;
		stockLineDto.updDatetm = this.updDatetm;
		stockLineDto.updUser = this.updUser;

		return stockLineDto;
	}

}