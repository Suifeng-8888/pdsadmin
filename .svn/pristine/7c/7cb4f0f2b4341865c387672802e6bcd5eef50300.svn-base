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
    <title>定检记录管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, check-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >

<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="id" id="key" value="${ckrecord.id}">
    <input type="hidden" name="mach_name" value="${ckrecord.mach_id}">
    <div class="layui-form-item">
        <label class="layui-form-label">仪器型号<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="model" class="layui-input"  autocomplete="off" value="${ckrecord.model}">
        </div>

    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">仪器名称<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="mach_name" class="layui-input" autocomplete="off" value="${ckrecord.mach_name}">
        </div>
    <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">生产厂商</label>
            <div class="layui-input-block">
                <input type="text" name="factory" autocomplete="off"
                       class="layui-input" value="${ckrecord.factory}"
                >
            </div>
        <%--</div>--%>
        <%-- <div class="layui-form-item">--%>
        <div  id="app_time">
            <label class="layui-form-label">到期检定时间</label>
            <div class="layui-input-block">
                <input name="check_time" class="layui-input" type="text" autocomplete="off"
                       value="${ckrecord.check_time}">
            </div>
        </div>
   <%-- <div class="layui-form-item">--%>
        <label class="layui-form-label">检定周期<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block" id="check">
            <input name="period" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required"  value="${ckrecord.period}">
        </div>
   <%-- </div>--%>

    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">送检人</label>
        <div class="layui-input-block">
            <input type="text" name="sender" autocomplete="off"
                   class="layui-input" value="${ckrecord.sender}"
            >
        </div>
   <%-- </div>--%>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">送检时间</label>
        <div class="layui-input-block">
            <input type="text" name="send_time" autocomplete="off" class="layui-input" value="${ckrecord.send_time}"
            >
        </div>
   <%-- </div>--%>
        <label class="layui-form-label">检定单位</label>
        <div class="layui-input-block">
            <input type="text" name="check_unit" autocomplete="off" class="layui-input" value="${ckrecord.check_unit}"
            >
        </div>

    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">检测时间</label>
        <div class="layui-input-block">
            <input type="text" name="checked_time" autocomplete="off"  id="test1" placeholder="yyyy-MM-dd"
                   class="layui-input" value="${ckrecord.checked_time}"
            >
        </div>
   <%-- </div>--%>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">检测人</label>
        <div class="layui-input-block">
            <input type="text" name="checker" autocomplete="off"
                   class="layui-input" value="${ckrecord.checker}"
            >
        </div>
   <%-- </div>--%>
        <%--<div class="layui-form-item">--%>
        <div id="state">
            <label class="layui-form-label">检定状态</label>
            <div class="layui-input-block">
                <select name="check_state"  id="status" lay-search="" class="hniois-search-data">
                    <option value="">请选择</option>
                    <option value="0">已检定</option>
                    <option value="1">未检定</option>
                </select>
            </div>
        </div>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">检测证书号</label>
        <div class="layui-input-block">
            <input type="text" name="check_num" autocomplete="off" autocomplete="off"
                   class="layui-input" value="${ckrecord.check_num}"
            >
        </div>
    <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <input type="text" name="bz" autocomplete="off"
                       class="layui-input" value="${ckrecord.bz}"
                >
            </div>
        <%--</div>--%>
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
            var url = "ckrecord/" + ($("#key").val()==""?"add":"update") + ".do";
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


    });

    function closeWin(){
       parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${ckrecord.code}"=="1"){//新增或编辑
            $("#form-button").show();
        }
    }



    function initStatus(){
        $("#status").val(${ckrecord.check_state});
    }

</script>
</html>