package com.hniois.controller.norm;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.norm.Norm;
import com.hniois.entity.norm.NormDetail;
import com.hniois.service.norm.NormDetailService;
import com.hniois.service.norm.NormService;
import com.hniois.util.DateUtil;
import com.hniois.util.SessionManager;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 *  检测标准 action
 */
@Controller
@RequestMapping(value = "/norm")
public class NormAction extends BaseController{

    @Resource(name = "normService")
    private NormService normService;

    @Resource(name = "normDetailService")
    private NormDetailService normDetailService;

    private String norm_list = "norm/norm_list";

    private String norm_edit = "norm/norm_edit";
    /**
     *  进入检测标准列表方法
     * @return
     */
    @RequestMapping(value = "/toPage")
    public ModelAndView toPage(Page page) {
        ModelAndView mv = getModelAndViewToPage(page);
        mv.setViewName(norm_list);
        return mv;
    }

    /**
     * norm分页列表
     * @param
     * @return json
     * */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String list(Norm e) throws Exception{
        // 当前页
        int currPage = getThisPage(e.getPage());
        // 每页显示条数
        int limit = getThisLimit(e.getLimit());

        e.setOffset((currPage-1)*limit);
        e.setPageSize(limit);
        Page page = normService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 查询count总数
     * @param norm
     * @return
     */
    @RequestMapping(value = "/findCount")
    @ResponseBody
    public String findCount(Norm norm) throws Exception {
        Integer count = normService.findCount(norm);
        return String.valueOf(count);
    }

    /**
     * norm查询
     * @param norm
     * @return
     */
    @RequestMapping(value = "/find")
    @ResponseBody
    public String find(Norm norm) throws Exception {
        Norm n = normService.find(norm);
        JSONObject obj = JSONObject.fromObject(n);
        return obj.toString();
    }

    /**
     * 新增 or 修改页面
     */
    @RequestMapping(value="/toEdit")
    public ModelAndView toAorU(String id, Integer code) throws Exception{
        ModelAndView mv = this.getModelAndView();
        Norm norm = new Norm();
        if (StringUtils.isNotEmpty(id)) {
            norm.setId(id);
            norm = normService.find(norm);
        }
        norm.setCode(code);
        mv.addObject("norm",norm);
        mv.setViewName(norm_edit);
        return mv;
    }
    /**
     * 保存
     * @param norm
     * @return json
     * */
    @RequestMapping(value="/add")
    @ResponseBody
    public String add(Norm norm) throws Exception {
        JSONObject obj = getMsg();//返回信息
        Norm n = new Norm();
        n.setNorm_number(norm.getNorm_number());
        n.setNorm_name(norm.getNorm_name());
        if(normService.repeatedVerification(n) > 0) {
            setMsg(obj,"error","标准编号或名称已存在!");
        } else {
            String userName = SessionManager.getUsername();
            norm.setNorm_creator(userName);
            norm.setCreate_time(DateUtil.getDay());
            normService.save(norm);
        }
        return obj.toString();
    }

    /**
     * 修改
     * @param e
     * @return json
     * */
    @RequestMapping(value="/update")
    @ResponseBody
    public String update(Norm e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        normService.update(e);
        return obj.toString();
    }

    /**
     * 删除
     * @param id
     * @return json
     * */
    @RequestMapping(value="/delete")
    @ResponseBody
    public String delete(String id) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(StringUtils.isNotEmpty(id)){
            Norm norm = new Norm();
            norm.setId(id);
            normService.delete(norm);
            NormDetail detail = new NormDetail();
            detail.setNorm_id(id);
            normDetailService.delete(detail);
        } else {
            setMsg(obj,"error", "参数不能为空");
        }
        return obj.toString();
    }

    /**
     * 批量删除
     * @param norm
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/deletes")
    @ResponseBody
    public String deletes(Norm norm) throws Exception {
        JSONObject obj = getMsg();
        if(!norm.getData().isEmpty()) {
            normService.deleteBatch(norm);
        } else {
            setMsg(obj,"error", "参数不能为空");
        }
        return obj.toString();
    }

    /**
     * 查询List
     * @param norm
     * @return json
     * */
    @RequestMapping(value="/findList")
    @ResponseBody
    public String findList(Norm norm) throws Exception {
        List<Norm> list = normService.findList(norm);
        JSONArray arr = JSONArray.fromObject(list);
        return arr.toString();
    }
}
