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
    <title>角色管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />
    <link rel="stylesheet" href="static/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">

</head>
<body>
<div >
    <form class="layui-form layui-form-pane" action="" >
        <input type="hidden" name="role_id" id="key" value="${role.role_id}">
        <div class="layui-form-item">
            <label class="layui-form-label">角色名称<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="role_name" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${role.role_name}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色权限</label>
            <div class="layui-input-block">
                <div class="zTreeDemoBackground left">
                    <ul id="rights" class="ztree"></ul>
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
<script type="text/javascript" src="static/zTree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="static/zTree/js/jquery.ztree.excheck.js"></script>
<script>
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);
    //初始化函数 order-1
    $(document).ready(function() {
        init();
        // initMenu();
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form'], function() {
        var layer = layui.layer,
            form = layui.form;

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "role/" + ($("#key").val()==""?"add":"update") + ".do";
            var treeObj = $.fn.zTree.getZTreeObj("rights");
            var nodes = treeObj.getCheckedNodes(true);

            var obj = data.field;
            obj.rights = "";
            for(var i=0;i<nodes.length;i++){
                obj.rights+= nodes[i].id+",";
            }
            $.ajax({
                url: url,
                data: obj,
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
        if("${role.code}"=="1"){
            $("#form-button").show();
        }
    }

    //初始化角色下拉框
    function initMenu(){
        $.ajax({
            url: 'menu/findList.do',
            data: {},
            type: "post",
            dataType:'json',
            success: function(data){
                var options = "<option value=''></option>";
                for(var i=0;i<data.length;i++){
                    options+= "<option value='"+data[i].role_id+"'>"+data[i].role_name+"</option>";
                }
                $("#rights").html(options);
                $("#rights").val("${user.role_id}");
            }
        });
    }

</script>
<%-- Z-Tree控件 --%>
<script type="text/javascript">
    <!--
    var setting = {
        check: {
            enable: true,
            chkboxType: { "Y" : "ps", "N" : "ps" }
        },
        data: {
            simpleData: {
                enable: true
            }
        }
    };

    //z-Tree 初始化
    $(function(){
        $.ajax({
            url: 'menu/findTreeList.do',
            data: {
                role_id:"${role.role_id}"
            },
            type: "post",
            dataType:'json',
            success: function(data){
                var obj = new Array();
                for(var i=0;i<data.length;i++){
                    obj[i] = new Object();
                    obj[i].id = data[i].id;
                    obj[i].pId = data[i].pId;
                    obj[i].name = data[i].name;
                    obj[i].checked = data[i].checked;
                    obj[i].open = true ;
                }
                $.fn.zTree.init($("#rights"), setting, obj);
            }
        });
    });
    //-->
</script>
</html>