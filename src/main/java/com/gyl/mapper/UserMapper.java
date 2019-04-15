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

    User selectUsername(@Param(value = "username") String uname);

    /**
     * 通过用户id ，激活用户
     *
     * @param id
     * @return
     */
    int activeAccountById(@Param("id") String id);

    /**
     * admin用户登录
     *
     * @param username
     * @param password
     * @return
     */
    User adminLogon(@Param("username")String username, @Param("password")String password);
}
