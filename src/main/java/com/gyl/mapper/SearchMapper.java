package com.gyl.mapper;

import com.gyl.entity.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


import java.util.List;

/**
 * @author gyl
 */
@Repository
public interface SearchMapper {


    List<User> searchUserByNickName(@Param("nickName") String nickName);


    List<Post> searchPostByPostTitle(@Param("postTitle") String postTitle);


    List<Area> searchAreaByAreaTitle(@Param("areaTitle") String areaTitle);


    List<Topic> searchTopicByTopicTitle(@Param("topicTitle") String topicTitle);

}
