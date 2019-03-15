package com.gyl.service;

import com.gyl.commons.UUIDString;
import com.gyl.entity.Area;
import com.gyl.mapper.AreaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author gyl
 */
@Service
public class AreaService {
    @Autowired
    private AreaMapper areaMapper;

    public List<Area> list() {
        return areaMapper.list();
    }

    public int add(Area area) {
        area.setId(UUIDString.createId());
        area.setCreateTime(new Date(System.currentTimeMillis()));
        return areaMapper.add(area);
    }

    public int update(Area area) {

        return areaMapper.update(area);
    }

    public int delete(String id) {
        return areaMapper.delete(id);
    }

    public Area getAreaById(String id) {

        return areaMapper.getAreaById(id);

    }
}
