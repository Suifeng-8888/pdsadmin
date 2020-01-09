package com.hniois.service.purchase.supplier.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.purchase.supplier.SupplierDao;
import com.hniois.entity.purchase.Supplier;
import com.hniois.service.purchase.supplier.SupplierManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("supplierService")
public class SupplierService extends ServiceSupport<Supplier,SupplierDao> implements SupplierManage {
    @Resource(name="supplierDaoImpl")
    @Override
    public void setDao(SupplierDao dao) {
        this.dao = dao;
    }

}
