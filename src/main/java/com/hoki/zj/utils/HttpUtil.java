package com.hoki.zj.utils;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Slf4j
/**
 * 三方登录发送http请求工具类:HttpUtil
 */
public class HttpUtil {

    public static String sendPost(String url, Map<String,String> params){
        try {
            //创建http客户端
            HttpClient client = new HttpClient();
            //创建post请求，指定请求地址
            PostMethod post = new PostMethod(url);
            //设置请求头
            post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");//在头文件中设置转码
            //添加参数：循环map，把map中的数据变成List
            Set<String> keys = params.keySet();
            List<NameValuePair> paramList = new ArrayList<>();
            for(String key: keys){
                String value = params.get(key);
                paramList.add(new NameValuePair(key, value));
            }
            //把list变成数组
            NameValuePair[] data = paramList.toArray(new NameValuePair[]{}) ;

            post.setRequestBody(data);
            //执行请求
            client.executeMethod(post);
            //获取结果
            String result = new String(post.getResponseBodyAsString().getBytes("utf-8"));

            //打印返回消息状态
            log.info("HttpUtil#sendPost： 网络请求结果{}",result);
            //释放连接
            post.releaseConnection();

            return result;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    //发送Git请求
    public static String sendGet(String url){
        try {
            //创建http客户端
            HttpClient client = new HttpClient();
            //创建post请求，指定请求地址
            GetMethod get = new GetMethod(url);
            //设置请求头
            get.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");//在头文件中设置转码

            //执行请求
            client.executeMethod(get);
            //获取结果
            String result = new String(get.getResponseBodyAsString().getBytes("utf-8"));

            //打印返回消息状态
            log.info("HttpUtil#sendPost： 网络请求结果{}",result);
            //释放连接
            get.releaseConnection();

            return result;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}