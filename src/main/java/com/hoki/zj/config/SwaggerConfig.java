package com.hoki.zj.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration // 声明打当前类是一个配置类
@EnableSwagger2 // 启用swagger的注解
public class SwaggerConfig {
    @Bean // 将该方法返回的对象交给Spring管理
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo()) // 调用方法获取一个apiInfo api说明
                .select()
                //对外暴露服务的包,以controller的方式暴露,所以就是controller的包.
                .apis(RequestHandlerSelectors.basePackage("com.hoki.zj"))
                .paths(PathSelectors.any())
                .build(); // 创建Docket
    }


    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("系统中心api")
                .description("系统中心服务接口文档说明")
                .contact(new Contact("hmtest", "", "hm@itsource.cn"))
                .version("1.0")
                .build(); // 创建ApiInfo
    }
}