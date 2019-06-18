package com.yuan.web.controller.mobile;

import com.yuan.common.base.AjaxResult;
import com.yuan.common.utils.StringUtils;
import com.yuan.framework.shiro.service.PasswordService;
import com.yuan.framework.util.ShiroUtils;
import com.yuan.modules.warn.domain.Warn;
import com.yuan.modules.warn.service.IWarnService;
import com.yuan.system.domain.SysUser;
import com.yuan.system.service.ISysDictDataService;
import com.yuan.system.service.ISysRoleService;
import com.yuan.system.service.ISysUserService;
import com.yuan.web.core.base.BaseController;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;

@CrossOrigin
@RestController
@RequestMapping("mobile")
public class MobileUserController extends BaseController {

    @Autowired
    ISysRoleService roleService;
    @Autowired
    private PasswordService passwordService;
    @Autowired
    private ISysUserService userService;
    @Autowired
    private ISysDictDataService dictDataService;
    @Autowired
    private IWarnService warnService;

    @PostMapping("/user/add")
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult addSave(SysUser user) {
        user.setSalt(ShiroUtils.randomSalt());
        user.setPassword(passwordService.encryptPassword(user.getLoginName(), user.getPassword(), user.getSalt()));
        //user.setCreateBy(ShiroUtils.getLoginName());
        return toAjax(userService.insertUser(user));
    }

    /**
     * 个人信息一
     */
    @GetMapping("/user/profile/issur")
    public SysUser profile() {
        SysUser user = getUser();
        user.setSex(dictDataService.selectDictLabel("sys_user_sex", user.getSex()));
        return user;
    }

    /**
     * 个人信息二 代替方案
     */
    @GetMapping("/user/profile")
    public SysUser profileIssur(Long userId) {
        SysUser user = userService.selectUserById(userId);
        user.setSex(dictDataService.selectDictLabel("sys_user_sex", user.getSex()));
        //mmap.put("user", user);
        //mmap.put("roleGroup", userService.selectUserRoleGroup(user.getUserId()));
        //mmap.put("postGroup", userService.selectUserPostGroup(user.getUserId()));
        return user;
    }

    @PostMapping("/login")
    @ResponseBody
    public AjaxResult ajaxLogin(String username, String password, Boolean rememberMe) {
        UsernamePasswordToken token = new UsernamePasswordToken(username, password, rememberMe);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
            SysUser user = ShiroUtils.getUser(subject);
            user.setJbdms(roleService.queryDataScopeJbdmByUserId(user.getUserId()));
            ShiroUtils.setUser(user);
            return success();
        } catch (AuthenticationException e) {
            String msg = "用户或密码错误";
            if (StringUtils.isNotEmpty(e.getMessage())) {
                msg = e.getMessage();
            }
            return error(msg);
        }
    }


    /**
     * 添加事项
     */
    /**
     * 新增保存这是重要时间提醒
     */
    @PostMapping("/addMatter")
    @ResponseBody
    public AjaxResult addSave(String matter,
                              String userId,
                              String warnTime,
                              String remark,
                              String startUsing ) {
        Warn warn = new Warn();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        warn.setUserId(Long.valueOf(userId)).setWarnTime(warnTime)
                .setRemark(remark);
        warn.setMatter(matter).setStartUsing(startUsing);
        //warn.setUserId(getUserId().intValue());
        return toAjax(warnService.insertWarn(warn));
    }
}
