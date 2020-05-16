package com.gyl.mapper;

import com.gyl.entity.PostType;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 *
 * <p>
 * 贴子的类型
 */
@Repository
public interface PostTypeMapper {

    int addPostType(PostType postType);

    List<PostType> listPostType();


    int updatePostType(PostType postType);

    /**
     * PostType id
     *
     * @param id
     * @return
     */
    int deletePostType(@Param("id") String id);

    String selectIdByName(@Param("name") String name);
}
