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
    <title>菜单管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="id" id="key" value="${menu.menu_id}">
    <div class="layui-form-item">
        <label class="layui-form-label">菜单ID<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="menu_id" class="layui-input" type="text" autocomplete="off"
                   lay-verify="pass" value="${menu.menu_id}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">菜单名称<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="menu_name" class="layui-input" type="text" autocomplete="off"
                   lay-verify="title" value="${menu.menu_name}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">菜单Url<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="menu_url" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${menu.menu_url}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">菜单排序<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="menu_order" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${menu.menu_order}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">菜单图标</label>
        <div class="layui-input-block">
            <input name="menu_icon" class="layui-input" type="text" autocomplete="off"
                   value="${menu.menu_icon}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">菜单类型</label>
        <div class="layui-input-block">
            <select name="menu_type" id="menu_type" lay-verify="required" lay-search="">
                <option value="1"><span style='color: #009688;'>菜单</span></option>
                <option value="2"><span style='color: #FF5722;'>按钮</span></option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">菜单状态</label>
        <div class="layui-input-block">
            <input type="radio" name="menu_state" value="0" title="启用" checked>
            <input type="radio" name="menu_state" value="1" title="禁用" >
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
        initSelect();
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form'], function() {
        var layer = layui.layer,
            form = layui.form;

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "menu/" + ($("#key").val()==""?"add":"update") + ".do";
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

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 2){
                    return '名称至少得2个字符';
                }
            }
            ,pass: [/(.+){2,6}$/, 'ID必须2到6位']
        });


    });

    function closeWin(){
       parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${menu.code}"=="1"){
            $("#form-button").show();
        }
    }

    function initSelect(){
        $("#menu_type").val("${menu.menu_type}");
        $("input[name='menu_state'][value='${menu.menu_state}']").prop("checked",true);
    }

</script>
</html>