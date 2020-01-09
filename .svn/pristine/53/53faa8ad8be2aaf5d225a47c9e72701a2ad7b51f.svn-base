package com.hniois.service.item.impl;

import com.hniois.common.service.ServiceSupport;
import com.hniois.dao.item.ItemDao;
import com.hniois.entity.item.Item;
import com.hniois.entity.send.SendCheck;
import com.hniois.service.item.ItemManage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("itemService")
public class ItemService extends ServiceSupport<Item,ItemDao> implements ItemManage {

    @Resource(name = "itemDaoImpl")
    @Override
    public void setDao(ItemDao dao) {
        this.dao=dao;
    }

    @Override
    public List<Item> sendCheck(Item item) throws Exception {
        return dao.sendCheck(item);
    }
}
