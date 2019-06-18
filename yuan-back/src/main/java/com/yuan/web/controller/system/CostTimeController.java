package com.yuan.web.controller.system;

import java.util.List;

import com.yuan.common.annotation.Log;
import com.yuan.common.base.AjaxResult;
import com.yuan.common.enums.BusinessType;
import com.yuan.framework.aspectj.CountResponseTime;
import com.yuan.system.domain.CostTime;
import com.yuan.system.service.ICostTimeService;
import com.yuan.system.service.ISysOperLogService;
import com.yuan.web.core.base.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.yuan.framework.web.page.TableDataInfo;

/**
 * 系统响应时间统计记录（方便对响应时间长的进行优化） 信息操作处理
 *
 * @author lws
 * @date 2018-10-25
 */
@Controller
@RequestMapping("/system/costTime")
public class CostTimeController extends BaseController {
    private String prefix = "system/costTime";

    @Autowired
    private ICostTimeService costTimeService;
    @Autowired
    private ISysOperLogService operLogService;

    @RequiresPermissions("system:costTime:view")
    @GetMapping()
    public String costTime(ModelMap modelMap) {
        modelMap.put("CONDITION_TIME", CountResponseTime.CONDITION_TIME);
        return prefix + "/costTime";
    }

    /**
     * 查询系统响应时间统计记录（方便对响应时间长的进行优化）列表
     */
    @RequiresPermissions("system:costTime:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CostTime costTime) {
        startPage();
        List<CostTime> list = costTimeService.selectCostTimeList(costTime);
        return getDataTable(list);
    }

    /**
     * 删除系统响应时间统计记录（方便对响应时间长的进行优化）
     */
    @RequiresPermissions("system:costTime:remove")
    @Log(title = "系统响应时间统计记录", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(costTimeService.deleteCostTimeByIds(ids));
    }

    /**
     * 删除系统响应时间统计记录（方便对响应时间长的进行优化）
     */
    @RequiresPermissions("system:costTime:remove")
    @Log(title = "系统响应时间统计记录", businessType = BusinessType.CLEAN)
    @PostMapping("/clean")
    @ResponseBody
    public AjaxResult clean(String ids) {
        operLogService.cleanTable("sys_cost_time");
        return toAjax(1);
    }

}
