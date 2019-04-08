package com.gyl.service;

import com.gyl.commons.UUIDString;
import com.gyl.entity.Post;
import com.gyl.entity.PostType;
import com.gyl.entity.Praise;
import com.gyl.mapper.CollectionMapper;
import com.gyl.mapper.PostMapper;
import com.gyl.mapper.PostTypeMapper;
import com.gyl.mapper.PraiseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author gyl
 * <p>
 * 两用，post和posttype
 */
@Service
public class PostService {
    @Autowired
    private PostMapper postMapper;

    @Autowired
    private PostTypeMapper postTypeMapper;

    @Autowired
    private CollectionMapper collectionMapper;
    @Autowired
    private PraiseMapper praiseMapper;


    public int addPostType(PostType postType) {
        return postTypeMapper.addPostType(postType);
    }

    public int updatePostType(PostType postType) {
        return postTypeMapper.updatePostType(postType);
    }

    public int deletePostType(String id) {
        return postTypeMapper.deletePostType(id);
    }

    public List<PostType> listPostType() {
        return postTypeMapper.listPostType();
    }

    public Post selectPostById(String id) {
        return postMapper.listById(id);
    }


    public int addPost(Post post) {
        //为post设置一些初始化信息
        post.setId(UUIDString.createId());
        post.setCreateTime(new Date(System.currentTimeMillis()));
        post.setPraises(0);
        post.setParticipants(0);

        //设置不禁止评论
        post.setBanComment(0);
        //设置不置顶
        post.setUp(0);
        //设置评论的数量
        post.setComm(0);
        return postMapper.addPost(post);
    }


    public Post listById(String id) {
        return postMapper.listById(id);
    }

    public List<Post> getMyPostById(String id) {
        return postMapper.getMyPostById(id);
    }

    public int delete(String id) {
        return postMapper.delete(id);
    }

    public int update(Post post) {
        String id = postTypeMapper.selectIdByName(post.getPostType());
        post.setPostType(id);
        return postMapper.update(post);
    }

    /*
    点赞
    * */
    public int add(String userId, String postId) {
        return praiseMapper.add(userId, postId);
    }

    public int deletePaise(String userId, String postId) {
        return praiseMapper.deletePaise(userId, postId);
    }

    public int listPraiseById(String userId, String postId) {
        return praiseMapper.listPraiseById(userId, postId);
    }


    /**
     * 给主页显示热门的贴子
     *
     * @return
     */
    public List<Post> listHotPosts(Integer pageNum) {
        //查数据的时候，按照日期分组，3天之内，浏览人数排序的所有
        return postMapper.listHotPosts(pageNum);
    }

}
