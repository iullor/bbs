package com.gyl.controller.person;

import com.gyl.entity.Message;
import com.gyl.entity.User;
import com.gyl.service.MessageService;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 个人消息
 *
 * @author gyl
 */
@Controller
public class MyMessageController {

    @Autowired
    private MessageService messageService;

    /**
     * 个人消息
     *
     * @return
     */
    @RequestMapping(value = "/person/message/{status}", method = RequestMethod.GET)
    public String list(Integer status, HttpServletRequest request, Model model) {
        final User user = (User) request.getSession().getAttribute("CURRENT_USER");
        if (status == null) {
            status = 0;
        }
        List<Message> messages = messageService.listMyMessage(user.getId(), status);
        model.addAttribute("messages", messages);
        return "/person/message/message";
    }


    @ResponseBody
    @RequestMapping(value = "/person/message/hasRead/{status}", method = RequestMethod.GET)
    public List<Message> hasRead(@PathVariable("status") Integer status, HttpServletRequest request) {
        final User user = (User) request.getSession().getAttribute("CURRENT_USER");
        if (status == null) {
            status = 1;
        }
        List<Message> messages = messageService.listMyMessage(user.getId(), status);
        return messages;
    }

    /**
     * ajax，更改状态
     *
     * @return
     */
    @RequestMapping(value = "/person/message/update/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Integer update(@PathVariable("id") Integer id) {
        int status = messageService.updateStatusById(id, 1);
        return status;
    }

}
