package com.gyl.mapper;

import com.gyl.entity.Option;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OptionMapper {

    int deleteById(@Param("id") String id);

    int insert(Option option);

    Option selectById(@Param("id") String id);

    int updateById(Option option);

    List<Option> selectAllOptionsByStatus(@Param("status") Integer status);

    List<Option> selectByApplyUserId(@Param("applyUserId") String applyUserId);

    /**
     * 根据审核的状态查询所有的贴子
     *
     * @param status
     * @return
     */
    List<Option> selectAllPostsOptionsByStatus(@Param("status") Integer status);

    int updateOptionById(@Param("option")Option option);

    List<Option> selectAllPostsOptionsHasChecked();
}