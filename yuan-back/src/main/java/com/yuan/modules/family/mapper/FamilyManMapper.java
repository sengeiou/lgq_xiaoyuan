package com.yuan.modules.family.mapper;

import com.yuan.modules.family.domain.FamilyMan;

import java.util.List;

/**
 * 家主基本 数据层
 *
 * @author lugongqi
 * @date 2019-01-27
 */
public interface FamilyManMapper {
    /**
     * 查询家主基本信息
     *
     * @param id 家主基本ID
     * @return 家主基本信息
     */
    public FamilyMan selectFamilyManById(Long id);

    /**
     * 查询家主基本列表
     *
     * @param familyMan 家主基本信息
     * @return 家主基本集合
     */
    public List<FamilyMan> selectFamilyManList(FamilyMan familyMan);

    /**
     * 新增家主基本
     *
     * @param familyMan 家主基本信息
     * @return 结果
     */
    public int insertFamilyMan(FamilyMan familyMan);

    /**
     * 修改家主基本
     *
     * @param familyMan 家主基本信息
     * @return 结果
     */
    public int updateFamilyMan(FamilyMan familyMan);

    /**
     * 删除家主基本
     *
     * @param id 家主基本ID
     * @return 结果
     */
    public int deleteFamilyManById(Long id);

    /**
     * 批量删除家主基本
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteFamilyManByIds(String[] ids);

}