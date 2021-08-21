package com.hoki.zj.user.service;

import com.hoki.zj.basic.service.IBaseService;
import com.hoki.zj.user.domain.User;
import com.hoki.zj.user.domain.dto.UserDTO;

import java.util.Map;

public interface IUserService extends IBaseService<User> {

    /** 根据电话查询User对象 */
    User loadByPhone(String phone);

    /** 1前端前台用户注册 */
    void register(UserDTO userDTO);

    /** 2.前端前台用户登录 */
    Map<String, Object> login(User user);
}
