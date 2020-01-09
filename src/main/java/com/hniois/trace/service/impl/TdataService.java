package com.hniois.trace.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.trace.dao.TdataDao;
import com.hniois.trace.entity.TraceData;
import com.hniois.trace.service.TdataManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("tdataService")
public class TdataService extends ServiceSupport<TraceData,TdataDao> implements TdataManage {

   @Resource(name = "tdataDaoImpl")
    @Override
    public void setDao(TdataDao dao) {
        this.dao=dao;
    }
}
