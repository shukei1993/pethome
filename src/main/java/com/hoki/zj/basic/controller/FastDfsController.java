package com.hoki.zj.basic.controller;

import com.hoki.zj.utils.AjaxResult;
import com.hoki.zj.utils.FastdfsUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/fastDfs")
public class FastDfsController {

    /**
     * 1.文件上传
     * @param file 接收上传过来的文件
     * @return
     */
    @RequestMapping("/upload")
    @ResponseBody
    public AjaxResult uploadFile(MultipartFile file) {
        try {
            // 1.获取原始文件名
            String filename = file.getOriginalFilename();
            // 2.获取文件后缀
            String suffix = filename.substring(filename.lastIndexOf(".") + 1);
            // 3.调用工具类上传
            String path = FastdfsUtils.upload(file.getBytes(), suffix);
            // 4.将返回的path设置到AjaxResult对象返回
            return AjaxResult.me().setResultObj(path);
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxResult(e.getMessage());
        }
    }

    /**
     * 2.上传文件删除
     * @param path
     * @return
     */
    @DeleteMapping
    @ResponseBody
    public AjaxResult deleteFile(@RequestParam(required = true,value = "path") String path) {
        try {
            String substring = path.substring(path.lastIndexOf("//"));
            String[] split = substring.split("/");
            String remotePath = substring.split("//group1/")[1];
            String groupName = split[2];
            FastdfsUtils.delete(groupName, remotePath);
            return  AjaxResult.me();
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxResult(e.getMessage());
        }
    }

}
