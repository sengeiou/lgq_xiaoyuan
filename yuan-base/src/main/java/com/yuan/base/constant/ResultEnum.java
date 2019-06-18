/*
 * All rights Reserved, Designed By DataDriver
 * Copyright:    Copyright(C) DataDriver
 * Company:      Zhuo Wo Infomation Technology (ShangHai) CO.LTD
 */
package com.yuan.base.constant;

public enum ResultEnum {
	SUCCESS("1", "成功"), FAIL("0", "失败"), ERROR("2", "错误");
	
	private String	value;
	private String	text;
	
	private ResultEnum(String value, String text) {
		this.value = value;
		this.text = text;
	}
	
	public String getValue() {
		return value;
	}

	public String getText() {
		return text;
	}

}