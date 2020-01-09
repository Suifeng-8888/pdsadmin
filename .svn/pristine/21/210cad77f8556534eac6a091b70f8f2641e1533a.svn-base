package com.hniois.service.machine.apply.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.machine.apply.ApplyDao;
import com.hniois.entity.machine.Apply;
import com.hniois.service.machine.apply.ApplyManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("applyService")
public class ApplyService extends ServiceSupport<Apply,ApplyDao> implements ApplyManage {

    @Resource(name = "applyDaoImpl")
    @Override
    public void setDao(ApplyDao dao) {
        this.dao=dao;
    }
}
