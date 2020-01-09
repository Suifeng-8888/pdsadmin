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
</head>
<body>
<div class="layui-row">
    <div class="layui-col-md3" style="text-align: center">
        <div style="height: 300px;width: 110%;" id="echarts-left1">

        </div>
        <div style="height: 300px;width: 110%;" id="echarts-left2">

        </div>
    </div>
    <div class="layui-col-md6" style="text-align: center">
        <div style="height: 600px;width: 100%;" id="echarts-left3">

        </div>
    </div>
    <div class="layui-col-md3" style="text-align: center">
        <div style="height: 300px;width: 100%;" id="echarts-left4">
            <table lay-filter="parse-table-demo">
                <thead>
                <tr>
                    <th lay-data="{field:'city'}">城市</th>
                    <th lay-data="{field:'name'}">监控</th>
                    <th lay-data="{field:'num'}">数量</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>许昌市</td>
                    <td>生产基地</td>
                    <td>10</td>
                </tr>
                <tr>
                    <td>魏都区</td>
                    <td>生产基地</td>
                    <td>6</td>
                </tr>
                <tr>
                    <td>许昌县</td>
                    <td>生产基地</td>
                    <td>4</td>
                </tr>
                <tr>
                    <td>鄢陵</td>
                    <td>生产基地</td>
                    <td>3</td>
                </tr>
                <tr>
                    <td>长葛</td>
                    <td>生产基地</td>
                    <td>5</td>
                </tr>
                </tbody>
            </table>
        </div>

        <div style="height: 300px;width: 100%;" id="echarts-left5">

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
    layui.use(['layer','table'], function() {
        var layer = layui.layer;
        var table = layui.table;

        table.init('parse-table-demo', { //转化静态表格
            //height: 'full-500'
        });
    });

    //初始化图表
    function initCharts(){
        initChart1();
        initChart2();
        initChart3();
        initChart5();
    }

    function  initChart1() {
        var option = {
            title : {
                text: '最近7天蔬菜扫码量',
                x:'left'
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ['星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期天']
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                data: [20, 30, 90, 90, 120, 60, 30],
                type: 'line',
                areaStyle: {}
            }]
        };
        var myChart1 = echarts.init(document.getElementById('echarts-left1'));
        myChart1.setOption(option);
    }

    function  initChart2() {
        var option = {
            title : {
                text: '月统计',
                subtext: '纯属虚构'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['扫码量']
            },

            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : ['1月','2月','3月','4月','5月','6月']
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'访问量',
                    type:'bar',
                    data:[200, 300, 700, 1300, 1600, 500],
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name: '平均值'}
                        ]
                    }
                }
            ]
        };

        var myChart1 = echarts.init(document.getElementById('echarts-left2'));
        myChart1.setOption(option);
    }


    function initChart3(){
        var option = {
            title : {
                text: '蔬菜蔬果分类统计',
                subtext: '纯属虚构',
                x:'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'left',
                data:['水产品','水果类','蔬菜类','鲤鱼','苹果','雪梨','草莓','西红柿','黄瓜','豆芽','白菜']
            },
            series: [
                {
                    name:'分类',
                    type:'pie',
                    selectedMode: 'single',
                    radius: [0, '30%'],

                    label: {
                        normal: {
                            position: 'inner'
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data:[
                        {value:335, name:'水产品', selected:true},
                        {value:679, name:'水果类'},
                        {value:1548, name:'蔬菜类'}
                    ]
                },
                {
                    name:'访问来源',
                    type:'pie',
                    radius: ['40%', '55%'],
                    label: {
                        normal: {
                            formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
                            backgroundColor: '#eee',
                            borderColor: '#aaa',
                            borderWidth: 1,
                            borderRadius: 4,
                            // shadowBlur:3,
                            // shadowOffsetX: 2,
                            // shadowOffsetY: 2,
                            // shadowColor: '#999',
                            // padding: [0, 7],
                            rich: {
                                a: {
                                    color: '#999',
                                    lineHeight: 22,
                                    align: 'center'
                                },
                                // abg: {
                                //     backgroundColor: '#333',
                                //     width: '100%',
                                //     align: 'right',
                                //     height: 22,
                                //     borderRadius: [4, 4, 0, 0]
                                // },
                                hr: {
                                    borderColor: '#aaa',
                                    width: '100%',
                                    borderWidth: 0.5,
                                    height: 0
                                },
                                b: {
                                    fontSize: 16,
                                    lineHeight: 33
                                },
                                per: {
                                    color: '#eee',
                                    backgroundColor: '#334455',
                                    padding: [2, 4],
                                    borderRadius: 2
                                }
                            }
                        }
                    },
                    data:[
                        {value:335, name:'鲤鱼'},
                        {value:310, name:'苹果'},
                        {value:234, name:'雪梨'},
                        {value:135, name:'草莓'},
                        {value:1048, name:'西红柿'},
                        {value:251, name:'黄瓜'},
                        {value:147, name:'豆芽'},
                        {value:102, name:'白菜'}
                    ]
                }
            ]
        };
        var myChart1 = echarts.init(document.getElementById('echarts-left3'));
        myChart1.setOption(option);
    }


    function  initChart5() {
        var option = {
            title : {
                text: '全市生产基地扫码比例',
                subtext: '纯属虚构'
            },
            series: [{
                type: 'treemap',
                data: [{
                    name: '许昌市',
                    value: 10,
                    children: [{
                        name: '许昌县',
                        value: 4
                    }, {
                        name: '魏都区',
                        value: 6
                    }]
                }, {
                    name: '许昌市',
                    value: 10,
                    children: [{
                        name: '许昌市',
                        value: 10,
                        children: [{
                            name: '许昌市',
                            value: 10
                        }]
                    }]
                }]
            }]
        };


        var myChart1 = echarts.init(document.getElementById('echarts-left5'));
        myChart1.setOption(option);

    }
</script>
</body>
</html>