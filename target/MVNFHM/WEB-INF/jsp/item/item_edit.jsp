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
    <title>样品明细管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="id" id="key" value="${item.id}">

    <div class="layui-form-item">
        <%--<label class="layui-form-label">样品编号<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="itemid" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${item.itemid}">
        </div> --%>

    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">样品名称<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="itemname" id="name" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${item.itemname}">
        </div>
    <%--</div>--%>
   <%-- <div class="layui-form-item">--%>
        <label class="layui-form-label">样品数量</label>
        <div class="layui-input-block">
            <input name="num" class="layui-input" type="text" autocomplete="off"
                   value="${item.num}">
        </div>
    <%--</div>--%>

    <%--<div class="layui-form-item">--%>
        <%--<label class="layui-form-label">样品分类</label>
        <div class="layui-input-block">
            <select name="typeid" id="type_id" lay-verify="required" lay-search="">

            </select>
        </div>--%>
            <label class="layui-form-label">样品分类</label>
            <div class="layui-input-block">
                <select name="typeid" id="type_id" lay-verify="required" lay-search="">
                    <option value="">请选择</option>
                    <c:forEach var="cate" items="${cates}">
                        <option value="${cate.typeid}">${cate.typename}</option>
                    </c:forEach>
                </select>
            </div>
    <%--</div>--%>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">样品描述</label>
        <div class="layui-input-block">
            <input name="describe" class="layui-input" type="text" autocomplete="off"
                   value="${item.describe}">
        </div>
    <%--</div>--%>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">送样单位</label>
        <div class="layui-input-block">
            <input name="sender" class="layui-input" type="text" autocomplete="off"
                   value="${item.sender}">
        </div>
    <%--</div>--%>

    <%--<div class="layui-form-item" id="send_time">--%>
        <div id="send_time">
            <label class="layui-form-label">送样时间</label>
            <div class="layui-input-block">
                <input type="text" name="send_time"  class="layui-input" id="test1" placeholder="yyyy-MM-dd"
                       autocomplete="off"  value="${item.send_time}">
            </div>
        </div>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <input name="note" class="layui-input" type="text" autocomplete="off"
                   value="${item.note}">
        </div>
   <%-- </div>--%>
   <%-- <div class="layui-form-item" id="check">--%>
        <div id="check">
            <label class="layui-form-label">是否已送检</label>
            <div class="layui-input-block">
                <select name="checked" id="stu" lay-search="">
                    <option value="1">待送检</option>
                    <option value="0">已送检</option>
                </select>
            </div>
        </div>

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
        initCate();
        initCheck();
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
            var url = "item/" + ($("#key").val()==""?"add":"update") + ".do";
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
        if("${item.code}"=="1"){
            $("#form-button").show();
            $("#check").hide();//新增或编辑时禁止修改检测状态
        }
        if("${item.code}"!="0"&&$("#key").val()!=""){//当为编辑时,禁止修改送样时间
            $("#send_time").hide();
        }
    }

    function initCheck(){
        $("#stu").val(${item.checked});
    }
    //初始化样品种类
    function  initCate() {
        $("#type_id").val("${item.typeid}");
    }

</script>
</html>