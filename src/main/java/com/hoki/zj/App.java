package com.hoki.zj;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan({"com.hoki.zj.org.mapper", "com.hoki.zj.permission.mapper"})
public class App {

    public static void main(String[] args) {
        SpringApplication.run(App.class, args);
    }
}
