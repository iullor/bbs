package com.gyl.mapper;

import com.gyl.entity.Notice;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 *
 */
@Repository
public interface NoticeMapper {
    int delete(Integer id);

    int insert(Notice notice);

    Notice selectById(Integer id);

    int update(Notice notice);

    List<Notice> list();

    /**
     * 查出所有的标记为1 的
     *
     * @return
     */
    List<Notice> listRecentUpNotices();
}