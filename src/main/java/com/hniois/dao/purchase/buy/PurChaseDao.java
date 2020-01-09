package com.hniois.dao.purchase.buy;

import com.hniois.common.dao.Dao;
import com.hniois.entity.machine.Apply;
import com.hniois.entity.purchase.Purchase;

import java.util.List;

public interface PurChaseDao extends Dao<Purchase> {

    public List<Purchase> sendRecord(Purchase e) throws Exception;
}
