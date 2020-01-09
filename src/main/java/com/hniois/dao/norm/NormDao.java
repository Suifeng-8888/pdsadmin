package com.hniois.dao.norm;

import com.hniois.common.dao.Dao;
import com.hniois.entity.norm.Norm;

public interface NormDao extends Dao<Norm> {
    /**
     * 标准编号，名称重复验证
     * @param norm
     * @return
     */
    Integer repeatedVerification(Norm norm) throws Exception;

}
