package com.yuan.framework.web.exception.user;

/**
 * 角色锁定异常类
 *
 * @author lws
 */
public class RoleBlockedException extends UserException {
    private static final long serialVersionUID = 1L;

    public RoleBlockedException(String reason) {
        super("role.blocked", new Object[]{reason});
    }
}
