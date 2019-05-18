package com.gyl.service;

import com.gyl.commons.UUIDString;
import com.gyl.commons.page.PageResult;
import com.gyl.entity.Area;
import com.gyl.entity.Post;
import com.gyl.entity.User;
import com.gyl.mapper.AreaMapper;
import com.gyl.mapper.PostMapper;
import com.gyl.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author gyl
 */
@SuppressWarnings("all")
@Service
public class AreaService {
    @Autowired
    private AreaMapper areaMapper;
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PostMapper postMapper;

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

    /**
     * admin 查出所有的分区信息
     *
     * @param id
     * @return
     */
    public Area getAreaById(String id) {
        Area area = areaMapper.getAreaByIdExceptSecretPost(id);
        if (area != null) {
            List<Post> posts = area.getPosts();
            for (Post post : posts) {
                User user = userMapper.selectUserById(post.getUserId());
                post.setUser(user);
            }
            return area;
        }else {
            return areaMapper.getAreaById(id);
        }
    }

    /**
     * 前台页面分页,查出来所有的area下的posts 然后对其进行分组处理
     *
     * @param id
     * @param currentPage
     * @param pageSize
     * @return
     */
    public Area getAreaPostsById(String id, Integer currentPage, Integer pageSize) {
        Area area = areaMapper.getAreaByIdExceptSecretPost(id);
        if (area != null) {
            PageResult pageResult = listPosts(id, currentPage, pageSize);
            List<Post> posts = pageResult.getNewPage();
            for (Post post : posts) {
                User user = userMapper.selectUserById(post.getUserId());
                post.setUser(user);
            }
            area.setPosts(posts);
            return area;
        } else {
            //若没有贴子，让它查出来分区的信息即可
            return areaMapper.getAreaById(id);
        }

    }

    /**
     * 分页方法
     *
     * @return
     */
    public PageResult listPosts(String id, Integer currentPage, Integer pageSize) {
        Area area = areaMapper.getAreaByIdExceptSecretPost(id);
        if (area==null) {
            area = areaMapper.getAreaById(id);
        }
        Integer count = area.getPosts().size();
        List<Post> posts = area.getPosts();
        PageResult pageResult = new PageResult(posts, count, currentPage, pageSize);
        int beginIndex = (currentPage - 1) * pageSize;
        int endIndex = ((currentPage - 1) * pageSize + pageSize) > (posts.size()) ? (posts.size()) : ((currentPage - 1) * pageSize + pageSize);
        for (int i = beginIndex; i < endIndex; i++) {
            pageResult.getNewPage().add(posts.get(i));
        }
        return pageResult;
    }

    public List<Area> getAreasByBoardId(String boardId) {
        return areaMapper.getAreasByBoardId(boardId);
    }

    /**
     * 根据管理员的id，去找他管理下的所有分区
     *
     * @param id
     * @return
     */
    public List<Area> listAreasByAllBoardId(String id) {
        return areaMapper.listAreasByAllBoardId(id);
    }

    public List<Area> listAreasByManagerId(String id) {
        return areaMapper.listAreasByManagerId(id);
    }

    /**
     * @param areas       根据不同角色查出来的对应的分区
     * @param currentPage 前台传递过来的当前页
     * @param pageSize    每一页的数量
     * @return
     */
    public PageResult sortPageByAdmin(List<Area> areas, Integer currentPage, Integer pageSize) {
        int count = areas.size();
        PageResult pageResult = new PageResult(areas, count, currentPage, pageSize);
        int beginIndex = (currentPage - 1) * pageSize;
        int endIndex = ((currentPage - 1) * pageSize + pageSize) > (areas.size()) ? (areas.size()) : ((currentPage - 1) * pageSize + pageSize);
        for (int i = beginIndex; i < endIndex; i++) {
            pageResult.getNewPage().add(areas.get(i));
        }
        return pageResult;
    }

}
