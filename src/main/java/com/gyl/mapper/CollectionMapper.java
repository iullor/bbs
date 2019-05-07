package com.gyl.mapper;

import com.gyl.entity.Area;
import com.gyl.entity.Collection;
import com.gyl.entity.Post;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author gyl
 */
@Repository
public interface CollectionMapper {
    int addUserToCollections(Collection collection);

    int addPostToCollections(Collection collection);

    int addAreaToCollections(Collection collection);

    int cancelUserFromCollections(@Param("userId") String userId, @Param("currentUserId") String currentUserId);

    int cancelPostFromCollections(@Param("postId") String postId, @Param("currentUserId") String currentUserId);

    int cancelAreaFromCollections(@Param("areaId") String areaId, @Param("currentUserId") String currentUserId);

    Collection getCollectByUserId(@Param("userId") String userId, @Param("currentUserId") String currentUserId);

    Collection getCollectByPostId(@Param("postId") String postId, @Param("currentUserId") String currentUserId);

    Collection getCollectByAreaId(@Param("areaId") String areaId, @Param("currentUserId") String currentUserId);

    /**
     * 查询当前用户收藏的所有贴子
     *
     * @param id
     * @return
     */
    List<Post> listMyCollectionPosts(@Param("id") String id);

    List<Area> listMyCollectionAreas(@Param("id") String id);

    List<Collection> listMyCollectionUser(@Param("id") String id);

    /**
     * 根据用户id去查关注他的所有粉丝
     *
     * @param id
     * @return
     */
    int countFansByUserId(@Param("id") String id);
}
