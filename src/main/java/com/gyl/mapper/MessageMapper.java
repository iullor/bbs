package com.gyl.mapper;

import com.gyl.entity.Message;
import com.gyl.entity.Reply;
import org.apache.ibatis.annotations.Param;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author gyl
 */
@Repository
public interface MessageMapper {

    List<Message> listMyMessage(@Param("userId") String userId, @Param("readStatus") int readStatus);

    /**
     * 发送一条评论信息
     *
     * @param message
     * @return
     */
    int sendCommentToUser(Message message);

    int updateStatusById(@Param("id") Integer id, @Param("readStatus") Integer readStatus);

    /**
     * 发送一条审核信息
     *
     * @param message
     * @return
     */
    int sendCheckMessage(Message message);

    int sendBrokenRulesMessage(Message message);

    /**
     * 回复发送消息
     *
     * @param message
     * @return
     */
    int sendReplyToUser(Message message);

    int sendMessages(Message message);
}
