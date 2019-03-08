package com.gyl.mapper;

import com.gyl.entity.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
    int add(User user);

    User checkUser(String username);
}
