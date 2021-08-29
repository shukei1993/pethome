package com.hoki.zj.quartz.service.impl;

import com.hoki.zj.quartz.domain.QuartzJobInfo;
import com.hoki.zj.quartz.job.OrderJob;
import com.hoki.zj.quartz.service.IQuartzService;
import com.hoki.zj.quartz.utils.QuartzUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Service;

/**
 * 定时器任务接口实现类:QuartzServiceImpl
 */
@Service
public class QuartzServiceImpl implements IQuartzService {

    /** 注解注入创建调度器对象 */
    @Autowired
    private SchedulerFactoryBean factoryBean;

    /**
     * 1.订单定时任务:添加
     * @param quartzJobInfo 封装参数(jobName,params,time)
     */
    @Override
    public void addJob(QuartzJobInfo quartzJobInfo) {
        /*
         * sched 调度器
         * jobName 任务名
         * cls 具体任务
         * params 携带的参数
         * time 触发器的时间
         */
        QuartzUtils.addJob(factoryBean.getScheduler(),
                quartzJobInfo.getJobName(),
                OrderJob.class,
                quartzJobInfo.getParams(),
                quartzJobInfo.getCronj());
    }

    /**
     * 2.订单定时任务:取消
     * @param jobName 任务名
     */
    @Override
    public void cancelJob(String jobName) {
        QuartzUtils.removeJob(factoryBean.getScheduler(), jobName);
    }
}
