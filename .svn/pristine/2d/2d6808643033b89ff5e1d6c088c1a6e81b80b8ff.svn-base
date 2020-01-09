package com.hniois.service.machine.record.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.machine.record.RecordDao;
import com.hniois.entity.machine.Record;
import com.hniois.service.machine.record.RecordManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("recordService")
public class RecordService extends ServiceSupport<Record,RecordDao> implements RecordManage{

    @Resource(name="recordDaoImpl")
    @Override
    public void setDao(RecordDao dao) {
        this.dao = dao;
    }
}
