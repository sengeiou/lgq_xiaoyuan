package com.yuan.model.warn.domain;

import com.yuan.common.base.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * 这是重要时间提醒表 matter_warn
 * 
 * @author lugongqi
 * @date 2019-02-18
 */
@Data
@ToString
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
public class Warn extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	private Integer id;
	/**
	 * 备注
	 */
	private String matter;
	/**
	 * 开始时间
	 */
	private String beginTime;
	/**
	 * 结束时间
	 */
	private String endTime;
	/**
	 * 用户id
	 */
	private Long userId;
	/**
	 * 用户id
	 */
	private String startUsing;
	/**
	 * 提醒时间
	 */
	private String warnTime;

	/**
	 *  提示信息需要用户信息
	 */
	private String userName;
	private String loginName;
	private String email;
	private String phonenumber;

}

