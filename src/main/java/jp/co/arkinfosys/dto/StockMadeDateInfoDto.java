/*
 * Copyright 2009-2010 Ark Information Systems.
 */
package jp.co.arkinfosys.dto;

import java.io.Serializable;
import java.text.DecimalFormat;

import jp.co.arkinfosys.common.NumberUtil;

/**
 * 製造年月日別在庫数情報を管理するDTOクラスです.
 *
 * @author Ark Information Systems
 *
 */
public class StockMadeDateInfoDto implements Serializable {

	private static final long serialVersionUID = 1L;

	private DecimalFormat commaQuantityFormat = NumberUtil.createDecimalFormat(0, true);

	/**
	 * 製造年月日
	 */
	public String madeDate = "";

	/**
	 * 現在庫総数
	 */
	public int currentTotalQuantity = 0;


	/**
	 * カンマ付きフォーマットの現在庫総数を取得します.
	 * @return   カンマ付きフォーマットの現在庫総数
	 */
	public String getFormattedCurrentTotalQuantity() {
		return this.formatQuantity(this.currentTotalQuantity);
	}


	/**
	 * 数値をカンマ付きフォーマットに変換します.
	 * @param quantity 数値
	 * @return カンマ付きフォーマットの数値
	 */
	private String formatQuantity(int quantity) {
		return this.commaQuantityFormat.format(quantity);
	}

	/**
	 * 数量のフォーマットオプションを設定します.
	 * @param fractCategory 端数処理コード
	 * @param alignment　小数桁数
	 */
	public void setQuantityFormatOptions(String fractCategory, int alignment) {
		this.commaQuantityFormat = NumberUtil.createDecimalFormat(fractCategory, alignment, true);
	}
}
