package com.hniois.service.tempFiled.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.tempFiled.TempFiledDao;
import com.hniois.entity.tempFiled.TempFiled;
import com.hniois.service.tempFiled.TempFiledManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
*  模板明细 Service
*/
@Service("tempFiledService")
public class TempFiledService extends ServiceSupport<TempFiled,TempFiledDao> implements TempFiledManage {

    @Resource(name="tempFiledDaoImpl")
    @Override
    public void setDao(TempFiledDao dao) {
        this.dao = dao;
    }

}
