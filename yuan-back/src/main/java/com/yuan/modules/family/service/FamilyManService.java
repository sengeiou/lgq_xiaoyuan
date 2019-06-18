package com.yuan.modules.family.service;

import com.yuan.common.support.Convert;
import com.yuan.modules.family.domain.FamilyMan;
import com.yuan.modules.family.mapper.FamilyManMapper;
import com.yuan.modules.family.service.Interface.IFamilyManService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 家主基本 服务层实现
 *
 * @author lugongqi
 * @date 2019-01-27
 */
@Service
public class FamilyManService implements IFamilyManService {

    @Resource
    private FamilyManMapper familyManMapper;


    @Override
    public List<FamilyMan> selectFamilyManList(FamilyMan familyMan) {
        return familyManMapper.selectFamilyManList(familyMan);
    }

    @Override
    public int insertFamilyMan(FamilyMan familyMan) {
        return familyManMapper.insertFamilyMan(familyMan);
    }

    @Override
    public int updateFamilyMan(FamilyMan familyMan) {
        return familyManMapper.updateFamilyMan(familyMan);
    }


    /**
     * 查询家主基本信息
     *
     * @param id 家主基本ID
     * @return 家主基本信息
     */
    @Override
    public FamilyMan
    selectFamilyManById(Long id) {
        return familyManMapper.selectFamilyManById(id);
    }


    /**
     * 删除家主基本对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteFamilyManByIds(String ids) {
        return familyManMapper.deleteFamilyManByIds(Convert.toStrArray(ids));
    }

}
