package com.gyl.service;

import org.aspectj.weaver.ast.Not;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import com.gyl.mapper.NoticeMapper;
import com.gyl.entity.Notice;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author gyl
 */
@Service
public class NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;


    public int delete(Integer id) {
        return noticeMapper.delete(id);
    }


    public int insert(Notice notice) {
        notice.setCreateTime(new Date(System.currentTimeMillis()));
        notice.setState(0);
        return noticeMapper.insert(notice);
    }


    public Notice selectById(Integer id) {
        return noticeMapper.selectById(id);
    }


    public int update(Notice notice) {
        return noticeMapper.update(notice);
    }

    public List<Notice> list() {
        return noticeMapper.list();
    }

    /**
     * 对所有的标记为1 的进行显示每次4条
     *
     * @param times 第几次去查
     * @return
     */
    public List<Notice> listRecentUpNotices(Integer times) {
        List<Notice> notices = noticeMapper.listRecentUpNotices();
        List<Notice> newNotices = new ArrayList<>();
        if (notices.size() < 4) {
            return notices;
        } else {
            int size = notices.size();

            int index = size - times;
            //第一次访问
            if (times == 0) {
                index = 0;
            }
            //如果大于的话，取余数，就是index的值
            if (times > size) {
                index = times % size;
            }
            if (size > index) {
                for (int i = 0; i < 4; i++) {
                    newNotices.add(notices.get(index));
                    if ((size - 1) == index) {
                        index = 0;
                    } else if ((size - 1) > index) {
                        index++;
                    }
                }
            }
            return newNotices;
        }
    }
}
