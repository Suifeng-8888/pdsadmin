package com.hniois.service.machine.check.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.cate.CateDao;
import com.hniois.dao.machine.check.CheckDao;
import com.hniois.entity.cate.Cate;
import com.hniois.entity.machine.Check;
import com.hniois.entity.machine.CheckRecord;
import com.hniois.service.cate.CateManage;
import com.hniois.service.machine.check.CheckManage;
import com.hniois.util.Const;
import com.hniois.util.DateUtil;
import com.hniois.util.SessionManager;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("checkService")
public class CheckService extends ServiceSupport<Check,CheckDao> implements CheckManage {

    @Resource(name = "checkDaoImpl")
    @Override
    public void setDao(CheckDao dao) {
        this.dao=dao;
    }

    @Override
    public List<Check> sendCheck(Check e) throws Exception {
        return dao.sendCheck(e);
    }

    @Override
    public List<CheckRecord> getRecord(List<Check> list) {

        //获取session中的当前登录用户名
        Session session= SessionManager.getSession();
        String name=(String)session.getAttribute(Const.SESSION_USERNAME);
        //获取当前时间
        String nowTime= DateUtil.getDay();
        //创建定检记录对象集合
        List<CheckRecord> records=new ArrayList<CheckRecord>();
        for(Check ck:list){
            //创建空的定检记录对象
            CheckRecord record=new CheckRecord();
            record.setCheck_time(ck.getCheck_time());
            record.setFactory(ck.getFactory());
            record.setMach_id(ck.getMach_id());
            record.setMach_name(ck.getMach_name());
            record.setCheck_unit(ck.getCheck_unit());
            record.setModel(ck.getModel());
            record.setPeriod(ck.getPeriod());
            record.setSend_time(nowTime);
            record.setSender(name);
            //将定检记录对象添加到集合中
            records.add(record);
        }
        return records;
    }


}
