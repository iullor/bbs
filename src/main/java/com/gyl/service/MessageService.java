package com.gyl.service;

import com.gyl.commons.MessageType;
import com.gyl.entity.Comment;
import com.gyl.entity.Message;
import com.gyl.mapper.MessageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author gyl
 */
@Service
public class MessageService {
    @Autowired
    private MessageMapper messageMapper;

    public int sendCommentToUser(Comment comment, String postUserId) {
        Message message = new Message();
        message.setToUserId(postUserId);
        message.setFromUserId(comment.getUserId());
        message.setMessageType(MessageType.MESSAGE_COMMENT);
        message.setMessage(comment.getCommentContent());
        message.setCreateTime(new Date(System.currentTimeMillis()));
        message.setReadStatus(0);
        return messageMapper.sendCommentToUser(message);
    }

    /**
     * 按照状态返回消息集合
     *
     * @param userId
     * @return
     */
    public List<Message> listMyMessage(String userId, int readStatus) {
        return messageMapper.listMyMessage(userId, readStatus);
    }

    public int updateStatusById(Integer id, Integer readStatus) {
        return messageMapper.updateStatusById(id, readStatus);
    }
}
