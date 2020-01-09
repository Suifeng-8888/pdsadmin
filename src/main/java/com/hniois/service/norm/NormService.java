package com.hniois.service.norm;

import com.hniois.common.service.Service;
import com.hniois.entity.norm.Norm;

public interface NormService extends Service<Norm> {
    /**
     * 标准编号，名称重复验证
     * @param norm
     * @return
     */
    Integer repeatedVerification(Norm norm) throws Exception;
}
