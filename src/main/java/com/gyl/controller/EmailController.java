package com.gyl.controller;

import com.gyl.entity.Email;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

/**
 * 邮件的收发
 *
 * @author gyl
 */
@Controller
public class EmailController {
    @Autowired
    private JavaMailSenderImpl mailSender;

    @RequestMapping(value = "/email", method = RequestMethod.POST)
    public String sendTo(Email email) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        //要发送给谁
        mailMessage.setTo(email.getToEmailAddress());
        //从谁发出
        mailMessage.setFrom(email.getFromEmailAddress());
        //邮件title
        mailMessage.setSubject(email.getEmailTitle());
        //邮件内容
        mailMessage.setText(email.getEmailContent());
        //利用spring的
        mailSender.send(mailMessage);
        return "redirect:/person/myCircle";
    }
    //自由发邮件

}
