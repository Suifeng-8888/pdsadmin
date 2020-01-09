<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <title>采购询价信息表</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="id" id="key" value="${result.id}">
    <input type="hidden" name="pro_id"  value="${result.pro_id}">
    <div class="layui-form-item">
        <label class="layui-form-label">产品名称</label>
        <div class="layui-input-block">
            <input name="pro_name" class="layui-input" type="text" autocomplete="off"
                   value="${result.pro_name}">
        </div>

    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">采购数量</label>
        <div class="layui-input-block">
            <input name="pur_num" class="layui-input" type="text" autocomplete="off"
                   value="${result.pur_num}">
        </div>
   <%-- </div>--%>
   <%-- <div class="layui-form-item">--%>
        <label class="layui-form-label">采购人</label>
        <div class="layui-input-block">
            <input name="buyer" class="layui-input" type="text" autocomplete="off"
                   value="${result.buyer}">
        </div>

        <label class="layui-form-label">采购时间</label>
        <div class="layui-input-block">
            <input type="text" name="buy_time"  class="layui-input" id="test1" placeholder="yyyy-MM-dd"
                   autocomplete="off"  lay-verify="required"    value="${result.buy_time}">
        </div>
    <%--</div>--%>

   <%-- <div class="layui-form-item" >--%>
        <label class="layui-form-label">采购价格</label>
        <div class="layui-input-block">
            <input name="price" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${result.price}">
        </div>
    <%--</div>--%>

    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">批次号</label>
        <div class="layui-input-block">
            <input name="pur_batch" class="layui-input" type="text" autocomplete="off"
                   value="${result.pur_batch}">
        </div>
    <%--</div>--%>
    <%--<div class="layui-form-item" id="status">--%>
            <label class="layui-form-label">采购情况</label>
            <div class="layui-input-block">
                <select name="status" id="stu" lay-search="">
                    <option value="0">待采购</option>
                    <option value="1">已采购</option>
                    <option value="2" disabled="disabled">作废</option>
                </select>
            </div>
    <%--<div class="layui-form-item" id="record">--%>

    </div>
    <div class="layui-form-item" style="text-align: center;display: none" id="form-button">
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
        initStatus();
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
            var url = "result/" + ($("#key").val()==""?"add":"update") + ".do";
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
        if("${result.code}"=="1"){
            $("#form-button").show();
        }
    }
    //初始化采购状态
    function  initStatus() {
        $("#stu").val("${result.status}");
    }

</script>
</html>