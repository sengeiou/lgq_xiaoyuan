package com.yuan.web.controller.system;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import com.yuan.common.config.Global;
import com.yuan.system.domain.SysMenu;
import com.yuan.system.domain.SysUser;
import com.yuan.system.service.ISysMenuService;
import com.yuan.web.core.base.BaseController;

/**
 * 首页 业务处理
 *
 * @author lws
 */
@Controller
public class IndexController extends BaseController {
    @Autowired
    private ISysMenuService menuService;

    /**
     * 系统首页
     */
    @GetMapping("/index")
    public String index(ModelMap mmap) {
        // 取身份信息
        SysUser user = getUser();
        // 根据用户id取出菜单
        List<SysMenu> menus = menuService.selectMenusByUser(user);
        mmap.put("menus", menus);
        mmap.put("user", user);
        mmap.put("copyrightYear", Global.getCopyrightYear());
        return "index";
    }

    /**
     * 系统介绍
     */
    @GetMapping("/system/main")
    public String main(ModelMap mmap) {
        mmap.put("version", Global.getVersion());
        return "main";
    }
}
