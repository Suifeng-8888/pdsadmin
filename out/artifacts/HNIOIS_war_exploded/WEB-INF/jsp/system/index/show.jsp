<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <style>
        .info-box {
            height: 85px;
            background-color: white;
            background-color: #ecf0f5;
        }

        .info-box .info-box-icon {
            border-top-left-radius: 2px;
            border-top-right-radius: 0;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 2px;
            display: block;
            float: left;
            height: 85px;
            width: 85px;
            text-align: center;
            font-size: 45px;
            line-height: 85px;
            background: rgba(0, 0, 0, 0.2);
        }

        .info-box .info-box-content {
            padding: 5px 10px;
            margin-left: 85px;
        }

        .info-box .info-box-content .info-box-text {
            display: block;
            font-size: 14px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            text-transform: uppercase;
        }

        .info-box .info-box-content .info-box-number {
            display: block;
            font-weight: bold;
            font-size: 18px;
        }

        .main {
            margin-top: 25px;
        }

        .main .layui-row {
            margin: 10px 0;
        }
    </style>
</head>
<body>
<div class="layui-fluid main">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md3">
            <div class="info-box">
                    <span class="info-box-icon" style="background-color:#00c0ef !important;color:white;"><i class="fa fa-hourglass-half" aria-hidden="true"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">样品</span>
                    <span class="info-box-number">200</span>
                </div>
            </div>
        </div>
        <div class="layui-col-md3">
            <div class="info-box">
                <span class="info-box-icon" style="background-color:#dd4b39 !important;color:white;"><i class="fa fa-flag" aria-hidden="true"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">报告</span>
                    <span class="info-box-number">180</span>
                </div>
            </div>
        </div>
        <div class="layui-col-md3">
            <div class="info-box">
                <span class="info-box-icon" style="background-color:#00a65a !important;color:white;"><i class="fa fa-bar-chart" aria-hidden="true"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">完成度</span>
                    <span class="info-box-number">90%</span>
                </div>
            </div>
        </div>
        <div class="layui-col-md3">
            <div class="info-box">
                <span class="info-box-icon" style="background-color:#f39c12 !important;color:white;"><i class="fa fa-star" aria-hidden="true"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">代办</span>
                    <span class="info-box-number">2</span>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-row">
        <div class="layui-col-md7">
            <div style="height: 400px;width: 100%;" id="echarts-left1">

            </div>
        </div>

        <div class="layui-col-md5">
            <div style="height: 400px;width: 100%;" id="echarts-left2">

            </div>
        </div>
    </div>


</div>


<script src="static/layui/layui.js"></script>
<script src="static/login/js/jquery-1.7.2.js"></script>
<script src="static/echarts/echarts.min.js"></script>
<script>
    //初始化函数 order-1
    $(document).ready(function() {
        //初始化图表
        initCharts();

    });

    //layui模块加载 order-2
    layui.use(['layer'], function() {
        var layer = layui.layer;

    });

    //初始化图表
    function initCharts(){
        initChart1();
        initChart2();
    }

    function initChart1(){
        $.ajax({
            url: 'statistics/countWeek.do',
            data: "",
            type: "post",
            dataType:'json',
            success: function(data){
                initChart11(data);
            }
        });
    }

    function initChart2(){
        $.ajax({
            url: 'statistics/countMonth.do',
            data: "",
            type: "post",
            dataType:'json',
            success: function(data){
                initChart22(data);
            }
        });
    }
   /* 柱状图*/
    function initChart11(data){
          var  dataNum = [];
          var  dataTime = [];
        for(var i=0;i<data.length;i++){
            dataNum.push(data[i].num);
            dataTime.push(data[i].create_time);
        }
        var  option = {
            title : {
                text: '最近一周内的检测报告数量',
                subtext: '光标移至图上显示数量',
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['报告数']
            },
            toolbox: {
                show : true,
                feature : {
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data:dataTime
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'报告数',
                    type:'bar',
                    barWidth: '20%',
                    data : dataNum
                }

            ]
        };
        var myChart1 = echarts.init(document.getElementById('echarts-left1'));
        myChart1.setOption(option);
    }
    /*饼状图*/
    function initChart22(data){
        var arrNum=[];
        var obj = data.time;
        var objNum = data.count;
        for (var i = 0; i < obj.length; i++) {
            arrNum.push({"value": objNum[i],"name":obj[i]});
        }
      var  option = {
            title : {
                text: '最近六个月检测数量对比',
                subtext: '光标移至图上显示百分比',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: '10%',
                data: arrNum
            },
            series : [
                {
                    name: '检测数量',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:arrNum,
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        var myChart1 = echarts.init(document.getElementById('echarts-left2'));
        myChart1.setOption(option);
    }
</script>
</body>
</html>