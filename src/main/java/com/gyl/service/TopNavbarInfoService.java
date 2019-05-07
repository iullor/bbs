package com.gyl.service;

import com.gyl.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author gyl
 */
@Service
public class TopNavbarInfoService {

    @Autowired
    private PostService postService;

    @Autowired
    private AreaService areaService;

    @Autowired
    private BoardService boardService;

    @Autowired
    private PanelService panelService;

    @Autowired
    private UserService userService;

    /**
     * 根据postId封装好
     *
     * @param postId
     * @return
     */
    public TopNavbarInfo listByPostId(String postId) {
        //根据boardId查找 panelId
        Post post = postService.selectPostById(postId);
        TopNavbarInfo topNavbarInfo = new TopNavbarInfo();
        String areaId = post.getAreaId();
        String boardId = post.getBoardId();
        //根据areaId去查找对应的area
        Area area = areaService.getAreaById(areaId);
        //根据boardId去查找对应的board
        Board board = boardService.getBoardById(boardId);
        //再获取去查找对应的panel
        String panelId = board.getPanelId();
        Panel panel = panelService.getPanelById(panelId);
        //把信息封装到topNavbarInfo类中
        topNavbarInfo.setPostId(postId);
        topNavbarInfo.setAreaId(areaId);
        topNavbarInfo.setBoardId(boardId);
        topNavbarInfo.setPanelId(panelId);
        //再根据boardId查panel
        topNavbarInfo.setPostTitle(post.getPostTitle());
        topNavbarInfo.setAreaTitle(area.getAreaTitle());
        topNavbarInfo.setBoardTitle(board.getBoardTitle());
        topNavbarInfo.setPanelTitle(panel.getTitle());
        return topNavbarInfo;
    }

    public TopNavbarInfo listByAreaId(String areaId) {
        TopNavbarInfo topNavbarInfo = new TopNavbarInfo();
        //根据areaId去查找对应的area
        Area area = areaService.getAreaById(areaId);
        String boardId = area.getBoardId();
        //根据boardId去查找对应的board
        Board board = boardService.getBoardById(boardId);
        //再获取去查找对应的panel
        String panelId = board.getPanelId();
        Panel panel = panelService.getPanelById(panelId);
        //把信息封装到topNavbarInfo类中
        topNavbarInfo.setAreaId(areaId);
        topNavbarInfo.setBoardId(boardId);
        topNavbarInfo.setPanelId(panelId);
        //再根据boardId查panel
        topNavbarInfo.setAreaTitle(area.getAreaTitle());
        topNavbarInfo.setBoardTitle(board.getBoardTitle());
        topNavbarInfo.setPanelTitle(panel.getTitle());
        return topNavbarInfo;
    }


    public TopNavbarInfo listByBoardId(String boardId) {
        //根据boardId查找 panelId
        TopNavbarInfo topNavbarInfo = new TopNavbarInfo();
        //根据boardId去查找对应的board
        Board board = boardService.getBoardById(boardId);
        //再获取去查找对应的panel
        String panelId = board.getPanelId();
        Panel panel = panelService.getPanelById(panelId);
        //把信息封装到topNavbarInfo类中
        topNavbarInfo.setBoardId(boardId);
        topNavbarInfo.setPanelId(panelId);
        //再根据boardId查panel
        topNavbarInfo.setBoardTitle(board.getBoardTitle());
        topNavbarInfo.setPanelTitle(panel.getTitle());
        return topNavbarInfo;
    }

    public TopNavbarInfo listByPanelId(String panelId) {
        //根据boardId查找 panelId
        TopNavbarInfo topNavbarInfo = new TopNavbarInfo();
        //再获取去查找对应的panel
        Panel panel = panelService.getPanelById(panelId);
        //把信息封装到topNavbarInfo类中
        topNavbarInfo.setPanelId(panelId);
        //再根据boardId查panel
        topNavbarInfo.setPanelTitle(panel.getTitle());
        return topNavbarInfo;
    }

}
