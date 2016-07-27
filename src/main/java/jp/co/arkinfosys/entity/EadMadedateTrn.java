/*
 * Copyright 2009-2010 Ark Information Systems.
 */
package jp.co.arkinfosys.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * 入出庫伝票製造年月日明細のエンティティクラスです.
 *
 * @author 
 *
 */
@Entity
public class EadMadedateTrn implements Serializable {

    private static final long serialVersionUID = 1L;

    public static final String TABLE_NAME = "EAD_MADEDATE_TRN";

	@Id
	public Integer eadMadedateId;

	public Integer eadSlipId;

	public String productCode;

	public String rackCode;

	public Date madeDate;

	public BigDecimal quantity;

	public String creFunc;

	public Timestamp creDatetm;

	public String creUser;

	public String updFunc;

	public Timestamp updDatetm;

	public String updUser;
}