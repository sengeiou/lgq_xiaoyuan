package com.yuan.framework.web.exception.user;

/**
 * 用户锁定异常类
 *
 * @author lws
 */
public class UserBlockedException extends UserException {
    private static final long serialVersionUID = 1L;

    public UserBlockedException(String reason) {
        super("user.blocked", new Object[]{reason});
    }
}
