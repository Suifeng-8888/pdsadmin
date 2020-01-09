package com.hniois.trace.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.trace.dao.BatchDao;
import com.hniois.trace.entity.Batch_Material;
import com.hniois.trace.service.BatchManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("batchService")
public class BatchService extends ServiceSupport<Batch_Material,BatchDao> implements BatchManage {

    @Resource(name = "batchDaoImpl")
    @Override
    public void setDao(BatchDao dao) {
        this.dao=dao;
    }
}
