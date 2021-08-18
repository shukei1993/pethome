package com.hoki.zj.utils;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

import java.io.IOException;

public class MSGSenderTool {

    public static void sendMsg(String phoneNum, String msg) {

        HttpClient client = new HttpClient();
        try {
            PostMethod post = new PostMethod("http://utf8.api.smschinese.cn/"); // utf-8编码
            post.addRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");//在头文件中设置转码
            NameValuePair[] data = {
                    new NameValuePair("Uid", "aria"), // 本站用户名
                    new NameValuePair("Key", "d41d8cd98f00b204e980"), // 接口安全密钥
                    new NameValuePair("smsMob", phoneNum),
                    new NameValuePair("smsText", msg)};
            post.setRequestBody(data);

            client.executeMethod(post);
            Header[] headers = post.getResponseHeaders();
            int statusCode = post.getStatusCode();
            System.out.println("statusCode:" + statusCode);
            for (Header h : headers) {
//                System.out.println(h.toString());
            }
            String result = new String(post.getResponseBodyAsString().getBytes("utf-8"));
            System.out.println(result); //打印返回消息状态

            post.releaseConnection();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
