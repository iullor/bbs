package com.gyl.mapper;

import com.gyl.entity.Comment;
import com.gyl.entity.Reply;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentMapper {
    int add(Comment comment);

    List<Comment> listCommentsByPostId(@Param("postId") String postId);

    int addReplyToComment(Reply reply);
}
