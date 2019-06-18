/*
 * All rights Reserved, Designed By DataDriver
 * Copyright:    DataDriver.Inc
 * Company:      Zhuo Wo Infomation Technology (ShangHai) CO.LTD
 */
package com.yuan.base.generic;


import com.yuan.base.exception.TipException;

/**
 * GenericService Service的顶级接口
 *
 * @Action 所有自定义Service的顶级接口, 封装常用的增删查改操作
 * @Description Model : 代表数据库中的表 映射的Java对象类型;PK :代表对象的主键类型
 */
public interface GenericService<Model, PK> {

    /**
     * 插入对象
     *
     * @param model 对象
     */
    int insert(Model model) throws TipException;

    /**
     * 更新对象
     *
     * @param model 对象
     */
    int update(Model model) throws TipException;

    /**
     * 通过主键, 删除对象
     *
     * @param id 主键
     */
    int delete(PK id) throws TipException;

    /**
     * 通过主键, 查询对象
     *
     * @param id 主键
     * @return model 对象
     */
    Model selectById(PK id) throws TipException;
}
