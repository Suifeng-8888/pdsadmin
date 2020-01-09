package com.hniois.trace.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.trace.dao.ProRecordDao;
import com.hniois.trace.entity.Pro_Record;
import com.hniois.trace.service.ProRecordManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("proRecordService")
public class ProRecordService extends ServiceSupport<Pro_Record,ProRecordDao> implements ProRecordManage {

   @Resource(name = "proRecordDaoImpl")

    @Override
    public void setDao(ProRecordDao dao) {
        this.dao=dao;
    }
}
