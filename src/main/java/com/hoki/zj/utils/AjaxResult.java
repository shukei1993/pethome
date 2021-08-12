package com.hoki.zj.utils;

import lombok.Data;

import java.io.Serializable;

/**
 * Ajax请求的返回内容:增删改
 *    success:成功与否
 *    message:失败原因
 */
@Data //getter setter toString
public class AjaxResult {

    private boolean success = true;
    private String message = "操作成功!";

    private Object resultObj;

    private Serializable sessionId;

    public boolean isSuccess() {
        return success;
    }

    //链式编程,可以继续. 设置完成后自己对象返回
    public AjaxResult setSuccess(boolean success) {
        this.success = success;
        return this;
    }

    public AjaxResult setResultObj(Object resultObj){
        this.resultObj = resultObj;
        return  this;
    }

    public String getMessage() {
        return message;
    }

    public AjaxResult setMessage(String message) {
        this.message = message;
        return this;
    }

    //默认成功
    public AjaxResult() {
    }

    //失败调用
    public AjaxResult(String message) {
        this.success = false;
        this.message = message;
    }

    //不要让我创建太多对象
    public static AjaxResult me(){
        return new AjaxResult();
    }

    public static void main(String[] args) {
        AjaxResult.me().setMessage("xxx").setSuccess(false);
    }
}