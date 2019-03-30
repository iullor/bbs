package com.gyl.service;

import com.gyl.commons.UUIDString;
import com.gyl.entity.Reply;
import com.gyl.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author gyl
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
}
