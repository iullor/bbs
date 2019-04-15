package com.gyl.service;

import com.gyl.commons.UUIDString;
import com.gyl.commons.page.PageResult;
import com.gyl.entity.Board;
import com.gyl.entity.Panel;
import com.gyl.entity.Post;
import com.gyl.entity.User;
import com.gyl.mapper.BoardMapper;
import com.gyl.mapper.PanelMapper;
import com.gyl.mapper.PostMapper;
import com.gyl.mapper.UserMapper;
import javafx.scene.layout.Pane;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


@Service
@SuppressWarnings("all")
public class PanelService {
    @Autowired
    private PanelMapper panelMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private BoardMapper boardMapper;

    @Autowired
    private PostMapper postMapper;

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

    public int update(Panel panel) {
        return panelMapper.update(panel);
    }

    public int delete(String pid) {
        return panelMapper.delete(pid);
    }

    public Panel getPanelById(String pid) {
        return panelMapper.getPanelById(pid);
    }

    public List<Panel> searchByPanelTitle(String inputPanelTitle) {
        return panelMapper.searchByPanelTitle(inputPanelTitle);
    }

    /**
     * 管理员的delete
     */
    public int deleteByAdmin(String pid) {

        return panelMapper.delete(pid);
    }

    /**
     * 不能满足需求，查每个board下面最火的5条
     */
    public List<Panel> listBoardsAreaPosts() {
        //分步查询1 ，先找到每个panel中的board 的id
        List<Panel> panels = panelMapper.listBoardsId();
        for (Panel panel : panels) {
            List<Board> boards = panel.getBoards();
            //根据每个boardId 查找post 并按照 参观的人数排序
            for (Board board : boards) {
                String id = board.getId();
                List<Post> posts = postMapper.selectPostsByBoardId(id);
                board.setPosts(posts);
            }
        }
        return panels;
    }

    /**
     * 通过panel id 查找 board area 等
     *
     * @param pid
     * @return
     */
    public Panel selectPanelById(String pid) {
        Panel panel = panelMapper.selectPanelById(pid);
        List<Post> posts = postMapper.selecthotPostsByPanelId(pid);
        panel.setHotPosts(posts);
        return panel;
    }

    /**
     * 根据管理员的id来查他管理的panel
     *
     * @param id
     * @return
     */
    public List<Panel> listByPanelManagerId(String id) {
        return panelMapper.listByPanelManagerId(id);
    }

    public PageResult sortPageByAdmin(List<Panel> panels, Integer currentPage, Integer pageSize) {
        int count = panels.size();
        //需要怎么分,当前页是几,每页分几条,客户端传递过来,传给pageReasult对象,它帮你计算,下一个集合是什么
        PageResult pageResult = new PageResult(panels, count, currentPage, pageSize);
        int beginIndex = (currentPage - 1) * pageSize;
        //动态设置索引,因为可能越界,这里判断如果索引大于总长度的话,就让他等于list集合的总长度
        int endIndex = ((currentPage - 1) * pageSize + pageSize) > (panels.size()) ? (panels.size()) : ((currentPage - 1) * pageSize + pageSize);
        //设置为空
        for (int i = beginIndex; i < endIndex; i++) {
            pageResult.getNewPage().add(panels.get(i));
        }
        return pageResult;
    }
}
