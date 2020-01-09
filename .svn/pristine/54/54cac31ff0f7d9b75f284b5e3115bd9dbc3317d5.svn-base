package com.hniois.controller.norm;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.norm.Norm;
import com.hniois.entity.norm.NormDetail;
import com.hniois.service.norm.NormDetailService;
import com.hniois.service.norm.NormService;
import com.hniois.util.Const;
import com.hniois.util.Tools;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 *  检测标准详情  action
 *
 */
@Controller
@RequestMapping(value = "/normDetail")
public class NormDetailAction extends BaseController {

    @Resource(name = "normDetailService")
    private NormDetailService normDetailService;

    @Resource(name = "normService")
    private NormService normService;

    private String list = "norm/detail_list";
    private String edit = "norm/detail_edit";
    private String zxbz = "norm/detail_zxbz";

    /**
     *  进入列表页方法
     * @return
     */
    @RequestMapping(value = "/toPage")
    public ModelAndView toPage(Page page) {
        ModelAndView mv = getModelAndViewToPage(page);
        mv.setViewName(list);
        return mv;
    }

    /**
     * 分页
     * @param detail
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String showList(NormDetail detail) throws Exception {
        //  当前页
        int currPage = getThisPage(detail.getPage());
        //  每页显示条数
        int limit = getThisLimit(detail.getLimit());

        detail.setOffset((currPage - 1) * limit );
        detail.setPageSize(limit);
        Page page = normDetailService.findPage(detail);
        return JSON.toJSONString(page);
    }

    /**
     *  新增 or 修改  页面
     * @param detail
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/toEdit")
    public ModelAndView toAorU(NormDetail detail) throws Exception {
        ModelAndView mv = getModelAndView();
        NormDetail nd = new NormDetail();
        if (StringUtils.isNotEmpty(detail.getId())) {
            nd = normDetailService.find(detail);
        }
        List<Norm> norms = normService.findList(new Norm());
        nd.setCode(detail.getCode());//判断：0查询 or 1 增加/修改
        mv.addObject("detail", nd);
        mv.addObject("norms", norms);
        mv.setViewName(edit);
        return mv;
    }

    /**
     *  新增
     * @param detail
     * @return
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public String add(NormDetail detail) throws Exception {
        normDetailService.save(detail);
        JSONObject obj = getMsg();//返回信息
        return obj.toString();
    }

    /**
     *  修改
     * @param detail
     * @return
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public String update(NormDetail detail) throws Exception {
        normDetailService.update(detail);
        JSONObject obj = getMsg();//返回信息
        return obj.toString();
    }

    /**
     *  删除
     * @return
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(NormDetail detail) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(detail != null) {
            normDetailService.delete(detail);
        } else {
            setMsg(obj,"error", "参数不能为空");
        }
        return obj.toString();
    }

    /**
     *  批量删除
     * @return
     */
    @RequestMapping(value = "/deletes")
    @ResponseBody
    public String deletes(NormDetail detail) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(!detail.getData().isEmpty()) {
            normDetailService.deleteBatch(detail);
        } else {
            setMsg(obj,"error", "参数不能为空");
        }
        return obj.toString();
    }

    /**
     * 执行标准选择
     * @return
     */
    @RequestMapping(value = "/zxbz")
    public ModelAndView zxbz() {
        ModelAndView mv = getModelAndView();
        mv.setViewName(zxbz);
        return mv;
    }
}


