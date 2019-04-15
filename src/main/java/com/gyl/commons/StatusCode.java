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



    /*
     *
     * 用户申请的
     * 未读              0
     * 撤销             1
     * 待审核            2
     * 审核通过         3
     * 审核拒绝         4
     * 忽略(时间大于7天，状态变成超时)   5
     * 超时                  6
     *  状态，待审核，审核通过，审核拒绝，超时，忽略(时间大于7天，状态变成超时)
     * */

    public static final Integer UNREAD_CHECK = 0;
    public static final Integer CANCEL_CHECK = 1;
    public static final Integer WAIT_CHECK = 2;
    public static final Integer PASS_CHECK = 3;
    public static final Integer REFUSE_CHECK = 4;
    public static final Integer IGNORE_CHECK = 5;
    public static final Integer OVERTIEM_CHECK = 6;


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
    public static final String USER_NOT_ACTIVE = "0";
    public static final String USER_NORMAL = "1";
    public static final String USER_FREESON = "-1";
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



    /**
     * Panel 相关的
     */
    public static final String PANEL_EXIT = "2000";
    public static final String PANEL_NOT_EXIT = "2001";
    public static final String DELET_PANEL_ERROR = "2002";
    public static final String DELET_PANEL_SUCCESS = "2003";
    public static final String UPDATE_PANEL_ERROR = "2004";
    public static final String UPDATE_PANEL_SUCCESS = "2005";


    /**
     * collection收藏
     * <p>
     * 3000 关注用户成功
     * 3001 取消用户成功
     * <p>
     * 3002 收藏贴子成功
     * 3003 取消收藏贴子
     * <p>
     * 3004 关注板块成功
     * 3005 取消板块成功
     */
    public static final String COLLECT_USER_SUCCESS = "3000";
    public static final String CANCEL_USER_SUCCESS = "3001";
    public static final String COLLECT_POST_SUCCESS = "3002";
    public static final String CANCEL_POST_SUCCESS = "3003";
    public static final String COLLECT_AREA_SUCCESS = "3004";
    public static final String CANCEL_AREA__SUCCESS = "3005";


}
