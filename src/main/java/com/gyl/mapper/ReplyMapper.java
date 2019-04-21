package com.gyl.mapper;

import com.gyl.entity.Reply;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author gyl
 */
@Repository
public interface ReplyMapper {

    /**
     * 为评论添加回复
     *
     * @param reply
     * @return
     */
    int addReplyToComment(Reply reply);

    List<Reply> listReplyByCommentId(@Param("id") String id);

    /**
     * 根据讨论的id来查询所有的回复
     *
     * @param discussId
     * @return
     */
    List<Reply> listReplyByDiscussId(String discussId);
}
