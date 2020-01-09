package com.hniois.service.item;

import com.hniois.common.service.Service;
import com.hniois.entity.item.Item;
import com.hniois.entity.send.SendCheck;

import java.util.List;

public interface ItemManage extends Service<Item> {
    List<Item> sendCheck(Item item) throws Exception;
}
