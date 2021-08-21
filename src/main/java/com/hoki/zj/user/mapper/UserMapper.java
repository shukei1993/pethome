package com.hoki.zj.user.mapper;

import com.hoki.zj.basic.mapper.BaseMapper;
import com.hoki.zj.user.domain.User;

public interface UserMapper extends BaseMapper<User> {

    /** 根据电话查询User对象 */
    User loadByPhone(String phone);
}
