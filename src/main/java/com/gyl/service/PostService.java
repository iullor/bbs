package com.gyl.service;

import com.gyl.commons.UUIDString;
import com.gyl.commons.page.PageIndex;
import com.gyl.commons.page.PageResult;
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
@SuppressWarnings("all")
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
        Praise praise = new Praise();
        praise.setUserId(userId);
        praise.setPostId(postId);
        return praiseMapper.add(praise);
    }

    public int deletePaise(String userId, String postId) {

        return praiseMapper.deletePostPaise(userId, postId);
    }

    public int listPraiseById(String userId, String postId) {
        return praiseMapper.listPraisePostById(userId, postId);
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

    /**
     * 查找本系统所有的posts
     *
     * @return
     */
    public List<Post> selectPosts() {
        return postMapper.selectPosts();
    }

    /**
     * 根据panel 管理员的id，来查看他管理下的所有贴子
     *
     * @param id
     * @return
     */
    public List<Post> selectPostsByBoardIdAndPanelManagerId(String id) {
        return postMapper.selectPostsByBoardIdAndPanelManagerId(id);
    }

    /**
     * 根据panel 版主的id，来查看他管理下的所有贴子
     *
     * @param id
     * @return
     */
    public List<Post> selectPostsByBoardIdAndBoardIdManagerId(String id) {
        return postMapper.selectPostsByBoardIdAndBoardIdManagerId(id);
    }


    /**
     * 管理员分页
     *
     * @param posts
     * @param currentPage
     * @param pageSize
     * @return
     */
    public PageResult sortPageByAdmin(List<Post> posts, Integer currentPage, Integer pageSize) {
        int count = posts.size();
        //需要怎么分,当前页是几,每页分几条,客户端传递过来,传给pageReasult对象,它帮你计算,下一个集合是什么
        PageResult pageResult = new PageResult(posts, count, currentPage, pageSize);
        int beginIndex = (currentPage - 1) * pageSize;
        //动态设置索引,因为可能越界,这里判断如果索引大于总长度的话,就让他等于list集合的总长度
        int endIndex = ((currentPage - 1) * pageSize + pageSize) > (posts.size()) ? (posts.size()) : ((currentPage - 1) * pageSize + pageSize);
        //设置为空
        for (int i = beginIndex; i < endIndex; i++) {
            pageResult.getNewPage().add(posts.get(i));
        }
        return pageResult;
    }

}
