package com.hniois.trace.service.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.trace.dao.OrderDao;
import com.hniois.trace.entity.Order;
import com.hniois.trace.service.OrderManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("orderService")
public class OrderService extends ServiceSupport<Order,OrderDao> implements OrderManage{
    @Resource(name="orderDaoImpl")
    @Override
    public void setDao(OrderDao dao) {
        this.dao=dao;
    }
}
