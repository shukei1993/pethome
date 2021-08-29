package com.hoki.zj.quartz.service;

import com.hoki.zj.quartz.domain.QuartzJobInfo;

/**
 * 定时任务业务接口:IQuartzService
 */
public interface IQuartzService {

    /** 添加定时任务 */
    void addJob(QuartzJobInfo quartzJobInfo);

    /** 取消定时任务 */
    void cancelJob(String jobName);

}
