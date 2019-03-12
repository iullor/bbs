package com.gyl.service;

import com.gyl.commons.UUIDString;
import com.gyl.entity.Panel;
import com.gyl.entity.User;
import com.gyl.mapper.PanelMapper;
import com.gyl.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


@Service
public class PanelService {
    @Autowired
    private PanelMapper panelMapper;
    @Autowired
    private UserMapper userMapper;

    /**
     * 新增
     *
     * @param panel
     * @return
     */
    public int add(Panel panel) {
        panel.setId(UUIDString.createId());
        panel.setCreateTime(new Date(System.currentTimeMillis()));
        return panelMapper.add(panel);
    }

    /**
     * @return 所有的模块
     */
    public List<Panel> list() {
        //给List中的userList设置值
        List<Panel> panels = panelMapper.list();
        for (Panel p : panels) {
            String panelManagerId = p.getPanelManagerId();
            List<User> userList = p.getUserList();
            //userMapper根据id再去找
            User user = userMapper.selectUserById(panelManagerId);
            userList.add(user);
        }
        return panels;
    }

    public int update(Panel panel, String pid) {
        return panelMapper.update(panel, pid);
    }

    public int delete(String pid) {
        return panelMapper.delete(pid);
    }

    public Panel getPanelById(String pid) {
        return panelMapper.getPanelById(pid);
    }

    public List<Panel> searchByPanelTitle(Panel panel) {

        return panelMapper.searchByPanelTitle(panel);
    }
}
