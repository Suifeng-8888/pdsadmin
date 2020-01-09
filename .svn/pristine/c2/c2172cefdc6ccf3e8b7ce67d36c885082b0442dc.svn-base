package com.hniois.service.purchase.finance.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.machine.apply.ApplyDao;
import com.hniois.dao.purchase.finance.FinanceDao;
import com.hniois.entity.machine.Apply;
import com.hniois.entity.purchase.Finance;
import com.hniois.service.purchase.finance.FinanceManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("financeService")
public class FinanceService extends ServiceSupport<Finance,FinanceDao> implements FinanceManage {

    @Resource(name = "financeDaoImpl")
    @Override
    public void setDao(FinanceDao dao) {
        this.dao=dao;
    }


}
