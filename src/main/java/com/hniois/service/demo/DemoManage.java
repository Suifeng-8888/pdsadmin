package com.hniois.service.demo;

import com.hniois.common.service.Service;
import com.hniois.entity.demo.Demo;

import java.util.List;

public interface DemoManage extends Service<Demo>{

    List<Demo> findTableField(Demo e) throws Exception;


}
