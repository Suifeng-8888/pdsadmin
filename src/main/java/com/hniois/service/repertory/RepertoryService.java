package com.hniois.service.repertory;

import com.hniois.common.service.Service;
import com.hniois.entity.repertory.Repertory;

public interface RepertoryService extends Service<Repertory>{

    Repertory selectById(String id) throws Exception;
}
