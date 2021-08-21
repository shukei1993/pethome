package com.hoki.zj.test.org;

import com.hoki.zj.test.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;

public class RedisTemplateTest extends BaseTest {

    @Autowired
    private RedisTemplate redisTemplate;

    @Test
    public void test1() throws Exception {
        String phoneNum = "13648081039";
        String o = (String)redisTemplate.opsForValue().get(phoneNum);
        System.out.println(o);
    }

}


