package com.hniois.service.send.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.send.SendDao;
import com.hniois.entity.send.SendCheck;
import com.hniois.service.send.SendManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("sendService")
public class SendService extends ServiceSupport<SendCheck,SendDao> implements SendManage {

    @Resource(name = "sendDaoImpl")
    public void setDao(SendDao dao){
        this.dao=dao;
    }

}
