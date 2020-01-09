package com.hniois.controller.cate;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.cate.Cate;
import com.hniois.service.cate.CateManage;
import com.hniois.util.Const;
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
 * 样品分类
 */
@Controller
@RequestMapping("/cate")
public class CateAction extends BaseController {

    @Resource(name="cateService")
    private CateManage cateService;

    private String cate_list="cate/cate_list";
    private String cate_edit="cate/cate_edit";

    @RequestMapping("/toPage")
    @ResponseBody
   public ModelAndView toPage(Page e){
       ModelAndView mv=this.getModelAndViewToPage(e);
       mv.setViewName(cate_list);
       return mv;
   }


    /**
     * 分页查询
     * @return
     */
   @RequestMapping("/list")
   @ResponseBody
    public String showlist(Cate e)throws Exception{
        //或取当前页
       int currpage =getThisPage(e.getPage());
       //获取每页显示条数
       int limit=getThisLimit(e.getLimit());
       e.setOffset((currpage-1)*limit);
       e.setPageSize(limit);
       Page page=cateService.findPage(e);
       return JSON.toJSONString(page);
    }

    /**
     * 查询全部列表
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping("/findList")
    @ResponseBody
    public String getlist(Cate e)throws Exception{
        List<Cate> list=cateService.findList(e);
        JSONArray js= JSONArray.fromObject(list);
        return js.toString();
    }
    /**
     * 新增或编辑页面
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    @ResponseBody
    public ModelAndView toEdit(Cate e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Cate cate = new Cate();
        //判断id是否为空
        if(StringUtils.isNotEmpty(e.getId())){
            cate= cateService.find(e);
        }
        cate.setCode(e.getCode());
        mv.setViewName(cate_edit);
        mv.addObject("cate",cate);
        return mv;
    }

    /**
     * 保存新增
     * @param e
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public String add(Cate e) throws Exception{
        JSONObject obj = getMsg();
        Cate cate = new Cate();
        cate.setType_name(e.getType_name());
        //判断数据库是否已经存在要保存的对象
        if(cateService.findCount(cate)>0){
            setMsg(obj,"error","当前分类已存在!");
        }else{
            //获取当前时间并添加到对象中
            e.setCreateTime(DateUtil.getDay());
            e.setPerson(SessionManager.getUsername());
            cateService.save(e);
        }
        return obj.toString();
    }

    /**
     * 保存编辑更改
     * @param e
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public String update(Cate e) {
        JSONObject obj=getMsg();
       try{
           //获取当前时间,作为更新的时间
           e.setCreateTime(DateUtil.getDay());
           e.setPerson(SessionManager.getUsername());
           cateService.update(e);
       }catch(Exception ex){
           setMsg(obj,"error","更改失败");
       }
       return obj.toString();
    }

    /**
     * 删除
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping("/delete")
    public String delete(Cate e)throws Exception{
        JSONObject obj=getMsg();
        if(StringUtils.isNotEmpty(e.getId())){
            cateService.delete(e);
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
    public String deletes(Cate e)throws Exception{
        JSONObject obj = getMsg();//返回信息
        if(e.getData() != null && e.getData().size() > 0){
            cateService.deleteBatch(e);
        }else{
            setMsg(obj,"error","删除失败");
        }
        return obj.toString();
    }
}
