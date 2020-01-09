package com.hniois.dao.repertory;

import com.hniois.common.dao.Dao;
import com.hniois.entity.repertory.Repertory;

public interface RepertoryDao extends Dao<Repertory>{

    Repertory selectById(Integer id) throws Exception;
}
