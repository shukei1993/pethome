package com.hoki.zj.utils;

import lombok.Data;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.File;

/**
 * 邮件发送工具类:MailSender
 */
@Data
public class MailSenderTool {

    public void sendMail(MimeMessage mimeMessage, Boolean state, String encoding, String from, String subject,
                         String text, Boolean isHtml, String fileName, File file, String to) throws MessagingException {
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, state, encoding);
        // 设置发件人
        helper.setFrom(from);
        // 设置主题
        helper.setSubject(subject);
        // 设置内容,是否用html形式解析
        helper.setText(text, isHtml);
        // 添加附件
        helper.addAttachment(fileName, file);
        // 设置收件人
        helper.setTo(to);
    }

}
