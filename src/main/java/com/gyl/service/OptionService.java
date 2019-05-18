package com.gyl.service;

import com.gyl.commons.UUIDString;
import com.gyl.commons.page.PageResult;
import com.gyl.entity.User;
import com.gyl.entity.UserAccountStatus;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import com.gyl.mapper.OptionMapper;
import com.gyl.entity.Option;

import java.util.Date;
import java.util.List;

/**
 * @author gyl
 */
@Service
@SuppressWarnings("all")
public class OptionService {

    @Resource
    private OptionMapper optionMapper;


    public int deleteById(String id) {
        return optionMapper.deleteById(id);
    }


    public int insert(Option option) {
        String op = option.getApplyType();
        if (op != null) {
            if (op.equals("1")) {
                option.setApplyType("贴子置顶");
            }
            if (op.equals("2")) {
                option.setApplyType("版主");
            }
            if (op.equals("3")) {
                option.setApplyType("申请话题首页置顶");
            }
        }
        option.setId(UUIDString.createId());
        option.setApplyTime(new Date(System.currentTimeMillis()));
        //设置为待审核
        option.setStatus(02);
        String brief = option.getBrief();
        if (brief.length() > 10) {
            String s = brief.substring(0, 10);
            option.setBrief(s);
        }
        return optionMapper.insert(option);
    }


    public Option selectOptionAboutPostById(String id) {
        return optionMapper.selectOptionAboutPostById(id);
    }


    public int updateById(Option option) {
        return optionMapper.updateById(option);
    }

    /**
     * 根据用户的id查，所有的状态
     *
     *
     * <p>
     * 未读              0
     * <p>
     * 撤销             1
     * <p>
     * 待审核            2
     * <p>
     * 审核通过         3
     * <p>
     * 审核拒绝         4
     * <p>
     * 忽略(时间大于7天，状态变成超时)   5
     * <p>
     * 超时                  6
     *
     * @param applyUserId
     * @return
     */
    public List<Option> selectByApplyUserId(String applyUserId) {
        List<Option> options = optionMapper.selectByApplyUserId(applyUserId);
        for (Option op : options) {
            Integer status = op.getStatus();
            String progess = "待审核";
            if (status == 1) {
                progess = "已经撤销";
            }
            if (status == 3) {
                progess = "审核通过";
            }
            if (status == 4) {
                progess = "审核拒绝";
            }
            if (status == 6) {
                progess = "申请超时";
            }
            op.setProgress(progess);
        }
        return options;
    }

    /**
     * 查出来所有未审核的
     *
     * @return
     */
    public List<Option> selectOptionsByRole(Integer status) {
        return optionMapper.selectAllOptionsByStatus(status);
    }

    //根据不同的角色去不同的表中查对应管理的板块，模块
    public void selectRoleByRoleId(User user) {
        //得到当前用户的id,去角色表中判断是那个角色，根据这个角色去不同的表中查找对应他管理的那部分信息
        int role = user.getUserAccountStatus().getRole();
        //超级管理员,可以查看所有信息，对所有的数据进行操作
    }

    /**
     * 根据审核的状态来查询贴子,贴子在某一个板块下
     *
     * @param status
     * @return
     */
    public List<Option> selectAllPostsOptionsByStatus(Integer status) {
        return optionMapper.selectAllPostsOptionsByStatus(status);
    }

    /**
     * 查看所有的申请
     *
     * @param status
     * @return
     */
    public List<Option> selectAllOptionsByStatus(Integer status) {
        return optionMapper.selectAllOptionsByStatus(status);
    }

    public int updateOptionById(Option option) {
        option.setHandleTime(new Date(System.currentTimeMillis()));
        int i = optionMapper.updateOptionById(option);
        return i;
    }

    public List<Option> selectAllPostsOptionsHasChecked() {
        return optionMapper.selectAllPostsOptionsHasChecked();
    }

    public PageResult sortPageByAdmin(List<Option> options, Integer currentPage, Integer pageSize) {
        int count = options.size();
        //需要怎么分,当前页是几,每页分几条,客户端传递过来,传给pageReasult对象,它帮你计算,下一个集合是什么
        PageResult pageResult = new PageResult(options, count, currentPage, pageSize);
        int beginIndex = (currentPage - 1) * pageSize;
        //动态设置索引,因为可能越界,这里判断如果索引大于总长度的话,就让他等于list集合的总长度
        int endIndex = ((currentPage - 1) * pageSize + pageSize) > (options.size()) ? (options.size()) : ((currentPage - 1) * pageSize + pageSize);
        //设置为空
        for (int i = beginIndex; i < endIndex; i++) {
            pageResult.getNewPage().add(options.get(i));
        }
        return pageResult;
    }

    /**
     * 差出来所有的未读的话题申请
     *
     * @param waitCheck
     * @return
     */
    public List<Option> selectAllTopicsOptionsByStatus(Integer status) {
        return optionMapper.selectAllTopicsOptionsByStatus(status);
    }


    /**
     * 所有版主的申请
     *
     * @param waitCheck
     * @return
     */
    public List<Option> selectAllBoardManagerOptionsByStatus(Integer status) {
        return optionMapper.selectAllBoardManagerOptionsByStatus(status);
    }

    public Option selectOptionAboutBoardById(String id) {

        return optionMapper.selectOptionAboutBoardById(id);
    }

    public Option selectOptionAboutTopicById(String id) {
        return optionMapper.selectOptionAboutTopicById(id);
    }
}
