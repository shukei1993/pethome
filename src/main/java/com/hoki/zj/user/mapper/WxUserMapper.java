package com.hoki.zj.user.mapper;

import com.hoki.zj.basic.mapper.BaseMapper;
import com.hoki.zj.user.domain.WxUser;

public interface WxUserMapper extends BaseMapper<WxUser> {
    
    /** 根据openid查询 */
    WxUser loadByOpenid(String openid);
}
