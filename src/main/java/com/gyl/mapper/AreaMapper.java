package com.gyl.mapper;

import com.gyl.entity.Area;
import com.gyl.entity.Post;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author gyl
 */
@Repository
public interface AreaMapper {
    List<Area> list();

    int add(Area area);

    int update(Area area);

    int delete(String id);

    Area getAreaById(@Param(value = "id") String id);

    List<Area> getAreasByBoardId(@Param("boardId") String boardId);

    List<Area> listAreasByAllBoardId(@Param("id")String id);

    List<Area> listAreasByManagerId(@Param("id")String id);

    List<Post> selectAreasPage(@Param("currentPage")int currentPage, @Param("pageSize")Integer pageSize);
}
