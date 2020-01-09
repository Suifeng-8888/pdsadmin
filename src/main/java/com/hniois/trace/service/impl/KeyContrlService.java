package com.hniois.trace.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.trace.dao.KeyContrlDao;
import com.hniois.trace.entity.Key_Control;
import com.hniois.trace.service.KeyContrlManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("keyContrlService")
public class KeyContrlService extends ServiceSupport<Key_Control,KeyContrlDao> implements KeyContrlManage {

   @Resource(name = "keyContrlDaoImpl")
    @Override
    public void setDao(KeyContrlDao dao) {
        this.dao=dao;
    }
}
