package com.hniois.dao.item;

import com.hniois.common.dao.Dao;
import com.hniois.entity.item.Item;

import java.util.List;

public interface ItemDao extends Dao<Item> {
    List<Item> sendCheck(Item item) throws Exception;
}
