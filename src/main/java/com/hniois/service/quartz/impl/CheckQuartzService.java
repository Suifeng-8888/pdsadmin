package com.hniois.service.quartz.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.machine.apply.ApplyDao;
import com.hniois.dao.quartz.CheckQuartDao;
import com.hniois.entity.machine.Apply;
import com.hniois.entity.quartz.CheckQuartz;
import com.hniois.service.quartz.CheckQuartzManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("checkQuartzService")
public class CheckQuartzService extends ServiceSupport<CheckQuartz,CheckQuartDao> implements CheckQuartzManage {

    @Resource(name = "checkQuartzDaoImpl")
    @Override
    public void setDao(CheckQuartDao dao) {
        this.dao=dao;
    }
}
