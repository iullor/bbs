package com.gyl.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gyl.commons.UUIDString;
import com.gyl.commons.page.PageResult;
import com.gyl.entity.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import com.gyl.mapper.TopicMapper;
import com.gyl.entity.Topic;

import java.util.Date;
import java.util.List;

/**
 *
 */
@Service
public class TopicService {

    @Autowired
    private TopicMapper topicMapper;


    public int deleteById(String id) {
        return topicMapper.deleteById(id);
    }

    public int add(Topic topic) {
        topic.setId(UUIDString.createId());
        topic.setCreateTime(new Date(System.currentTimeMillis()));
        topic.setLevel(0);
        topic.setTopicParticipations(0);
        topic.setTopicSeen(0);
        return topicMapper.add(topic);
    }


    public Topic selectById(String id) {
        return topicMapper.selectById(id);
    }


    public int update(Topic topic) {
        return topicMapper.update(topic);
    }

    public List<Topic> selectByUserId(String userId) {
        return topicMapper.selectByUserId(userId);
    }

    public List<Topic> list() {

        return topicMapper.list();
    }

    /**
     * @param topics      所有的话题
     * @param currentPage
     * @param pageSize
     * @return
     */
    @SuppressWarnings("all")
    public PageResult sortPageByAdmin(List<Topic> topics, Integer currentPage, Integer pageSize) {
        int count = topics.size();
        //需要怎么分,当前页是几,每页分几条,客户端传递过来,传给pageReasult对象,它帮你计算,下一个集合是什么
        PageResult pageResult = new PageResult(topics, count, currentPage, pageSize);
        int beginIndex = (currentPage - 1) * pageSize;
        //动态设置索引,因为可能越界,这里判断如果索引大于总长度的话,就让他等于list集合的总长度
        int endIndex = ((currentPage - 1) * pageSize + pageSize) > (topics.size()) ? (topics.size()) : ((currentPage - 1) * pageSize + pageSize);
        //设置为空
        for (int i = beginIndex; i < endIndex; i++) {
            pageResult.getNewPage().add(topics.get(i));
        }
        return pageResult;
    }

    public List<Topic> listHotTopic() {
        return topicMapper.listHotTopic();
    }


    /**
     * 公共板块展示的
     *
     * @return
     */
    public List<Topic> listTopics() {
        return topicMapper.listTopics();
    }

    /**
     * 展示热门的话题6 个
     *
     * @return
     */
    public List<Topic> listHotTopicsPublic() {
        return topicMapper.listHotTopicsPublic();
    }

    public List<Topic> listByTopicTitle(String topicTitle) {
        return topicMapper.listByTopicTitle(topicTitle);
    }

    public List<Topic> getFocusUserTopic(String id) {

        return topicMapper.getFocusUserTopic(id);
    }
}
