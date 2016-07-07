/*
 * Copyright 2009-2010 Ark Information Systems.
 */
package jp.co.arkinfosys.dto;

import java.io.Serializable;

import org.seasar.framework.container.annotation.tiger.Component;
import org.seasar.framework.container.annotation.tiger.InstanceType;

import jp.co.arkinfosys.dto.master.MasterEditDto;
/**
 * Pbx情報を管理するDTOクラスです.
 *
 * @author 
 *
 */
@Component(instance = InstanceType.SESSION)
public class PbxDto implements Serializable, MasterEditDto {

	private static final long serialVersionUID = -1067384075862675355L;

	public String customerCode;
	public String customerName;

	public boolean pbxMode = false;


	/**
	 * 顧客コードを返します.
	 * @return　顧客コード
	 */
	@Override
	public String[] getKeys() {
		return new String[] { this.customerCode };
	}



}