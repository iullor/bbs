package com.gyl.mapper;

import com.gyl.entity.Board;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author gyl
 */
@Repository
public interface BoardMapper {

    List<Board> list();

    int delete(String id);

    int add(Board board);

    int update(Board board);

    Board getBoardById(String id);

    /**
     * 通过外键去查
     *
     * @param id
     * @return
     */
    List<Board> selectBoardsByPanelId(@Param(value = "pid") String id);
}
