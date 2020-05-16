package com.gyl.mapper;

import com.gyl.entity.Discuss;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 *
 */
@Repository
public interface DiscussMapper {
    int deleteById(String id);

    int insert(Discuss discuss);

    /**
     * 查出来一条评论
     *
     * @param id
     * @return
     */
    Discuss selectById(String id);

    /**
     * 根据话题的id 查询所有的讨论
     *
     * @param topicId
     * @return
     */
    List<Discuss> listByTopicId(@Param("topicId") String topicId);


    int update(Discuss discuss);
}