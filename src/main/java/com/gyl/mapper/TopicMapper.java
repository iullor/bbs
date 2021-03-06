package com.gyl.mapper;

import com.gyl.entity.Topic;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 *
 */
@Repository
public interface TopicMapper {
    int deleteById(String id);

    int add(Topic topic);

    Topic selectById(String id);

    int update(Topic topic);

    List<Topic> selectByUserId(@Param("userId") String userId);

    List<Topic> list();

    /**
     * 显示热门的话题，不大于3个
     *
     * @return
     */
    List<Topic> listHotTopic();

    /**
     * 公共话题显示的所有话题
     *
     * @return
     */
    List<Topic> listTopics();

    /**
     * 找出所有的热门话题 6个
     *
     * @return
     */
    List<Topic> listHotTopicsPublic();

    /**
     * 根据话题名称模糊搜索
     * @param topicTitle
     * @return
     */
    List<Topic> listByTopicTitle(String topicTitle);

    List<Topic> getFocusUserTopic(String id);
}