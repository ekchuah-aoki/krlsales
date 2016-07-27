/*
 * Copyright 2009-2010 Ark Information Systems.
 */
package jp.co.arkinfosys.entity.join;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Entity;

/**
 * 製造年月日別用商品数量のリレーションエンティティクラスです.
 * 
 * @author 
 *
 */
@Entity
public class StockMadeDateQuantity {

	public Date madeDate;

	public BigDecimal quantity;

}
