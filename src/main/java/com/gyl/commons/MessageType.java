package com.gyl.commons;

import org.springframework.stereotype.Component;

/**
 * @author gyl
 */
@Component
public class MessageType {

    /**
     * collect   收藏       0
     * 被收藏                  01
     * 收藏贴子失效             02
     * 收藏分区失效             03
     * user  关注           1
     * 被关注                  01
     * 关注失效                02
     * 关注用户失效             03
     * post  贴子           2
     * <p>                    01 被评论
     *                        02话题被评论
     * board  板块                                             3
     *
     * panel  模块                                             4
     * <p>
     * area    分区                                            5
     *
     * comment 评论          6
     *                          01 被回复
     *
     *
     * 系统，更新功能 提醒                                        7
     * <p>
     * <p>
     * 系统警告                                                 8
     *
     * 系统管理人员回复        9
     *                          01 审核信息
     * 账号操作信息，异常提醒                                     10
     */

    /**
     * 被收藏
     */
    public static final String MESSAGE_COLLECTED_BY_OTHER = "101";
    /**
     * 被评论
     */
    public static final String MESSAGE_COMMENT = "201";
    public static final String MESSAGE_DISCUSS = "202";

    /**
     * 系统
     */
    public static final String MESSAGE_SYSTEM_INFO = "301";

    /**
     * 系统审核
     */
    public static final String MESSAGE_CHECK = "901";


    /**
     * 评论
     */
    public static final String COMMENT_REPLY = "601";


}
