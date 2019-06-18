package com.yuan.modules.warn.service;

import com.yuan.modules.warn.domain.Warn;
import com.yuan.modules.warn.mapper.WarnMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yuan.common.support.Convert;

import java.util.List;

/**
 * 这是重要时间提醒 服务层实现
 *
 * @author lugongqi
 * @date 2019-02-18
 */
@Service
public class WarnServiceImpl implements IWarnService {

    @Autowired
    private WarnMapper warnMapper;

    /**
     * 查询这是重要时间提醒信息
     *
     * @param id 这是重要时间提醒ID
     * @return 这是重要时间提醒信息
     */
    @Override
    public Warn selectWarnById(Integer id) {
        return warnMapper.selectWarnById(id);
    }

    /**
     * 查询这是重要时间提醒列表
     *
     * @param warn 这是重要时间提醒信息
     * @return 这是重要时间提醒集合
     */
    @Override
    public List<Warn> selectWarnList(Warn warn) {
        return warnMapper.selectWarnList(warn);
    }

    /**
     * 新增这是重要时间提醒
     *
     * @param warn 这是重要时间提醒信息
     * @return 结果
     */
    @Override
    public int insertWarn(Warn warn) {
        return warnMapper.insertWarn(warn);
    }

    /**
     * 修改这是重要时间提醒
     *
     * @param warn 这是重要时间提醒信息
     * @return 结果
     */
    @Override
    public int updateWarn(Warn warn) {
        return warnMapper.updateWarn(warn);
    }

    /**
     * 删除这是重要时间提醒对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果 /usr/local/mydata/jdk-8u181-linux-x64.tar.gz
     */
    @Override
    public int deleteWarnByIds(String ids) {
        return warnMapper.deleteWarnByIds(Convert.toStrArray(ids));
    }

    @Override
    public List<Warn> sendQuarzMessage(Integer id) {
        return warnMapper.selectNeedWarn(id);
    }
}
