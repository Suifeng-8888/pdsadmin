package com.hniois.service.machine.checkrecord.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.machine.checkRecord.CheckRecordDao;
import com.hniois.entity.machine.CheckRecord;
import com.hniois.service.machine.checkrecord.CheckRecordManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("checkRecordService")
public class CheckRecordService extends ServiceSupport<CheckRecord,CheckRecordDao> implements CheckRecordManage {

    @Resource(name = "checkRecordDaoImpl")
    @Override
    public void setDao(CheckRecordDao dao) {
        this.dao=dao;
    }
}
