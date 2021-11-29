package com.atguigu.crowd.exception;

/**
 * @author gxl
 * @description 保存或者更新Admin时如果检测到登录帐号重复抛出这个异常
 * @createDate 2021/11/3 16:27
 */
public class LoginAcctAlreadyInUseForUpdateException extends RuntimeException{
    public LoginAcctAlreadyInUseForUpdateException() {
    }

    public LoginAcctAlreadyInUseForUpdateException(String message) {
        super(message);
    }

    public LoginAcctAlreadyInUseForUpdateException(String message, Throwable cause) {
        super(message, cause);
    }

    public LoginAcctAlreadyInUseForUpdateException(Throwable cause) {
        super(cause);
    }

    public LoginAcctAlreadyInUseForUpdateException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
