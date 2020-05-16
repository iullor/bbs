package com.gyl.service;

import com.gyl.commons.UUIDString;
import com.gyl.commons.page.PageResult;
import com.gyl.entity.Area;
import com.gyl.entity.Board;
import com.gyl.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 *
 */
@SuppressWarnings("all")
@Service
public class BoardService {
    @Autowired
    private BoardMapper boardMapper;


    public List<Board> list() {
        List<Board> boards = boardMapper.list();
        return boards;
    }

    public int add(Board board) {
        board.setId(UUIDString.createId());
        board.setCreateTime(new Date(System.currentTimeMillis()));
        return boardMapper.add(board);
    }

    public int put(Board board) {
        return boardMapper.update(board);
    }

    public int delete(String id) {
        return boardMapper.delete(id);
    }

    public Board getBoardById(String id) {

        return boardMapper.getBoardById(id);
    }

    /**
     * 通过panelId 外键去查一个集合
     *
     * @param id
     * @return
     */
    public List<Board> selectBoardsByPanelId(String id) {
        return boardMapper.selectBoardsByPanelId(id);
    }


    /**
     * 查找所有的board 以及每个board下面的所有area
     *
     * @return
     */
    public List<Board> listBoardsAndAreas() {
        return boardMapper.listBoardsAndAreas();
    }

    /**
     * 通过子查询
     * 先找到当前用户管理的所有panel 的id 再用in 来关联每一个panel下的所有board
     *
     * @param id
     * @return
     */
    public List<Board> listBoardByPanelId(String id) {
        return boardMapper.listBoardByPanelId(id);
    }

    public List<Board> getBoardByManagerId(String id) {
        return boardMapper.getBoardByManagerId(id);
    }

    public PageResult sortPageByAdmin(List<Board> boards, Integer currentPage, Integer pageSize) {
        int count = boards.size();
        //需要怎么分,当前页是几,每页分几条,客户端传递过来,传给pageReasult对象,它帮你计算,下一个集合是什么
        PageResult pageResult = new PageResult(boards, count, currentPage, pageSize);
        int beginIndex = (currentPage - 1) * pageSize;
        //动态设置索引,因为可能越界,这里判断如果索引大于总长度的话,就让他等于list集合的总长度
        int endIndex = ((currentPage - 1) * pageSize + pageSize) > (boards.size()) ? (boards.size()) : ((currentPage - 1) * pageSize + pageSize);
        for (int i = beginIndex; i < endIndex; i++) {
            pageResult.getNewPage().add(boards.get(i));
        }
        return pageResult;
    }

    /**
     * 获取所有的板块通过 每个板块中所有的贴子 数量来排序，查到最多的取前6个显示
     *
     * @return
     */
    public List<Board> selectHotBoardsByPosts() {
        return boardMapper.selectHotBoardsByPosts();
    }





}
