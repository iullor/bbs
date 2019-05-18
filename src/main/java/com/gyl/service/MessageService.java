package com.gyl.service;

import com.gyl.commons.MessageType;
import com.gyl.entity.*;
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

    /**
     * 给贴主，发一条信息，有人评论你了
     *
     * @param comment    评论的内容
     * @param postUserId 贴主的id
     * @return
     */
    public int sendCommentToUser(Comment comment, String postUserId) {
        Message message = new Message();
        message.setToUserId(postUserId);
        message.setFromUserId(comment.getUserId());
        message.setMessageType(MessageType.MESSAGE_COMMENT);
        message.setMessage(comment.getCommentContent());
        message.setCreateTime(new Date(System.currentTimeMillis()));
        message.setReadStatus(0);
        return messageMapper.sendMessages(message);
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

    /**
     * 后台管理员审核后，发送一条提醒信息给申请者
     *
     * @param option       操作的状态
     * @param handleUserId 来自谁的
     * @return
     */
    public int sendApplyMessage(Option option, String handleUserId) {
        //逻辑，什么东西，怎么样了，发送给谁
        //1，先判断是什么东西
        String postId = option.getPostId();
        String boardId = option.getBoardId();
        String topicId = option.getTopicId();
        String things = "";
        if (postId != null) {
            //贴子
            things = "贴子置顶";
        }
        if (boardId != null) {
            //板块
            things = "申请的板主";
        }
        if (topicId != null) {
            //分区
            things = "申请话题置顶";
        }

        String handledMessges = "";
        //2，根据状态，去判断发送什么样的信息
        Integer status = option.getStatus();
        if (status == 3) {
            //pass
            handledMessges = "通过";
        }
        if (status == 4) {
            //被拒绝
            handledMessges = "失败";
        }
        if (status == 5) {
            //正在处理中，前台可能点击了忽略
            handledMessges = "正在处理中，请等待";
        }
        //3，附加消息
        String remakes = option.getRemakes();
        //4，拼接所有的信息
        String checkMessages = things + "  >>" + handledMessges + "    备注：" + remakes;
        //5,谁发给谁发送给谁
        String applyUserId = option.getApplyUserId();
        //封装成一个消息对象
        Message message = new Message();
        message.setFromUserId(handleUserId);
        message.setToUserId(applyUserId);
        message.setMessageType(MessageType.MESSAGE_CHECK);
        message.setCreateTime(new Date(System.currentTimeMillis()));
        message.setReadStatus(0);
        message.setMessage(checkMessages);
        //6，发送
        return messageMapper.sendMessages(message);
    }

    /**
     * 发送违规信息
     *
     * @param message
     * @return
     */
    public int sendBrokenRulesMessage(Message message) {
        return messageMapper.sendMessages(message);
    }

    /**
     * 回复成功发送一条消息,封装成消息对象
     *
     * @param reply
     * @return
     */
    public int sendReplyToUser(Reply reply) {
        Message message = new Message();
        message.setFromUserId(reply.getFromUserId());
        message.setReadStatus(0);
        message.setToUserId(reply.getToUserId());
        message.setCreateTime(new Date(System.currentTimeMillis()));
        message.setMessageType(MessageType.COMMENT_REPLY);
        message.setMessage(reply.getReplyContent());
        return messageMapper.sendMessages(message);
    }

    /**
     * 讨论信息
     *
     * @param discuss
     * @param toUserId
     * @return
     */
    public int sendDiscussToTopicOwner(Discuss discuss, String toUserId) {
        Message message = new Message();
        message.setFromUserId(discuss.getUserId());
        message.setReadStatus(0);
        message.setToUserId(toUserId);
        message.setCreateTime(new Date(System.currentTimeMillis()));
        message.setMessageType(MessageType.MESSAGE_DISCUSS);
        message.setMessage(discuss.getDiscussContent());
        return messageMapper.sendMessages(message);

    }
}
