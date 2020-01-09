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
    <title>用户管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />
</head>
<body>
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="user_id" id="key" value="${user.user_id}">

    <div class="layui-form-item">
        <div id="download" class="layui-input-inline" url="${user.user_img}" onclick="fileDownload(this)"
            title="点击下载">
            <img id="user_img" name="user_img" class="layui-circle" src="${user.user_img}"
                 style="width: 180px;height: 180px;">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="file-upload" style="text-align: center;padding-top: 10px;">
            <button class="layui-btn layui-btn-normal" id="selectFlie" type="button">上传</button>
            <button class="layui-btn" id="uploadFile" type="button" >保存</button>
        </div>
    </div>
    </div>
</form>

<%--文件下载--%>
<form id="file-form" action="file/download.do" method="post">
    <input name="path" type="hidden">
</form>

</body>

<script src="static/layui/layui.js"></script>
<script src="static/login/js/jquery-1.7.2.js"></script>
<script src="static/hniois/hniois.js"></script>
<script>
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);

    //layui模块加载 order-2
    layui.use(['layer','upload'], function() {
        var layer = layui.layer,
            upload = layui.upload;

        //选完文件后不自动上传
        upload.render({
            elem: '#selectFlie'
            ,url: 'file/upload'
            ,auto: false
            ,bindAction: '#uploadFile'
            ,choose: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#user_img').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                if(res.state=="ok"){
                    var url =  res.url[0];
                    //点击下载更新
                    $("#download").attr("url",url);
                    //数据库字段更新
                    $.ajax({
                        url: "user/update.do",
                        data: {
                            user_id:$("#key").val(),
                            user_img:url
                        },
                        type: "post",
                        dataType:'json',
                        success: function(data){
                            if(data.state=="ok"){
                                //表单刷新
                                parent.formReload();
                                //提示信息
                                parent.layer.msg(data.msg);
                                //关闭窗口
                                closeWin();
                            }else{
                                //错误信息
                                layer.msg(data.msg);
                            }
                        }
                    });
                }
            }
        });

    });

    //关闭窗口
    function closeWin(){
        parent.layer.close(index);
    }

</script>
</html>