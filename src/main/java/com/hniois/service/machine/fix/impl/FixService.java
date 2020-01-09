package com.hniois.service.machine.fix.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.machine.fix.FixDao;
import com.hniois.entity.machine.Fix;
import com.hniois.service.machine.fix.FixManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("fixService")
public class FixService extends ServiceSupport<Fix,FixDao> implements FixManage {

    @Resource(name="fixDaoImpl")
    @Override
    public void setDao(FixDao dao) {
        this.dao=dao;
    }
}
