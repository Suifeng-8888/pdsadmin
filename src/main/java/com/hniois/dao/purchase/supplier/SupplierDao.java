package com.hniois.dao.purchase.supplier;

import com.hniois.common.dao.Dao;
import com.hniois.entity.purchase.Supplier;

import java.util.List;

public interface SupplierDao extends Dao<Supplier> {

    List<Supplier> findlistByIds(Supplier e)throws Exception;
}
