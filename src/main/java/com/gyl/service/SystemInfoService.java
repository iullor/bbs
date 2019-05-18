package com.gyl.service;

import com.alibaba.fastjson.JSON;
import com.gyl.entity.*;
import com.gyl.mapper.AreaMapper;
import com.gyl.mapper.BoardMapper;
import com.gyl.mapper.PanelMapper;
import com.gyl.mapper.SystemInfoMapper;
import org.omg.Messaging.SYNC_WITH_TRANSPORT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class SystemInfoService {
    @Autowired
    private SystemInfoMapper systemInfoMapper;
    @Autowired
    private PanelMapper panelMapper;
    @Autowired
    private BoardMapper boardMapper;
    @Autowired
    private AreaMapper areaMapper;

    @Autowired
    private PostService postService;

    public SystemInfo listComponents() {
        SystemInfo systemInfo = new SystemInfo();
        int user = systemInfoMapper.countUser();
        int panel = systemInfoMapper.countPanel();
        int board = systemInfoMapper.countBoard();
        int area = systemInfoMapper.countArea();
        int post = systemInfoMapper.countPost();
        int topic = systemInfoMapper.countTopic();
        int notice = systemInfoMapper.countNotice();
        int upPost = systemInfoMapper.countUpPost();
        int hotTopic = systemInfoMapper.countHotTopic();

        systemInfo.setUserNumbers(user);
        systemInfo.setPanelNumbers(panel);
        systemInfo.setBoardNumbers(board);
        systemInfo.setAreaNumbers(area);
        systemInfo.setPostNumbers(post);
        systemInfo.setTopicNumbers(topic);
        systemInfo.setNoticeNumbers(notice);
        systemInfo.setUpPostNumbers(upPost);
        systemInfo.setHotTopicNumbers(hotTopic);

        return systemInfo;
    }

    /**
     * 每一个模块对应的帖子数
     *
     * @return
     */
    public List<Panel> getNumbersFromEachPanel() {
        List<Panel> panels = panelMapper.list();
        if (panels != null) {
            for (Panel panel : panels) {
                String panelId = panel.getId();
                //再根据panelId去查每个下面有多少帖子数，分区数
                Integer count1 = panelMapper.countPostNumberByPanelId(panelId);
                Integer count2 = panelMapper.countAreaNumberByPanelId(panelId);
                panel.setPostNumbers(count1);
                panel.setAreaNumbers(count2);
            }
        }
        return panels;
    }

    /**
     * @param id
     * @return
     */
    public List<Board> getBoardByPanelId(String id) {
        List<Board> boards = boardMapper.selectBoardsByPanelId(id);
        if (boards != null) {
            //数每个board里面的area个数
            for (Board board : boards) {
                Integer count1 = boardMapper.countAreaNumberByBoardId(board.getId());
                board.setAreaNumbers(count1);
            }
        }
        return boards;
    }

    /**
     * 根据boardId得到area
     *
     * @param boardId
     * @return
     */
    public List<Area> getAreaByBoardId(String boardId) {
        List<Area> areas = areaMapper.getAreasByBoardId(boardId);
        if (areas != null) {
            //数每个area中的帖子数
            for (Area area : areas) {
                String areaId = area.getId();
                Integer count1 = areaMapper.countPostNumberByAreaId(areaId);
                area.setPostNumbers(count1);
            }
        }
        return areas;
    }

    /**
     * 找到帖子数
     * 将每个时间段的帖子数和贴子的每个类型对应的帖子数封装到systemInfo中
     *
     * @return
     */
    public List<SystemInfo> getSystemInfoAboutPostTimeSort() {
        //List<Post> posts = postService.selectPosts();
        List<Post> posts = postService.selectPostTitleAndPostType();
        List<SystemInfo> systemInfos = new ArrayList<>();
        int[] time = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23};
        int[] numberEachTime = new int[24];
        if (posts != null) {
            for (int i = 0; i < time.length; i++) {
                SystemInfo systemInfo = new SystemInfo();
                for (Post post : posts) {
                    Date createTime = post.getCreateTime();
                    SimpleDateFormat sf = new SimpleDateFormat("HH");
                    String hourString = sf.format(createTime);
                    int hour = Integer.parseInt(hourString);
                    //将贴子按照类型区分
                    systemInfo.setPostTime(i);
                    if (hour == time[i]) {
                        numberEachTime[i] = numberEachTime[i] + 1;
                        systemInfo.setPostCountSortByPostTime(numberEachTime[i]);
                    }

                }
                systemInfos.add(systemInfo);
            }
        }
        return systemInfos;
    }

    /**
     * 根据发帖的类型进行封装个数
     *
     * @return
     */
    public List<SystemInfo> getSystemInfoAboutPostType() {
        List<Post> posts = postService.selectPostTitleAndPostType();
        List<SystemInfo> systemInfos = new ArrayList<>();
        Map<String, Integer> tmpMap = new HashMap<>();
        if (posts != null) {
            for (Post post : posts) {
                String postType = post.getPostType();
                Integer count = tmpMap.get(postType);
                if (count == null) {
                    tmpMap.put(postType, 1);
                } else {
                    count = count + 1;
                    tmpMap.put(postType, count);
                }
            }
        }
        Set<Map.Entry<String, Integer>> entries = tmpMap.entrySet();
        Iterator<Map.Entry<String, Integer>> iterator = entries.iterator();
        while (iterator.hasNext()) {
            SystemInfo systemInfo = new SystemInfo();
            Map.Entry<String, Integer> next = iterator.next();
            String key = next.getKey();
            Integer value = next.getValue();
            systemInfo.setPostTypeName(key);
            systemInfo.setPostCountSortByPostTypeName(value);
            systemInfos.add(systemInfo);
        }
        return systemInfos;
    }

}
