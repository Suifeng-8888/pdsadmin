package com.hniois.controller.machine;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.machine.Machine;
import com.hniois.service.machine.mach.MachineManage;
import com.hniois.util.DateUtil;
import com.hniois.util.ExportExcelUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/machine")
public class MachineAction extends BaseController {

    @Resource(name="machineService")
    private MachineManage machineService;

    private String mach_list="machine/mach/mach_list";
    private String mach_edit="machine/mach/mach_edit1";

    @RequestMapping("/toPage")
    public ModelAndView toPage(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(mach_list);
        return  mv;
    }

    /**
     * 分页查询
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    @ResponseBody
    public  String list(Machine e)throws Exception{

        //获取当前页
        int cuurPage=getThisPage(e.getPage());
        //获取当前显示条数
        int limit=getThisLimit(e.getLimit());
        //设置新的偏移量和每页显示信息
        e.setOffset((cuurPage-1)*limit);
        e.setPageSize(limit);
        Page page= machineService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 查询list
     * @param e
     * @return
     */
    @RequestMapping("/findlist")
    @ResponseBody
    public String findlist(Machine e) throws Exception{
      List<Machine> list= machineService.findList(e);
        JSONArray js=JSONArray.fromObject(list);
        return js.toString();
    }

    /**
     * 新增 or 编辑
     * @param e
     * @return
     */
    @RequestMapping("/toEdit")
    @ResponseBody
    public ModelAndView edit(Machine e)throws Exception{
        ModelAndView mv=this.getModelAndView();
        Machine mach=new Machine();
        if(StringUtils.isNotEmpty(e.getMach_id())){
            mach=machineService.find(e);
        }
        mach.setCode(e.getCode());
        mv.addObject("mach",mach);
        mv.setViewName(mach_edit);
        return mv;
    }

    /**
     * 保存新增
     * @param e
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public String add(Machine e)throws  Exception{
        JSONObject obj=getMsg();
        //先判断数据库是否已经存在当前对象
        if(machineService.findCount(e)>0){
            setMsg(obj,"error","当前对象已存在");
        }else{
            machineService.save(e);
        }
        return obj.toString();
    }

    /**
     * 编辑保存
     * @param e
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public String update(Machine e){
        JSONObject obj=getMsg();
       try{
           machineService.update(e);
       }catch(Exception ex){
          setMsg(obj,"error","编辑失败");
       }
       return obj.toString();
    }


    /**
     * 单个删除
     * @param e
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(Machine e)throws Exception{
        JSONObject obj=getMsg();
            if(e.getMach_id()!=null) {
                machineService.delete(e);
            }else {
                setMsg(obj, "error", "删除失败");
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
    public String deletes(Machine e)throws Exception{
        JSONObject obj=getMsg();
        if(e.getData().size()>0){
            machineService.deleteBatch(e);
        }else{
            setMsg(obj,"error","删除失败");
        }
        return obj.toString();
    }

    /**
     * 导出
     * @param e 信息
     * @return json
     * */
    @RequestMapping(value="/doExport")
    @ResponseBody
    public void doExport(Machine e) throws Exception {
        //导出工具
        ExportExcelUtil<Machine> export = new ExportExcelUtil<Machine>();
        //文件名称
        String filename = "MachList" + DateUtil.getTimes();
        //导出数据信息
        List list = machineService.findPage(e).getData();
        //执行导出
        doExport(filename,list,export);
    }
}
