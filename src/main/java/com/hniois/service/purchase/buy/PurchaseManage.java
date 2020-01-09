package com.hniois.service.purchase.buy;

import com.hniois.common.service.Service;
import com.hniois.entity.machine.Apply;
import com.hniois.entity.purchase.Purchase;

import java.util.List;

public interface PurchaseManage extends Service<Purchase> {

    /**
     * 去询价
     * @param e
     * @return
     */
    Boolean saveAsk(Purchase e) throws Exception;


    /**
     * 去财务备案
     */

    Boolean goRecord(Purchase e);
}
