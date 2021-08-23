package com.hoki.zj.login.mapper;

import com.hoki.zj.basic.mapper.BaseMapper;
import com.hoki.zj.login.domain.LoginInfo;
import com.hoki.zj.user.domain.User;

public interface LoginInfoMapper extends BaseMapper<LoginInfo> {
    /** 添加 LoginInfo*/
    void save(LoginInfo loginInfo);

    /** 根据用户名或邮箱或手机查询所有激活的LoginInfo */
    LoginInfo loadByUserNameOrEmailOrPhone(User user);

    /** 根据uid查询登录信息 */
    LoginInfo loadByUid(Long id);

    /** 根据后台用户名查询 */
    LoginInfo loadByUserNameOfEmp(String username);
    /** 根据uid查询登陆信息(后台) */
    LoginInfo loadByUidOfEmp(Long id);
}
