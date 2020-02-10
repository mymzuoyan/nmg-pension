package com.fedtech.pension.sys.service;

import com.alibaba.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Value;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 * @author gengqiang
 * @date 2018/1/24
 */
@Service(version = "1.0.0", interfaceClass = EmailService.class, timeout = 0, retries = 0)
public class EmailServiceImpl implements EmailService {

    @Value("${email.host}")
    private String emailHost;
    @Value("${email.username}")
    private String emailFrom;
    @Value("${email.password}")
    private String emailPassword;

    @Override
    public void send(String toUser, String subject, String text) throws Exception {
        // 创建Properties 类用于记录邮箱的一些属性
        final Properties props = new Properties();
        // 表示SMTP发送邮件，必须进行身份验证
        props.put("mail.smtp.auth", "true");
        //此处填写SMTP服务器
        props.put("mail.smtp.host", "smtp.126.com");
        props.put("mail.smtp.port", "25");
        // 此处填写你的账号
        props.put("mail.user", emailFrom);
        // 此处的密码就是前面说的16位STMP口令 授权码
        props.put("mail.password", emailPassword);

        // 构建授权信息，用于进行SMTP进行身份验证
        Authenticator authenticator = new Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {
                // 用户名、密码
                String userName = props.getProperty("mail.user");
                String password = props.getProperty("mail.password");
                return new PasswordAuthentication(userName, password);
            }
        };
        // 使用环境属性和授权信息，创建邮件会话
        Session mailSession = Session.getInstance(props, authenticator);
        // 创建邮件消息
        MimeMessage message = new MimeMessage(mailSession);
        // 设置发件人
        InternetAddress form = new InternetAddress(
                props.getProperty("mail.user"));
        message.setFrom(form);

        // 设置收件人的邮箱
        InternetAddress to = new InternetAddress(toUser);
        message.setRecipient(MimeMessage.RecipientType.TO, to);

        // 设置邮件标题
        message.setSubject(subject);

        // 设置邮件的内容体
        message.setContent(text, "text/html;charset=UTF-8");

        // 最后当然就是发送邮件啦
        Transport.send(message);
    }
}
