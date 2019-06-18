package com.yuan.model.warn.mapper;

import com.yuan.model.warn.domain.Warn;
import java.util.List;

/**
 * 这是重要时间提醒 数据层
 *
 * @author lugongqi
 * @date 2019-02-18
 */
public interface WarnMapper {
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
     * 删除这是重要时间提醒
     *
     * @param id 这是重要时间提醒ID
     * @return 结果
     */
    public int deleteWarnById(Integer id);

    /**
     * 批量删除这是重要时间提醒
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteWarnByIds(String[] ids);

    public List<Warn> selectNeedWarn(Integer id);
}