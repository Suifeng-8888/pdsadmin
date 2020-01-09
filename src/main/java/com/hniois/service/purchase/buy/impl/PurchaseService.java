package com.hniois.service.purchase.buy.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.machine.apply.ApplyDao;
import com.hniois.dao.purchase.buy.PurChaseDao;
import com.hniois.entity.machine.Apply;
import com.hniois.entity.purchase.Finance;
import com.hniois.entity.purchase.PurApprove;
import com.hniois.entity.purchase.Purchase;
import com.hniois.service.purchase.buy.PurchaseManage;
import com.hniois.service.purchase.finance.FinanceManage;
import com.hniois.service.purchase.purapprove.PurApproveManage;
import com.hniois.util.StringUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("purchaseService")
public class PurchaseService extends ServiceSupport<Purchase,PurChaseDao> implements PurchaseManage {

    @Resource(name = "purchaseDaoImpl")
    @Override
    public void setDao(PurChaseDao dao) {
        this.dao=dao;
    }

    @Resource(name = "purApproveService")
    private PurApproveManage purApproveService;

    @Resource(name="financeService")
    private FinanceManage financeService;
    /**
     * 去询价
     * @param e
     * @return
     */
    @Override
    public Boolean saveAsk(Purchase e) throws Exception{
        boolean success=true;
        //保存询价对象
        Purchase purchase = new Purchase();
        purchase.setPro_id(e.getPro_id());
        purchase.setPro_name(e.getPro_name());
        purchase.setSupply_id(e.getSupply_id());
        purchase.setPur_batch(e.getPur_batch());
        purchase.setPrice(e.getPrice());
        purchase.setBuyer(e.getBuyer());
        purchase.setPur_num(e.getPur_num());
        purchase.setSupply_name(e.getSupply_name());
        dao.save(purchase);
        //同时更改审批表中的询价状态和询价人及询价时间
        PurApprove purApprove = new PurApprove();
        purApprove.setPro_id(e.getPro_id());
        purApprove = purApproveService.find(purApprove);
        purApprove.setPurchaser(e.getBuyer());
        purApprove.setState("0");
        purApproveService.update(purApprove);

        return success;
    }


    /**
     * 批量保存要备案的信息
     * @param e
     * @return
     */
    @Override
    public Boolean goRecord(Purchase e) {
        Boolean insert=true;
        try{
            List<Purchase> purlist=dao.sendRecord(e);
            List<Finance> finlist=new ArrayList<Finance>();
            for(Purchase pur:purlist){
                //创建财务对象,然后添加财务审批表
                Finance finance=new Finance();
                finance.setPro_name(pur.getPro_name());
                finance.setPur_num(StringUtil.StringSum(pur.getPur_num()));
                finance.setPur_batch(pur.getPur_batch());
                finance.setPrice(StringUtil.StringSum2(pur.getPrice(),pur.getPur_num()));
                finlist.add(finance);
            }
            //批量插入财务审批表中
            financeService.saveBatch(finlist);

            //批量更改财务备案状态
            e.setRecord("0");
            dao.updateBatch(e);
        }catch (Exception ex){
            insert=false;
            ex.printStackTrace();
        }
        return insert;
    }


}
