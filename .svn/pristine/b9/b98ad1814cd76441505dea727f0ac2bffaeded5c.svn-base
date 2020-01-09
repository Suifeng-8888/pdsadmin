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
    <title>仪器使用记录管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, record-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="id" id="key" value="${record.id}">
    <div class="layui-form-item">
        <%--<div class="layui-form-item">--%>

            <label class="layui-form-label">所用仪器<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block" id="check">
                <input name="mach_names" type="text" autocomplete="off" style="width:400px;height:35px;"
                     id="test" placeholder="请选择" lay-verify="required"  value="${record.mach_names}">
                <span data-method="notice" id="chose"  class="layui-btn">选择仪器</span>
            </div>
        <%--</div>--%>
            <label class="layui-form-label">仪器编号</label>
            <div class="layui-input-block">
                <input type="text" name="mach_ids" autocomplete="off" lay-verify="required"
                       id="test2"   class="layui-input" value="${record.mach_ids}">
            </div>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">开始时间</label>
            <div class="layui-input-block">
                <input type="text" name="begin_time" autocomplete="off"
                     id="test1" placeholder="yyyy-MM-dd"  class="layui-input" value="${record.begin_time}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">使用目的<%--<span style="color: #FF5722">*</span>--%></label>
            <div class="layui-input-block">
                <input name="for_use" class="layui-input" type="text" autocomplete="off"
                       value="${record.for_use}">
            </div>
        <%--</div>--%>

        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">使用人</label>
            <div class="layui-input-block">
                <input name="people" class="layui-input" type="text" autocomplete="off"
                       value="${record.people}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">仪器状态<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <select name="status" id="sta" lay-verify="required" lay-search="">
                        <option value="">请选择</option>
                        <option value="0">正常</option>
                        <option value="1">故障</option>
                </select>
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <input name="bz" class="layui-input" type="text" autocomplete="off"
                       value="${record.bz}">
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
        initSta();
       // initMachName();

    });


    //layui模块加载 order-2
    layui.use(['layer', 'form','laydate'], function() {
        var layer = layui.layer,
            laydate=layui.laydate,
            form = layui.form;

        //日历
        laydate.render({
            elem:'#test1'
            ,type: 'datetime'
        });
        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "record/" + ($("#key").val()==""?"add":"update") + ".do";
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
                    content: "record/choose.do",
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
        if("${record.code}"=="1"){
            $("#form-button").show();
        }
    }


    function initSta(){
        $("#sta").val(${record.status});
    }

</script>
</html>