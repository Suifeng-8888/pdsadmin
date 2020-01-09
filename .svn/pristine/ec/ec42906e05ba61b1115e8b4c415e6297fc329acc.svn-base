package com.hniois.service.purchase.result.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.purchase.buy.PurChaseDao;
import com.hniois.dao.purchase.result.ResultDao;
import com.hniois.entity.purchase.Finance;
import com.hniois.entity.purchase.PurApprove;
import com.hniois.entity.purchase.Purchase;
import com.hniois.entity.purchase.Result;
import com.hniois.service.purchase.finance.FinanceManage;
import com.hniois.service.purchase.purapprove.PurApproveManage;
import com.hniois.service.purchase.result.ResultManage;
import com.hniois.util.StringUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("resultService")
public class ResultService extends ServiceSupport<Result,ResultDao> implements ResultManage {

    @Resource(name = "resultDaoImpl")
    @Override
    public void setDao(ResultDao dao) {
        this.dao=dao;
    }

}
