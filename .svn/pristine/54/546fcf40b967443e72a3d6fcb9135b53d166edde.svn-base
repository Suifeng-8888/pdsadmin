package com.hniois.controller.task;

import com.hniois.entity.machine.Check;
import com.hniois.entity.machine.Machine;
import com.hniois.entity.quartz.CheckQuartz;
import com.hniois.entity.system.User;
import com.hniois.service.machine.check.CheckManage;
import com.hniois.service.machine.mach.MachineManage;
import com.hniois.service.quartz.CheckQuartzManage;
import com.hniois.util.DateUtil;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

@Component
//@EnableScheduling
public class CheckTask {

    @Resource(name = "checkService")
    private CheckManage checkService;
    @Resource(name = "checkQuartzService")
    private CheckQuartzManage ckQuartzService;
    @Resource(name="machineService")
    private MachineManage machineService;

    /**
     * 定期获取仪器检定计划表中的到期检定时间,然后判断是否需要做提醒
     * @throws JobExecutionException
     */
  @Scheduled(cron ="0 0 2 01 * ? ")//每月1号每天凌晨两点执行一次
//    @Scheduled(cron ="0 0/1 * * * ? ")
    public void message(){
        Check check=new Check();
        Machine mach;
        try {
            check.setStatus("1");
            //查询所有未送检的仪器
            List<Check> list=checkService.findList(check);
            //获取当前时间
            String nowTime = DateUtil.getDay();
            //获取需要送检的仪器的检定时间,判断距离当前时间还差多久来判断是否需要进行提醒
            for(Check ck:list){
                String ckTime=ck.getCheck_time();
                String mach_id=ck.getMach_id();
                if(DateUtil.compareDate(ckTime,nowTime)){
                    long day=DateUtil.getDaySub(nowTime,ckTime);
                    if(day<=90){//如果当前的时间差小于90天了,则需要提醒需要送检了
                        CheckQuartz ckQuartz=new CheckQuartz();
                        //将仪器一览表中的责任人和通知信息插入定时消息表中即可
                        mach  = new Machine();
                        mach.setMach_id(mach_id);
                        mach = machineService.find(mach);
                        ckQuartz.setEntity_id(mach_id);
                        //先判断当前信息是否已经添加过了
                      //  if(ckQuartzService.findCount(ckQuartz)==0){ //说明还没有添加
                            ckQuartz.setMsg_time(nowTime);
                            ckQuartz.setFlag("仪器检定消息");
                            ckQuartz.setRolename(User.JD_role);//添加角色负责人名字
                            ckQuartz.setMsg(mach.getMach_name()+"即将到送检期了");
                            ckQuartzService.save(ckQuartz);
                      //  }
                    }
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
