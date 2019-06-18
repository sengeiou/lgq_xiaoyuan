package com.yuan.system.service;

import com.yuan.system.domain.ImportExcelResult;

import java.util.List;

/**
 * 1.校验数据的合法性
 * 2.初始化默认值
 * 3.保存数据库
 */
public interface IExcelImportService {

    /**
     * 导入保存
     * @param list
     * @param importType
     * @return 返回每行数据的导入结果
     */
    public ImportExcelResult saveData(List<Object> list, String importType);
}
