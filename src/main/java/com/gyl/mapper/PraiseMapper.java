package com.gyl.mapper;

import com.gyl.entity.Praise;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * 点赞的表
 */
@Repository
public interface PraiseMapper {

    int deletePostPaise(@Param("userId") String userId, @Param("postId") String postId);

    int deleteDiscussPaise(@Param("userId") String userId, @Param("discussId") String discussId);

    int listPraisePostById(@Param("userId") String userId, @Param("postId") String postId);

    int listPraiseDiscussById(@Param("userId") String userId, @Param("discussId") String discussId);

    int add(Praise praise);
}
