<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>部门管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />
    <style>
        /**treeselect*/
        .layui-form-select .layui-tree {
            display: none;
            position: absolute;
            left: 0;
            top: 42px;
            padding: 5px 0;
            z-index: 999;
            min-width: 100%;
            border: 1px solid #d2d2d2;
            max-height: 300px;
            overflow-y: auto;
            background-color: #fff;
            border-radius: 2px;
            box-shadow: 0 2px 4px rgba(0,0,0,.12);
            box-sizing: border-box;
        }
        .layui-form-selected .layui-tree {
            display: block;
        }
    </style>
</head>
<body>
<div >
    <form class="layui-form layui-form-pane" action="" >
        <input type="hidden" name="id" id="key" value="${dept.id}">
        <div class="layui-form-item">
            <label class="layui-form-label">部门编码<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="theID" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${dept.theID}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">部门名称<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="name" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${dept.name}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <input name="bz" class="layui-input" type="text" autocomplete="off"
                       value="${dept.bz}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">部门领导</label>
            <div class="layui-input-block">
                <select name="user" id="user" lay-verify="required" lay-search="">
                        <option value="">请选择</option>
                    <c:forEach items="${ulist}" var="use">
                        <option value="${use.user_id}">${use.username}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">上级部门</label>
            <div class="layui-input-block">
                <input type="text" name="pname" id="dept_select" autocomplete="off"
                       class="layui-input" value="${dept.pname}">
                <input type="hidden" name="pId" class="layui-tree-select" value="${dept.pId}">
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
        initUser();
    });

    //加载树形下拉菜单
    layui.config({
        base: '/static/layui/add/' //扩展根目录
    }).extend({ //设定模块别名
        treeselect: 'layui-tree' //扩展插件
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form','treeselect'], function() {
        var layer = layui.layer,
            form = layui.form;

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "dept/" + ($("#key").val()==""?"add":"update") + ".do";
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

        var treeselect = layui.treeselect;
        treeselect.render({
            elem: "#dept_select",
            method: "post",
            data: "dept/findTreeList.do",
            click:function(obj){
                $("input[name='pId']").val(obj.id);
            }
        });

    });

    function closeWin(){
        parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${dept.code}"=="1"){
            $("#form-button").show();
        }
    }

    //初始化角色下拉框
    function initUser(){
        /*$.ajax({
            url: 'user/findList.do',
            data: {},
            type: "post",
            dataType:'json',
            success: function(data){
                var options = "<option value=''></option>";
                for(var i=0;i<data.length;i++){
                    options+= "<option value='"+data[i].user_id+"'>"+data[i].username+"</option>";
                }
                $("#user").html(options);

            }
        });*/

        $("#user").val("${dept.user}");
    }


</script>
</html>