package com.gyl.commons;

import org.springframework.stereotype.Component;

/**
 * 该系统所有的状态码
 * <p>
 * 1-->用户登录
 * <p>
 * 2-->系统状态
 */
@Component
public class StatusCode {
    /**
     * 用户相关
     * USER_EXIT 用户存在
     * USER_NOT_EXIT   用户不存在
     * USER_PASSWORD_ERROR 密码错误
     * USER_ACTIVE 用户状态未激活
     * USER_FREESON 用户被冻结
     * USER_NORMAL 用户正常
     * SUCCESS_LOGON 登录成功
     */
    public static final String USER_EXIT = "100";
    public static final String USER_NOT_EXIT = "101";
    public static final String USER_PASSWORD_ERROR = "102";
    public static final String USER_NOT_ACTIVE = "103";
    public static final String USER_NORMAL = "104";
    public static final String USER_FREESON = "105";
    public static final String SUCCESS_LOGON = "110";

    /**
     * 系统相关
     * SYSTEM_RUN   系统正常运行
     * SYSTEM_ERROR 系统内部错误
     * NOT_ASSCESS  权限不够
     */
    public static final String SYSTEM_RUN = "200";
    public static final String SYSTEM_ERROR = "201";
    public static final String NOT_ASSCESS = "202";


}
