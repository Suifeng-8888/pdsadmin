package com.hniois.service.machine.check;

import com.hniois.common.service.Service;
import com.hniois.entity.cate.Cate;
import com.hniois.entity.machine.Check;
import com.hniois.entity.machine.CheckRecord;
import com.hniois.entity.send.SendCheck;

import java.util.List;

public interface CheckManage extends Service<Check> {

    /**
     * 送检仪器接口,获取送检仪器信息
     * @param e
     * @return
     * @throws Exception
     */
    List<Check> sendCheck(Check e) throws Exception;

    /**
     * 根据送检的对象信息获取定检记录集合的信息
     */
    List<CheckRecord> getRecord(List<Check> list);
}
