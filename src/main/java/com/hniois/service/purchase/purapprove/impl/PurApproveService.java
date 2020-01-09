package com.hniois.service.purchase.purapprove.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.machine.apply.ApplyDao;
import com.hniois.dao.purchase.purapprove.PurApproveDao;
import com.hniois.entity.machine.Apply;
import com.hniois.entity.purchase.PurApprove;
import com.hniois.service.purchase.purapprove.PurApproveManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("purApproveService")
public class PurApproveService extends ServiceSupport<PurApprove,PurApproveDao> implements PurApproveManage {

    @Resource(name = "purApproveDaoImpl")
    @Override
    public void setDao(PurApproveDao dao) {
        this.dao=dao;
    }


    @Override
    public List<PurApprove> findlistByIds(PurApprove e) throws Exception {
        return dao.findlistByIds(e);
    }
}
