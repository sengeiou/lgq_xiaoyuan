package com.yuan.modules.warn.service;


import com.yuan.modules.warn.domain.Warn;

import java.util.List;

/**
 * 这是重要时间提醒 服务层
 *
 * @author lugongqi
 * @date 2019-02-18
 */
public interface IWarnService {

    /**
     * 查询这是重要时间提醒信息
     *
     * @param id 这是重要时间提醒ID
     * @return 这是重要时间提醒信息
     */
    public Warn selectWarnById(Integer id);

    /**
     * 查询这是重要时间提醒列表
     *
     * @param warn 这是重要时间提醒信息
     * @return 这是重要时间提醒集合
     */
    public List<Warn> selectWarnList(Warn warn);

    /**
     * 新增这是重要时间提醒
     *
     * @param warn 这是重要时间提醒信息
     * @return 结果
     */
    public int insertWarn(Warn warn);

    /**
     * 修改这是重要时间提醒
     *
     * @param warn 这是重要时间提醒信息
     * @return 结果
     */
    public int updateWarn(Warn warn);

    /**
     * 删除这是重要时间提醒信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteWarnByIds(String ids);

    /**
     * 是否需要
     */
    public List<Warn> sendQuarzMessage(Integer id);

}
