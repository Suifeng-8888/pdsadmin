package com.hniois.controller.purchase;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.purchase.Result;
import com.hniois.service.purchase.result.ResultManage;
import com.hniois.util.Const;
import com.hniois.util.SessionManager;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@RestController
@RequestMapping("/result")
public class ResultAction extends BaseController {

    @Resource(name = "resultService")
    private ResultManage resultService;

    private String result_list="purchase/result/result_list";
    private String result_edit="purchase/result/result_edit";


    @RequestMapping("/toPage")
    public ModelAndView tolist(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(result_list);
        return mv;
    }

    /**
     * 分页查找
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    @ResponseBody
    public String getlist(Result e)throws Exception{


        //获取当前页
        int currPage=getThisPage(e.getPage());
        //获取分页数
        int limit=getThisLimit(e.getLimit());
        //设置新的对象
        e.setPageSize(limit);
        e.setOffset((currPage-1)*limit);
        Page page=resultService.findPage(e);
        return JSON.toJSONString(page);

    }

    /**
     * 编辑
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    public ModelAndView edit(Result e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Result result=new Result();
        if(StringUtils.isNotEmpty(e.getId())){
            result=resultService.find(e);
        }
        result.setCode(e.getCode());
        mv.setViewName(result_edit);
        mv.addObject("result",result);
        return mv;
    }

    /**
     * 编辑保存
     * @param e
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public String update(Result e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getStatus()!=null){
            resultService.update(e);
        }else{
            setMsg(obj,"error","编辑失败");
        }
        return obj.toString();
    }

    /**
     * 删除
     * @param e
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(Result e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getId()!=null){
            resultService.delete(e);
        }else{
            setMsg(obj,"error","删除失败");
        }
        return obj.toString();
    }

    /**
     * 批量删除
     * @param e
     * @return
     */
    @RequestMapping("/deletes")
    @ResponseBody
    public String deletes(Result e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getData()!=null){
            resultService.deleteBatch(e);
        }else{
            setMsg(obj,"error","删除失败");
        }
        return obj.toString();
    }
}
