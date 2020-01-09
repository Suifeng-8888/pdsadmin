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
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, norm-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="id" id="key" value="${aptitude.id}">
        <label class="layui-form-label">企业资质:<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="number" class="layui-input" type="text" autocomplete="off" lay-verify="required" value="${aptitude.number}">
        </div>
        <label class="layui-form-label">资质类型:<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <select name="type" lay-verify="required">
                <option value="" selected></option>
                <option value="1" <c:if test="${aptitude.type == 1}">selected</c:if>>营业执照</option>
                <option value="2" <c:if test="${aptitude.type == 2}">selected</c:if>>生产许可证</option>
                <option value="3" <c:if test="${aptitude.type == 3}">selected</c:if>>其他</option>
            </select>
        </div>
        <label class="layui-form-label">发证单位:<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="unit" class="layui-input" type="text" autocomplete="off" lay-verify="required" value="${aptitude.unit}">
        </div>
        <label class="layui-form-label">发证时间:<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input class="layui-input" id="time" name="time" placeholder="yyyy-MM-dd" lay-verify="required" value="${aptitude.time}" type="text">
        </div>
        <br />
        <label class="layui-form-label">有效期:</label>
        <div class="layui-input-block">
            <input class="layui-input" id="in_date" name="in_date" placeholder="yyyy-MM-dd" value="${aptitude.in_date}" type="text" />
        </div>
        <br />
        <label class="layui-form-label">许可范围:<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="scope" class="layui-input" type="text" autocomplete="off" lay-verify="required" value="${aptitude.scope}" />
        </div>
        <label class="layui-form-label">资质证书:<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input type="hidden" name="certificate" id="certificate_url" value="${aptitude.certificate}">
            <img id="certificate" src="${aptitude.certificate}" style="width: 260px;height: 180px;border-style: dashed" alt="请上传图片文件。。。">
            <button class="layui-btn layui-btn-normal" id="selectFlie" type="button">浏览</button>
            <button class="layui-btn layui-btn-normal" id="upFile" type="button" >上传</button>
        </div>
    <div class="layui-form-item" style="text-align: center; margin-top: 30px;" >
        <button class="layui-btn" lay-filter="formSave" lay-submit id="form-button" style="display: none">保存</button>
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
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form' ,'laydate','upload'], function() {
        var layer = layui.layer,
            form = layui.form,
            laydate = layui.laydate,
            upload = layui.upload;

        laydate.render({
            elem: '#time'
        });
        laydate.render({
            elem: '#in_date'
        });

        //选完文件后不自动上传
        upload.render({
            elem: '#selectFlie'
            ,url: 'file/upload'
            ,auto: false
            ,bindAction: '#upFile'
            ,choose: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#certificate').attr('src', result); //图片链接（base64）
                });
            }
            ,accept:'images'
            ,done: function(res){
                //  上传回调
                if(res.state=="ok"){
                    var url =  res.url[0];
                    $('#certificate_url').val(url);
                } else {
                    layer.msg("上传文件失败...");
                }
            }
        });

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "aptitude/" + ($("#key").val()==""?"add":"update") + ".do";
            if(!$('#certificate_url').val()){
                layer.msg("请上传文件...");
                return false;
            }
            $.ajax({
                url: url,
                data: data.field,
                type: "post",
                dataType:'json',
                async:false,
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
        if("${aptitude.code}"=="1"){
            $("#form-button").show();
        }
    }
</script>
</html>