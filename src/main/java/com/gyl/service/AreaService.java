package com.gyl.service;

import com.gyl.commons.UUIDString;
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

    public Area getAreaById(String id) {
        Area area = areaMapper.getAreaById(id);
       /* if (area != null) {

            List<Post> posts = postMapper.listByAreaId(id);
            area.setPosts(posts);
        }
*/
        if (area != null) {
            List<Post> posts = area.getPosts();
            for (Post post : posts) {
                User user = userMapper.selectUserById(post.getUserId());
                post.setUser(user);
            }
        }
        return area;
    }

    public List<Area> getAreasByBoardId(String boardId) {
        return areaMapper.getAreasByBoardId(boardId);
    }
}
