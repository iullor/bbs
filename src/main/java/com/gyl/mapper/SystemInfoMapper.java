package com.gyl.mapper;

import org.springframework.stereotype.Repository;

@Repository
public interface SystemInfoMapper {

    int     countUser();

    int countPanel();

    int countBoard();

    int countArea();

    int countPost();

    int countTopic();

    int countNotice();

    int countUpPost();

    int countHotTopic();
}
