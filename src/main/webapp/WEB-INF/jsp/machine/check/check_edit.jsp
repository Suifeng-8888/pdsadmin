<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <title>定检计划管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, check-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="id" id="key" value="${check.id}">
    <input type="hidden" name="mach_id" id="machid" value="${check.mach_id}">
    <div class="layui-form-item">
        <label class="layui-form-label">仪器名称<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="mach_names" type="text" autocomplete="off" style="width:400px;height:35px;"
                   id="test" placeholder="请选择" lay-verify="required"  value="${check.mach_name}">
            <span data-method="notice" id="chose"  class="layui-btn">选择仪器</span>
        </div>

    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">检定周期<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block" id="check">
            <input name="period" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required"  value="${check.period}">
        </div>
    <%--</div>--%>

    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">检定单位</label>
        <div class="layui-input-block">
            <input type="text" name="check_unit" autocomplete="off" lay-verify="required"
                   class="layui-input" value="${check.check_unit}"
            >
        </div>
    <%--</div>--%>
        <%--<div class="layui-form-item" >--%>
        <div id="app_time">
            <label class="layui-form-label">到期检定时间</label>
            <div class="layui-input-block">
                <input name="check_time" class="layui-input" type="text" id="test1" placeholder="yyyy-MM-dd"
                       autocomplete="off"  value="${check.check_time}"
                >
            </div>
        </div>

     <%--<div class="layui-form-item" >--%>
        <div id="sta">
            <label class="layui-form-label">检定状态</label>
            <div class="layui-input-block">
                <select name="status"  id="status" lay-search="" class="hniois-search-data">
                    <option value="">请选择</option>
                    <option value="0">已送检</option>
                    <option value="1">未送检</option>
                </select>
            </div>
        </div>
    </div>
    <div class="layui-form-item" style="text-align: center;display: none" id="form-button" >
        <button class="layui-btn" lay-filter="formSave" lay-submit>保存</button>
        <button class="layui-btn layui-btn-warm" onclick="closeWin()">关闭</button>
    </div>
</form>

</div>
</body>

<script src="static/layui/layui.js"></script>
<script src="static/login/js/jquery-1.7.2.js"></script>
<script>
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);
    //初始化函数 order-1
    $(document).ready(function() {
        init();
        //initMachName();
        initStatus();
    });

    //加载树形下拉菜单
    layui.config({
        base: '/static/layui/add/' //扩展根目录
    }).extend({ //设定模块别名
        treeselect: 'layui-tree' //扩展插件
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form','laydate'], function() {
        var layer = layui.layer,
            form = layui.form,
            laydate=layui.laydate;

        //获取时间日历
        laydate.render({
            elem: '#test1'
        });
        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "check/" + ($("#key").val()==""?"add":"update") + ".do";
            $.ajax({
                url: url,
                data: data.field,
                type: "post",
                dataType:'json',
                success: function(data){
                    if(data.state=="ok"){
                        parent.formReload();
                        parent.layer.msg(data.msg);
                        closeWin();
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
            return false;
        });

        //触发事件
        var active = {

            notice:function () {
                var index2 = layer.open({
                    title: "使用的仪器",
                    type: 2,
                    offset: 't',
                    maxmin: true,
                    skin: 'layui-layer-rim', //加边框
                    moveType: 1,
                    content: "check/choose.do",
                    area: ['700px', '80%'],
                });
                layer.full(index2);
            }
        }

        $('#chose').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

    });

    function closeWin(){
       parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${check.code}"=="1"){//新增或编辑
            $("#form-button").show();
            $("#sta").hide();//检测状态隐藏
        }
    }

    //初始化仪器名下拉框
    /*function initMachName(){
        $.ajax({
            url: 'machine/findlist.do',
            data: {},
            type: "post",
            dataType:'json',
            success: function(data){
                var st = "<option value=''>请选择</option>";
                for(var i=0;i<data.length;i++){
                    st+="<option value='"+data[i].mach_id+"'>"+data[i].mach_name+"</option>";
                }
                $("#mach_id").html(st);
                $("#mach_id").val(${check.mach_id})
            }
        });
    }*/

    function initStatus(){
        $("#status").val(${check.status});
    }

</script>
</html>