package com.hniois.service.demo.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.demo.DemoDao;
import com.hniois.entity.demo.Demo;
import com.hniois.service.demo.DemoManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("demoService")
public class DemoService extends ServiceSupport<Demo,DemoDao> implements DemoManage {

    @Resource(name="demoDaoImpl")
    @Override
    public void setDao(DemoDao dao) {
        this.dao = dao;
    }

    @Override
    public List<Demo> findTableField(Demo e) throws Exception{
        return dao.findTableField(e);
    }
}
