package com.gyl.service;

import com.gyl.commons.UUIDString;
import com.gyl.commons.page.PageResult;
import com.gyl.entity.Comment;
import com.gyl.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author gyl
 */
@SuppressWarnings("all")
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

    /**
     * 分页的查询
     *
     * @param postId
     * @param currentPage
     * @param pageSize
     * @return
     */
    public PageResult pageCommentsByPostId(String postId, Integer currentPage, Integer pageSize) {
        List<Comment> comments = listCommentsByPostId(postId);
        int count = comments.size();
        PageResult pageResult = new PageResult(comments, count, currentPage, pageSize);
        int beginIndex = (currentPage - 1) * pageSize;
        int endIndex = ((currentPage - 1) * pageSize + pageSize) > (comments.size()) ? (comments.size()) : ((currentPage - 1) * pageSize + pageSize);
        for (int i = beginIndex; i < endIndex; i++) {
            pageResult.getNewPage().add(comments.get(i));
        }
        return pageResult;
    }
}
