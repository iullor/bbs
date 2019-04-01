package com.gyl.service;

import com.gyl.commons.UUIDString;
import com.gyl.entity.Board;
import com.gyl.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @author gyl
 */
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

}
