package com.gyl.mapper;

import com.gyl.entity.Post;
import com.gyl.entity.Topic;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author gyl,
 * 贴子
 */
@Repository
public interface PostMapper {

    int addPost(Post post);

    Post listById(@Param("id") String id);

    List<Post> getMyPostById(@Param("id") String id);

    int delete(String id);

    int update(Post post);

    List<Post> listByAreaId(@Param("areaId") String areaId);

    List<Post> listHotPosts(@Param("pageNum") Integer pageNum);

    List<Post> selectPostsByBoardId(@Param("boardId") String boardId);

    List<Post> selecthotPostsByPanelId(@Param("panelId") String panelId);


    /**
     * 查看所有的贴子
     *
     * @return
     */
    List<Post> selectPosts();

    /**
     * 根据用户的角色去查找，它管理模块下的所有贴子
     *
     * @param id
     * @return
     */
    List<Post> selectPostsByBoardIdAndPanelManagerId(@Param("id") String id);

    /**
     * 根据panel 版主的id，来查看他管理下的所有贴子
     *
     * @param id
     * @return
     */
    List<Post> selectPostsByBoardIdAndBoardIdManagerId(String id);

    List<Post> selectPostsPage(@Param("currentPage") int currentPage, @Param("pageSize") int pageSize);


    int countPostsByUserId(@Param("id") String id);

    List<Post> getTopFivePostsByAreaId(@Param("areaId") String areaId);

    /**
     * 列出来
     *
     * @return
     */
    List<Post> selectPostTitleAndPostType();

    List<Post> getMyFocusPosts(@Param("id") String id);

    List<Post> selectByPostTitle(@Param("postTitle") String postTitle);

    List<Post> getMyPostByIdAndPostTitle(@Param("id") String id, @Param("myPostTitle") String myPostTitle);
}
