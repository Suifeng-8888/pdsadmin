package com.hniois.service.purchase.purapply.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.machine.apply.ApplyDao;
import com.hniois.dao.purchase.purapply.PurApplyDao;
import com.hniois.entity.machine.Apply;
import com.hniois.entity.purchase.PurApply;
import com.hniois.entity.purchase.PurApprove;
import com.hniois.service.machine.apply.ApplyManage;
import com.hniois.service.purchase.purapply.PurApplyManage;
import com.hniois.service.purchase.purapprove.PurApproveManage;
import com.hniois.util.Const;
import com.hniois.util.DateUtil;
import com.hniois.util.SessionManager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service("purApplyService")
public class PurApplyService extends ServiceSupport<PurApply,PurApplyDao> implements PurApplyManage {

    @Resource(name = "purApplyDaoImpl")
    @Override
    public void setDao(PurApplyDao dao) {
        this.dao=dao;
    }

    @Resource(name = "purApproveService")
    private PurApproveManage purApproveService;

    @Override
    public Boolean goApprove(PurApply e){
        Boolean goApp=true;
        //批量更新申请的审批状态
        String approver=(String) SessionManager.getSession().getAttribute(Const.SESSION_USERNAME);
        String approve_time=DateUtil.getDay();
        try{
            if(e.getStatus().equals("0")){//审批同意,批量新增采购审批表
                List<String> ids=e.getData();
                List<PurApprove> list=new ArrayList<PurApprove>();
                for(String id:ids){
                    PurApply app=new PurApply();
                    app.setId(id);
                    app= dao.find(app);
                    PurApprove purApprove=new PurApprove();
                    purApprove.setPro_id(app.getPro_id());
                    purApprove.setApprover(approver);
                    purApprove.setApprove_time(approve_time);
                    purApprove.setPro_name(app.getPro_name());
                    purApprove.setPur_batch(app.getBz());
                    purApprove.setApply_time(app.getApply_time());
                    purApprove.setApplyer(app.getApplyer());
                    purApprove.setPur_num(app.getPur_num());
                    list.add(purApprove);
                }
                purApproveService.saveBatch(list);
            }
            dao.updateBatch(e);
        }catch(Exception ex){
            goApp=false;
        }
        return goApp;
    }
}
