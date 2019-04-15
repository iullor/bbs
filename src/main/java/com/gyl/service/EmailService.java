package com.gyl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

/**
 * 用来收发邮件的
 *
 * @author gyl
 */
@Service
public class EmailService {
    @Autowired
    private JavaMailSenderImpl mailSender;

    public void sendHtml(String userId,String emialAdress){
        MimeMessage mimeMsg = mailSender.createMimeMessage();
        MimeMessageHelper helper = null;
        try {
            helper = new MimeMessageHelper(mimeMsg, true);
            String html = "<html>\n" +
                    "<head>\n" +
                    "    <title>新用户账号激活</title>\n" +
                    "    <style>\n" +
                    "        body{\n" +
                    "            position: absolute;\n" +
                    "            top: 50px;\n" +
                    "            left: 30%\n" +
                    "        }\n" +
                    "    </style>\n" +
                    "</head>\n" +
                    "<body>\n" +
                    "    <div class=\"before-click\">\n" +
                    "        xxx学生论坛向您发来了一封激活账户的连接，点击链接用于激活您的账户！\n" +
                    "        <a href=\"localhost:8080/account/active/"+userId+"\">点这里</a>\n" +
                    "    </div>\n" +
                    "    <div class=\"after-click\">\n" +
                    "        请等待后台服务器处理，5s后跳转到<a href=\"localhost:8080/logon\">登录主页</a>\n" +
                    "    </div>\n" +
                    "</body>\n" +
                    "\n" +
                    "</html>";
            helper.setTo(emialAdress);
            helper.setFrom("928039229@qq.com");
            helper.setSubject("新用户账号激活");
            helper.setText(html, true);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        mailSender.send(mimeMsg);
    }


}
