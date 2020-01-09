package com.hniois.trace.controller;

import com.hniois.controller.base.BaseController;
import com.hniois.trace.entity.Bag;
import com.hniois.trace.service.BagManage;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/pack")
public class BagAction extends BaseController {
    @Resource(name = "bagService")
    private BagManage bagService;

    /**
     * 查询List
     * @param e
     * @return json
     * */
    @RequestMapping(value="/findList")
    @ResponseBody
    public String findList(Bag e) throws Exception {
        List<Bag> list = bagService.findList(e);
        JSONArray arr = JSONArray.fromObject(list);
        return arr.toString();
    }

    /**
     * 查询TreeList
     * @param e
     * @return json
     * */
    @RequestMapping(value="/findTreeList")
    @ResponseBody
    public String findTreeList(Bag e) throws Exception {
        List<Bag> list = bagService.findTreeList(e);
        JSONArray arr = JSONArray.fromObject(list);
        return arr.toString();
    }
}
