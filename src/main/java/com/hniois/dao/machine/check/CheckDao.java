package com.hniois.dao.machine.check;

import com.hniois.common.dao.Dao;
import com.hniois.entity.machine.Check;

import java.util.List;

public interface CheckDao extends Dao<Check> {

    /**
     * 送检样品接口
     * @param e
     * @return
     * @throws Exception
     */
    public List<Check> sendCheck(Check e) throws Exception;
}
