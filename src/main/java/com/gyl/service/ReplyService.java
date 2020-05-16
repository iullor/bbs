package com.gyl.service;

import com.gyl.commons.UUIDString;
import com.gyl.entity.Reply;
import com.gyl.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 *
 */
@Service
public class ReplyService {
    @Autowired
    private ReplyMapper replyMapper;

    public List<Reply> listReplyByCommentId(String id) {
        return replyMapper.listReplyByCommentId(id);
    }


    /**
     * 为评论添加回复
     *
     * @param reply
     * @return
     */
    public int addReplyToComment(Reply reply) {
        reply.setId(UUIDString.createId());
        reply.setCreateTime(new Date(System.currentTimeMillis()));
        return replyMapper.addReplyToComment(reply);
    }

    /**
     * 根据discussId来查一个集合
     *
     * @param discussId
     * @return
     */
    public List<Reply> listReplyByDiscussId(String discussId) {
        return replyMapper.listReplyByDiscussId(discussId);
    }

    /**
     * 为话题添加回复
     *
     * @param reply
     * @return
     */
    public int addReplyToDiscuss(Reply reply) {
        reply.setId(UUIDString.createId());
        reply.setCreateTime(new Date(System.currentTimeMillis()));
        return replyMapper.addReplyToComment(reply);
    }


}
