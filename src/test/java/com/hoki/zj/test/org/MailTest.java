package com.hoki.zj.test.org;

import com.hoki.zj.test.BaseTest;
import com.hoki.zj.utils.MailSenderTool;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

import javax.mail.internet.MimeMessage;
import java.io.File;

public class MailTest extends BaseTest {
    /** 注解注入创建JavaMailSender对象 */
    @Autowired
    private JavaMailSender javaMailSender;

    // 创建工具类对象
    MailSenderTool mailSenderTool = new MailSenderTool();

    @Test
    public void test1() throws Exception {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();

        String from = "zj93830@sina.cn";
        String text = "<h1>测试</ht></hr>";
        File file = new File("D:\\picture\\shizuri_vollen.jpg");
        String to = "1204835998@qq.com";

        mailSenderTool.sendMail(mimeMessage,true, "utf-8", from, "审核已驳回",
                text, true, "1.jpg", file, to);

        javaMailSender.send(mimeMessage);
    }
}
