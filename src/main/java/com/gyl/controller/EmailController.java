package com.gyl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

/**
 * 邮件的收发
 *
 * @author gyl
 */
@Controller
@RequestMapping(value = "/email")
public class EmailController {
    @Autowired
    private JavaMailSenderImpl mailSender;

    @RequestMapping(value = "/sendCode")
    public void sendTo() {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        //要发送给谁
        mailMessage.setTo("facing2tworld@gmail.com");
        //从谁发出
        mailMessage.setFrom("928039229@qq.com");

        //邮件title
        mailMessage.setSubject("测试");
        //邮件内容
        mailMessage.setText("你好呀");
        //利用spring的
        mailSender.send(mailMessage);

    }
}
