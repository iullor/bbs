package com.gyl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

/**
 * 用来收发邮件的
 *
 *
 */
@Service
public class EmailService {
    @Autowired
    private JavaMailSenderImpl mailSender;

    public void sendHtml(String userId, String emialAdress) {
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
                    "        学生论坛向您发来了一封激活账户的连接，点击链接用于激活您的账户！\n" +
                    "        <a href=\"http:\\/\\/localhost:8080/bbs/account/active/" + userId + "\" target=\\\"_blank\\\">点这里</a>\n" +
                    "    </div>\n" +
                    "    <div class=\"after-click\">\n" +
                    "        请等待后台服务器处理，5s后跳转到<a href=\"localhost:8080/bbs/logon\">登录主页</a>\n" +
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

    //发送重置后的密码
    public void resetPasswordByEmail(String tmpPassword, String emailAddress) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        //要发送给谁
        mailMessage.setTo(emailAddress);
        //从谁发出
        mailMessage.setFrom("928039229@qq.com");
        //邮件title
        mailMessage.setSubject("密码重置");
        //邮件内容
        mailMessage.setText("经过您本人的操作，本系统已经将你原来的的登陆密码进行重置，重置后的密码为：\t" + tmpPassword + "\t 请登录后及时更改密码");
        //利用spring的
        mailSender.send(mailMessage);
    }
}
