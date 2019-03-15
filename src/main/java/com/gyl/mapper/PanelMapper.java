package com.gyl.mapper;

import com.gyl.entity.Panel;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PanelMapper {
    /**
     * 添加一个模块
     *
     * @param panel
     * @return
     */
    int add(Panel panel);

    /**
     * 查询出所有的模块数
     *
     * @return
     */
    List<Panel> list();

    int update(Panel panel);

    int delete(@Param(value = "pid") String pid);

    Panel getPanelById(@Param(value = "pid") String pid);

    List<Panel> searchByPanelTitle(@Param(value = "title") String inputPanelTitle);
}
