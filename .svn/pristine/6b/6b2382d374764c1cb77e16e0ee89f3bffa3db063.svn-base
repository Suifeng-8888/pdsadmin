package com.hniois.service.repertory.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.repertory.PutRecordDao;
import com.hniois.entity.repertory.PutRecord;
import com.hniois.service.repertory.PutRecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(value = "putRecordService")
public class PutRecordServiceImpl extends ServiceSupport<PutRecord, PutRecordDao> implements PutRecordService {

    @Resource(name = "putRecordDaoImpl")
    @Override
    public void setDao(PutRecordDao dao) {
        this.dao = dao;
    }
}
