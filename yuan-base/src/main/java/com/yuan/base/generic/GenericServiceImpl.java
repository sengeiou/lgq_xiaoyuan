/*
 * All rights Reserved, Designed By DataDriver
 * Copyright:    DataDriver.Inc
 * Company:      Zhuo Wo Infomation Technology (ShangHai) CO.LTD
 */
package com.yuan.base.generic;


import com.yuan.base.exception.TipException;

/**
 * GenericServiceImpl 抽象GenericService的实现类
 *
 * @Action 自定义 ServiceImpl, 继承自它,可以获得常用的增删查改操作,其他实现的方法由子类各自实现
 * @Description Model : 代表数据库中的表 映射的Java对象类型;PK :代表对象的主键类型
 */
public abstract class GenericServiceImpl<Model, PK> implements GenericService<Model, PK> {

    /**
     * 定义成抽象方法,由子类实现,完成dao的注入
     *
     * @return GenericDao实现类
     */
    public abstract GenericMapper<Model, PK> getDao();

    /**
     * 插入对象
     *
     * @param model 对象
     */
    @Override
    public int insert(Model model) throws TipException {
        return getDao().insertSelective(model);
    }

    /**
     * 更新对象
     *
     * @param model 对象
     */
    @Override
    public int update(Model model) throws TipException {
        return getDao().updateByPrimaryKeySelective(model);
    }

    /**
     * 通过主键, 删除对象
     *
     * @param id 主键
     */
    @Override
    public int delete(PK id) throws TipException {
        return getDao().deleteByPrimaryKey(id);
    }

    /**
     * 通过主键, 查询对象
     *
     * @param id 主键
     * @return
     */
    @Override
    public Model selectById(PK id) throws TipException {
        return getDao().selectByPrimaryKey(id);
    }
}
