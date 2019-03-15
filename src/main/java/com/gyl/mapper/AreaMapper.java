package com.gyl.mapper;

import com.gyl.entity.Area;
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
}
