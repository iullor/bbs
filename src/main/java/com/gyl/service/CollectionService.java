package com.gyl.service;

import com.gyl.commons.UUIDString;
import com.gyl.entity.Area;
import com.gyl.entity.Collection;
import com.gyl.entity.Post;
import com.gyl.entity.User;
import com.gyl.mapper.CollectionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author gyl
 */
@Service
public class CollectionService {

    @Autowired
    private CollectionMapper collectionMapper;


    /**
     * 添加关注，收藏，用户
     *
     * @param collection
     * @return
     */
    public int addUserToCollections(Collection collection) {
        collection.setId(UUIDString.createId());
        collection.setCreateTime(new Date(System.currentTimeMillis()));
        return collectionMapper.addUserToCollections(collection);
    }

    public int addPostToCollections(Collection collection) {
        collection.setId(UUIDString.createId());
        collection.setCreateTime(new Date(System.currentTimeMillis()));
        return collectionMapper.addPostToCollections(collection);
    }

    public int addAreaToCollections(Collection collection) {
        collection.setId(UUIDString.createId());
        collection.setCreateTime(new Date(System.currentTimeMillis()));
        return collectionMapper.addAreaToCollections(collection);
    }


    /**
     * 取消关注，收藏用户，贴子，板块
     *
     * @param collection
     * @return
     */
    public int cancelUserFromCollections(Collection collection) {
        return collectionMapper.cancelUserFromCollections(collection.getUserId(), collection.getCurrentUserId());
    }

    public int cancelPostFromCollections(Collection collection) {
        return collectionMapper.cancelPostFromCollections(collection.getPostId(), collection.getCurrentUserId());
    }

    public int cancelAreaFromCollections(Collection collection) {

        return collectionMapper.cancelAreaFromCollections(collection.getAreaId(), collection.getCurrentUserId());
    }

    /**
     * 通过当前的用户id，和被订阅的用户的id
     * 找到一个关注id
     *
     * @param collection
     * @return
     */
    public Collection getCollectByUserId(Collection collection) {
        return collectionMapper.getCollectByUserId(collection.getUserId(), collection.getCurrentUserId());
    }

    public Collection getCollectByPostId(Collection collection) {
        return collectionMapper.getCollectByPostId(collection.getPostId(), collection.getCurrentUserId());
    }

    public Collection getCollectByAreaId(Collection collection) {
        return collectionMapper.getCollectByAreaId(collection.getAreaId(), collection.getCurrentUserId());
    }

    /**
     * 查找当前用户所有收藏的posts
     *
     * @return
     */
    public List<Post> listMyCollectionPosts(String id) {
        List<Post> posts = collectionMapper.listMyCollectionPosts(id);
        return posts;
    }

    /**
     * 查找当前用户收藏的分区
     *
     * @param id
     * @return
     */
    public List<Area> listMyCollectionAreas(String id) {

        return collectionMapper.listMyCollectionAreas(id);
    }

    public List<Collection> listMyCollectionUser(String id) {
        return collectionMapper.listMyCollectionUser(id);
    }


    public int countFansByUserId(String id){
        return collectionMapper.countFansByUserId(id);
    }


}
