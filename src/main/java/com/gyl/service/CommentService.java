package com.gyl.service;

import com.gyl.commons.UUIDString;
import com.gyl.entity.Comment;
import com.gyl.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author gyl
 */
@Service
public class CommentService {
    @Autowired
    private CommentMapper commentMapper;

    public int add(Comment comment) {
        comment.setId(UUIDString.createId());
        comment.setCreateTime(new Date(System.currentTimeMillis()));
        return commentMapper.add(comment);
    }

    public List<Comment> listCommentsByPostId(String postId) {
        return commentMapper.listCommentsByPostId(postId);
    }

}
