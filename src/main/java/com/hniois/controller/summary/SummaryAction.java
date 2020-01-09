package com.hniois.controller.summary;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.report.StatisicsCount;
import com.hniois.entity.report.Statistics;
import com.hniois.service.report.StatisticsService;
import com.hniois.util.DateUtil;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/summary")
public class SummaryAction extends BaseController {

    @Resource(name = "statisticsService")
    private StatisticsService statisticsService;

    private String sum_week="summary/report_week";
    private String sum_month="summary/report_month";

    /**
     * 跳转到周报告统计页面
     * @param e
     * @return
     */
    @RequestMapping("/week")
    public ModelAndView toRpweek(Page e){
       ModelAndView mv=this.getModelAndViewToPage(e);
       mv.setViewName(sum_week);
       return mv;
    }

    /**
     * 获取周报告统计数据
     * @param e
     * @return
     * @throws Exception
     */
    @RequestMapping("/weeklist")
    @ResponseBody
    public String reWlist(Statistics e)throws Exception {
        if(e.getEndTime()==null){
            e.setEndTime(DateUtil.getDay());
        }
        List<StatisicsCount> list = statisticsService.countWeek(e);
        //将对象中的日期转化为星期几
        for(StatisicsCount s:list){
            s.setTemp(s.getCreate_time());
            s.setCreate_time(DateUtil.dayToWeek(s.getCreate_time()));
        }
        Page page=new Page();
        page.setData(list);
        return JSON.toJSONString(page);
    }


    /**
     * 跳转到月报告统计页面
     * @param e
     * @return
     */
    @RequestMapping("/month")
    public ModelAndView toRpMonth(Page e){
        ModelAndView mv=this.getModelAndViewToPage(e);
        mv.setViewName(sum_month);
        return mv;
    }

    @RequestMapping("/monthlist")
    @ResponseBody
    public String reMlist(Statistics e) throws Exception{
        if(e.getEndTime()==null){
            e.setEndTime(DateUtil.getDay());
        }else{
            e.setEndTime(e.getEndTime()+"-01");
        }
        List<StatisicsCount> list = statisticsService.countMonth(e);
        for(StatisicsCount s:list){
            s.setTemp(s.getCreate_time());
        }
        Page page=new Page();
        page.setData(list);
        return JSON.toJSONString(page);
    }
}
