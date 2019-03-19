package com.gyl.mapper;

import com.gyl.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    int add(User user);

    User checkUser(String username);

    User selectUserById(@Param(value = "uid") String uid);

    List<User> list();

    int update(User user);

    int delete(@Param(value = "id") String id);
}
