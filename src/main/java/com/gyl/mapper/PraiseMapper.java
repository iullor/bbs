package com.gyl.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * @author gyl
 * 点赞的表
 */
@Repository
public interface PraiseMapper {

    int add(@Param("userId") String userId, @Param("postId") String postId);

    int deletePaise(@Param("userId") String userId, @Param("postId") String postId);

    int listPraiseById(@Param("userId") String userId, @Param("postId") String postId);
}
