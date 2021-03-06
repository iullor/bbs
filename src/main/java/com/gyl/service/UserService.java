package com.gyl.service;

import com.gyl.commons.StatusCode;
import com.gyl.commons.UUIDString;
import com.gyl.commons.page.PageResult;
import com.gyl.entity.*;
import com.gyl.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import javax.mail.MessagingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@SuppressWarnings("all")
public class UserService {
    @Autowired
    private UserMapper userMapper;
    private Map<String, Object> userLogonInfo = null;
    @Autowired
    private EmailService emailService;
    @Autowired
    private PostService postService;

    public int add(User user) {
        user.setId(UUIDString.createId());
        user.setCreateTime(new Date(System.currentTimeMillis()));
        //设置用户的账户信息
        UserAccountStatus userAccountStatus = new UserAccountStatus();
        //设置用户的登录信息
        UserLoginInfo userLoginInfo = new UserLoginInfo();
        //设置用户的基本信息
        UserBaseInfo userBaseInfo = new UserBaseInfo();
        //设置为普通用户
        userAccountStatus.setRole(4);
        //设置默认头像
        userBaseInfo.setHeadImage("/upload/headImage/default-headImg.svg");
        //设置账户状态是未激活
        userAccountStatus.setStatus(StatusCode.USER_NOT_ACTIVE);
        //设置访问次数是0
        userLoginInfo.setAccessNum(0);
        //发送一条邮件信息
        emailService.sendHtml(user.getId(), user.getEmail());
        user.setUserAccountStatus(userAccountStatus);
        user.setUserBaseInfo(userBaseInfo);
        user.setUserLoginInfo(userLoginInfo);
        return userMapper.add(user);
    }

    /**
     * 根据用户名和密码找用户
     * 把用户登录的信息封装在userLogonInfo中
     * 包含错误状态码和用户信息
     *
     * @param username
     * @param password
     */
    public Map<String, Object> checkUser(String username, String password) {
        userLogonInfo = new HashMap<>();
        User user = userMapper.checkUser(username);
        if (user != null) {
            UserBaseInfo userBaseInfo = user.getUserBaseInfo();
            if (userBaseInfo != null) {
                String gender = userBaseInfo.getGender();
                //设置性别
                if ("男".equals(gender)) {
                    userBaseInfo.setGender("男");
                } else if ("女".equals(gender)) {
                    userBaseInfo.setGender("女");
                } else {
                    userBaseInfo.setGender("保密");
                }
            }
            //若密码正确，判断用户的状态
            if (user.getPassword().equals(password)) {
                //用户状态为1,正常
                if (user.getUserAccountStatus().getStatus().equals(StatusCode.USER_NORMAL)) {
                    userLogonInfo.put("USER_STATUS", StatusCode.USER_NORMAL);
                    userLogonInfo.put("SUCCESS_LOGON", StatusCode.SUCCESS_LOGON);
                    userLogonInfo.put("user", user);
                    return userLogonInfo;
                }
                //用户状态为0，用户未激活
                if (user.getUserAccountStatus().getStatus().equals(StatusCode.USER_NOT_ACTIVE)) {
                    userLogonInfo.put("USER_STATUS", StatusCode.USER_NOT_ACTIVE);
                    return userLogonInfo;
                }
                //用户状态为-1,冻结
                if (user.getUserAccountStatus().getStatus().equals(StatusCode.USER_FREESON)) {
                    userLogonInfo.put("USER_STATUS", StatusCode.USER_FREESON);
                    return userLogonInfo;
                }
            } else {
                //用户密码不正确
                userLogonInfo.put("USER_STATUS", StatusCode.USER_PASSWORD_ERROR);
                return userLogonInfo;
            }

        }
        userLogonInfo.put("USER_STATUS", StatusCode.USER_NOT_EXIT);
        return userLogonInfo;
    }

    /**
     * 通过用户的id来找User
     *
     * @return
     */
    public User selectUserById(String uid) {
        return userMapper.selectUserById(uid);
    }

    public List<User> list() {
        //根据每个人的id去查出来他发了多少帖子
        List<User> users = userMapper.list();
        if (users != null) {
            for (User user : users) {
                List<Post> posts = postService.getMyPostById(user.getId());
                user.setPosts(posts);
            }
        }
        return users;
    }

    public int update(User user) {
        return userMapper.update(user);
    }

    public int delete(String id) {
        return userMapper.delete(id);
    }

    public String selectUsername(String uname) {
        User user = userMapper.selectUsername(uname);
        if (user != null) {
            return "用户名已经被注册";
        }
        return "可以使用";
    }

    public int activeAccountById(String id) {
        return userMapper.activeAccountById(id);
    }


    public User adminLogon(String username, String password) {
        User user = userMapper.adminLogon(username, password);
        return user;
    }

    public PageResult sortPageByAdmin(List<User> users, Integer currentPage, Integer pageSize) {
        int count = users.size();
        //需要怎么分,当前页是几,每页分几条,客户端传递过来,传给pageReasult对象,它帮你计算,下一个集合是什么
        PageResult pageResult = new PageResult(users, count, currentPage, pageSize);
        int beginIndex = (currentPage - 1) * pageSize;
        //动态设置索引,因为可能越界,这里判断如果索引大于总长度的话,就让他等于list集合的总长度
        int endIndex = ((currentPage - 1) * pageSize + pageSize) > (users.size()) ? (users.size()) : ((currentPage - 1) * pageSize + pageSize);
        //设置为空
        for (int i = beginIndex; i < endIndex; i++) {
            pageResult.getNewPage().add(users.get(i));
        }
        return pageResult;
    }


    //更新个人说明
    public int updateIntroduce(String id, String introduce) {
        return userMapper.updateIntroduce(id, introduce);
    }

    /**
     * 根据用户的id,和主题的编号来更换样式
     *
     * @param id
     * @param value
     * @return
     */
    public int changeTheme(String id, String value) {
        return userMapper.changeTheme(id, value);
    }

    public int resetPassword(String username, String email) {
        //根据用户名和邮箱比对，吻合的话，就重新生成一个密码，通过邮箱发过去
        User user = userMapper.selectUserByUNameAndEmail(username, email);
        if (user != null) {
            //生成新密码
            String tmpPassword = UUIDString.createId().substring(0, 10);
            //发送一条邮件
            try {
                emailService.resetPasswordByEmail(tmpPassword, email);
                //讲这个密码保存到数据库中
                int status = userMapper.updateTmpPassword(user.getId(), tmpPassword);
                //重置成功
                return 0;
            } catch (Exception e) {

            }
        }
        return -1;
    }

    public List<User> selectUsersByNickName(String nickName) {
        //根据每个人的id去查出来他发了多少帖子
        List<User> users = userMapper.selectUsersByNickName(nickName);
        if (users != null) {
            for (User user : users) {
                List<Post> posts = postService.getMyPostById(user.getId());
                user.setPosts(posts);
            }
        }
        return users;
    }
}
