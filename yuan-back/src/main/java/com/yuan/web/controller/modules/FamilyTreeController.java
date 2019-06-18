package com.yuan.web.controller.modules;

import com.yuan.common.annotation.Log;
import com.yuan.common.base.AjaxResult;
import com.yuan.common.enums.BusinessType;
import com.yuan.framework.web.page.TableDataInfo;
import com.yuan.model.family.domain.FamilyMan;
import com.yuan.model.family.service.Interface.IFamilyManService;
import com.yuan.web.core.base.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/family")
public class FamilyTreeController extends BaseController {

    private String prefix = "modules/family/familyMan";

    @Autowired
    private IFamilyManService familyManService;

    @RequiresPermissions("module:baseInfo:view")
    @GetMapping("/familyMan")
    public String baseInfo() {
        return prefix + "/baseInfo";
    }

    /**
     * 查询家主基本列表
     */
    @RequiresPermissions("module:baseInfo:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(FamilyMan familyMan) {
        startPage();
        List<FamilyMan> list = familyManService.selectFamilyManList(familyMan);
        return getDataTable(list);
    }

    /**
     * 新增家主基本
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存家主基本
     */
    @RequiresPermissions("module:baseInfo:add")
    @Log(title = "家主基本", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(FamilyMan familyMan) {
        return toAjax(familyManService.insertFamilyMan(familyMan));
    }

    /**
     * 修改家主基本
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        FamilyMan baseInfo = familyManService.selectFamilyManById(id);
        mmap.put("baseInfo", baseInfo);
        return prefix + "/edit";
    }

    /**
     * 修改保存家主基本
     */
    @RequiresPermissions("module:baseInfo:edit")
    @Log(title = "家主基本", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(FamilyMan familyMan) {
        return toAjax(familyManService.updateFamilyMan(familyMan));
    }

    /**
     * 删除家主基本
     */
    @RequiresPermissions("module:baseInfo:remove")
    @Log(title = "家主基本", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(familyManService.deleteFamilyManByIds(ids));
    }
}
