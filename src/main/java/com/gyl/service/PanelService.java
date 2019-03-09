package com.gyl.service;

import com.gyl.commons.UUIDString;
import com.gyl.entity.Panel;
import com.gyl.mapper.PanelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


@Service
public class PanelService {
    @Autowired
    private PanelMapper panelMapper;

    public int add(Panel panel) {
        panel.setId(UUIDString.createId());
        panel.setCreateTime(new Date(System.currentTimeMillis()));
        return panelMapper.add(panel);
    }

    public List<Panel> list() {
        return panelMapper.list();
    }
}
