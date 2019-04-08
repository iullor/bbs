package com.gyl.mapper;

import com.gyl.entity.Post;
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

    List<Post> selectPostsByBoardId(@Param("boardId")String boardId);

    List<Post> selecthotPostsByPanelId(@Param("panelId")String panelId);
}
