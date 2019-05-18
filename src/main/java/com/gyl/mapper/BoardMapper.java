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

    /**
     * 找到所有板块中的分区
     *
     * @return
     */
    List<Board> listBoardsAndAreas();

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


    List<Board> listBoardByPanelId(@Param("id") String id);

    /**
     * 根据版主的id，来查找他管理的所有的板块的信息
     *
     * @param id
     * @return
     */
    List<Board> getBoardByManagerId(@Param("id") String id);

    /**
     * 找到贴子最多的板块取前6
     *
     * @return
     */
    List<Board> selectHotBoardsByPosts();

    Integer countAreaNumberByBoardId(@Param("id") String id);
}
