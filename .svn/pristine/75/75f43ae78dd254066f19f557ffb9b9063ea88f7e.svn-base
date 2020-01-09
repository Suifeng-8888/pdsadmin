package com.hniois.controller.report;

import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.report.Report;
import com.hniois.entity.report.StatisicsCount;
import com.hniois.entity.report.Statistics;
import com.hniois.service.report.StatisticsService;
import com.hniois.util.DateUtil;
import com.hniois.util.FileUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping(value = "/statistics")
@Controller
public class StatisticsAction extends BaseController {

    @Resource(name = "statisticsService")
    private StatisticsService statisticsService;

    private String list = "report/statistics_list";

    /**
     * 进入报告统计页面
     */
    @RequestMapping(value = "/toPage")
    public ModelAndView toPage(Page page) {
        ModelAndView mv = getModelAndViewToPage(page);
        mv.setViewName(list);
        return mv;
    }

    /**
     * 分页
     *
     * @param statistics
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String pageList(Statistics statistics) throws Exception {
        // 当前页
        int currPage = getThisPage(statistics.getPage());
        // 每页显示条数
        int limit = getThisLimit(statistics.getLimit());
        statistics.setOffset((currPage - 1) * limit);
        statistics.setPageSize(limit);
        Page page = statisticsService.findPage(statistics);
        return JSON.toJSONString(page);
    }

    /**
     * 删除
     *
     * @param id   报告统计id
     * @param path 生成报告的文件位置
     * @return
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(String id, String path, HttpServletRequest request) {
        JSONObject obj = getMsg();//返回信息
        if (StringUtils.isNotEmpty(id) && StringUtils.isNotEmpty(path)) {
            Statistics statistics = new Statistics();
            statistics.setId(id);
            try {
                statisticsService.delete(statistics);
            } catch (Exception e) {
                setMsg(obj, "error", "删除报统计信息失败!");
                e.printStackTrace();
            }
            //  根路径
            String rootPath = request.getSession().getServletContext().getRealPath("/");
            String woldPath = rootPath + path;
            //  删除world报告文件
            boolean bl = FileUtil.deleteFile(woldPath);
            if (Boolean.TRUE.equals(bl)) {

            } else {
                setMsg(obj, "error", "删除报告文件出错!");
            }
        } else {
            setMsg(obj, "error", "参数不能为空!");
        }
        return obj.toString();
    }


    /**
     * 报告文件下载次数更新
     *
     * @param down_number
     */
    @RequestMapping(value = "/update")
    public void update(String down_number, String id) throws Exception {
        if (StringUtils.isNotEmpty(down_number) && StringUtils.isNotEmpty(id)) {
            int i = Integer.valueOf(down_number);
            Statistics statistics = new Statistics();
            statistics.setId(id);
            statistics.setDown_number(++i);
            statisticsService.update(statistics);
        }
    }

    /**
     * 周统计
     *
     * @param e
     * @return
     */
    @RequestMapping(value = "/countWeek")
    @ResponseBody
    public String countWeek(Statistics e) throws Exception {
        e.setEndTime(DateUtil.getDay());
        List<StatisicsCount> list = statisticsService.countWeek(e);
        JSONArray arr = JSONArray.fromObject(list);
        return arr.toString();
    }

    /**
     * 月统计
     *
     * @param e
     * @return
     */
    @RequestMapping(value = "/countMonth")
    @ResponseBody
    public Map<String, Object> countMonth(Statistics e) throws Exception {
        e.setEndTime(DateUtil.getDay());
        List<StatisicsCount> list = statisticsService.countMonth(e);
        Map<String, Object> map = new HashMap<String, Object>();
        /*报告时间*/
        String[] dataTime = new String[list.size()];
        /*报告数*/
        String[] dataNum = new String[list.size()];

        Date date=new Date();
        int i = 0;
        /*遍历数据库数据*/
        for (StatisicsCount data : list) {
            String s = data.getCreate_time();
            /*日期转换*/
            date = new SimpleDateFormat("yyyy-MM").parse(s);
            String dataStr = new SimpleDateFormat("yyyy年MM月").format(date);
            dataTime[i] = dataStr;
            dataNum[i] = data.getNum();
            i++;
        }
        map.put("count", dataNum);
        map.put("time", dataTime);
        return map;
    }


}
