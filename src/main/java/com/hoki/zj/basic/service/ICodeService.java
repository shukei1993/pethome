package com.hoki.zj.basic.service;

import java.util.Map;

public interface ICodeService {
    /** 发送验证码 */
    void sendVerifyCode(Map<String, String> map);
}
