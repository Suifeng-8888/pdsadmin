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
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />
</head>
<body>
<div >
    <form class="layui-form layui-form-pane" action="" >
        <input type="hidden" name="id" id="key" value="${user.id}">
        <div class="layui-form-item">
            <label class="layui-form-label">帐号ID:</label>
            <div class="layui-input-block">
                <input name="user_id" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${user.user_id}" readonly="readonly">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名:</label>
            <div class="layui-input-block">
                <input name="username" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${user.username}" readonly="readonly">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码:</label>
            <div class="layui-input-block">
            <input name="password" class="layui-input" type="password" autocomplete="off"
                   lay-verify="required" value="" id="newpsd">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码:</label>
            <div class="layui-input-block">
                <input class="layui-input" type="password" autocomplete="off"
                       lay-verify="required" value="" id="affirmpsd">
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center;">
            <button class="layui-btn" lay-filter="formSave" lay-submit id="form-button">保存</button>
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

    //layui模块加载 order-2
    layui.use(['layer', 'form'], function() {
        var layer = layui.layer, form = layui.form;

        //监听提交
        form.on('submit(formSave)', function(data){
            var newpsd = $("#newpsd").val();
            var affirmpsd = $("#affirmpsd").val();
            if (newpsd == affirmpsd) {
                $.ajax({
                    url: "user/update.do",
                    data: data.field,
                    type: "post",
                    dataType:'json',
                    success: function(result){
                        if(result.state == "ok"){
                            parent.layer.msg(result.msg);
                            closeWin();
                        }else{
                            layer.msg(result.msg);
                        }
                    }
                });
            } else {
                parent.layer.msg("两次密码输入不一样!");
            }
            return false;
        });
    });

    //  关闭按钮
    function closeWin(){
        parent.layer.close(index);
    }

</script>
</html>