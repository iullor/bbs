package com.gyl.mapper;

import com.gyl.entity.Message;
import org.apache.ibatis.annotations.Param;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author gyl
 */
@Repository
public interface MessageMapper {

    List<Message> listMyMessage(@Param("userId") String userId, @Param("readStatus") int readStatus);

    int sendCommentToUser(Message message);

    int updateStatusById(@Param("id") Integer id, @Param("readStatus") Integer readStatus);
}
