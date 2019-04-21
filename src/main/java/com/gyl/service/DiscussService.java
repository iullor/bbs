package com.gyl.service;

import com.gyl.commons.UUIDString;
import com.gyl.commons.page.PageResult;
import com.gyl.entity.Praise;
import com.gyl.entity.Reply;
import com.gyl.mapper.PraiseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import com.gyl.mapper.DiscussMapper;
import com.gyl.entity.Discuss;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @author gyl
 */
@Service
@SuppressWarnings("all")
public class DiscussService {

    @Autowired
    private DiscussMapper discussMapper;

    @Autowired
    private PraiseMapper praiseMapper;

    @Autowired
    private ReplyService replyService;

    public int deleteById(String id) {

        return discussMapper.deleteById(id);
    }


    public int insert(Discuss discuss) {
        discuss.setId(UUIDString.createId());
        discuss.setCreateTime(new Date(System.currentTimeMillis()));
        discuss.setPraises(0);
        discuss.setDown(0);
        return discussMapper.insert(discuss);
    }


    public Discuss selectById(String id) {
        return discussMapper.selectById(id);
    }


    public int update(Discuss discuss) {
        return discussMapper.update(discuss);
    }


    public List<Discuss> listByTopicId(String topicId) {
        List<Discuss> discusses = discussMapper.listByTopicId(topicId);
        if (discusses.size() > 0) {
            for (Discuss discuss : discusses) {
                List<Reply> replies = replyService.listReplyByDiscussId(discuss.getId());
                discuss.setReplies(replies);
            }
        }
        return discusses;
    }

    public PageResult sortPageToDiscusses(List<Discuss> discusses, Integer currentPage, Integer pageSize) {
        int count = discusses.size();
        //需要怎么分,当前页是几,每页分几条,客户端传递过来,传给pageReasult对象,它帮你计算,下一个集合是什么
        PageResult pageResult = new PageResult(discusses, count, currentPage, pageSize);
        int beginIndex = (currentPage - 1) * pageSize;
        //动态设置索引,因为可能越界,这里判断如果索引大于总长度的话,就让他等于list集合的总长度
        int endIndex = ((currentPage - 1) * pageSize + pageSize) > (discusses.size()) ? (discusses.size()) : ((currentPage - 1) * pageSize + pageSize);
        //设置为空
        for (int i = beginIndex; i < endIndex; i++) {
            pageResult.getNewPage().add(discusses.get(i));
        }
        return pageResult;
    }

    /**
     * 点赞
     *
     * @param userId
     * @param postId
     * @return
     */
    public int add(String userId, String discussId) {
        Praise praise = new Praise();
        praise.setUserId(userId);
        praise.setDiscussId(discussId);
        return praiseMapper.add(praise);
    }

    public int deletePaise(String userId, String discussId) {
        return praiseMapper.deleteDiscussPaise(userId, discussId);
    }

    public int listPraiseById(String userId, String discussId) {
        return praiseMapper.listPraiseDiscussById(userId, discussId);
    }


}
