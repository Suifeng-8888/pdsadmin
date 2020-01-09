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
    <title>产品管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />
</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="pro_id" id="key" value="${productor.pro_id}">
    <div class="layui-form-item">
        <label class="layui-form-label">产品ID<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="pro_id" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${productor.pro_id}">
        </div>

        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">产品名称<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="pro_name" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${productor.pro_name}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">商品条码<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="pro_code" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${productor.pro_code}">
            </div>
       <%-- </div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">产品分类<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="pro_type" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${productor.pro_type}">
            </div>
       <%-- </div>--%>

        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">标准号<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="stand_num" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${productor.stand_num}">
            </div>
        <%--</div>--%>
       <%-- <div class="layui-form-item">--%>
            <label class="layui-form-label">标准名称<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="stand_name" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${productor.stand_name}">
            </div>
        <%--</div>--%>
        <%-- <div class="layui-form-item">--%>
        <label class="layui-form-label">标准类型<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="stand_type" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${productor.stand_type}">
        </div>
        <%--</div>--%>

        <%-- <div class="layui-form-item">--%>
        <label class="layui-form-label">防伪标识<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="forge_id" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${productor.forge_id}">
        </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">保质期<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="end_time" class="layui-input" type="text" autocomplete="off"
                       id="test1" placeholder="yyyy-MM-dd"   lay-verify="required" value="${productor.end_time}">
            </div>
       <%-- </div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">产品商标<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="pro_mark" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${productor.pro_mark}">
            </div>
        <%--</div>--%>
        <%-- <div class="layui-form-item">--%>
        <label class="layui-form-label">产品规格<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="pro_unit" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${productor.pro_unit}">
        </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">产品状态</label>
            <div class="layui-input-block">
                <select name="pro_statu" id="mach_sta" lay-verify="required" lay-search="">
                        <option value="">请选择</option>
                        <option value="0">在产</option>
                        <option value="1">停产</option>
                </select>
            </div>
        <label class="layui-form-label">是否成品</label>
            <div class="layui-input-block">
                <select name="isfinish" id="fin" lay-verify="required" lay-search="">
                        <option value="">请选择</option>
                        <option value="0">成品</option>
                        <option value="1">半成品</option>
                </select>
            </div>
       <%-- </div>--%>
       <%-- <div class="layui-form-item">--%>
            <label class="layui-form-label">净含量<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="net_weight" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${productor.net_weight}">
            </div>
       <%-- </div>--%>
        <%-- <div class="layui-form-item">--%>
        <%--<label class="layui-form-label">图片信息<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block" >
            <button type="button" class="layui-btn" id="test3">上传</button>
            <span class="layui-upload-list" id="demo2"></span>
            <<input type="hidden" id="img" name="pro_img" value="${productor.pro_img}">
        </div>--%>
        <%--</div>--%>
    </div>
    <div class="layui-form-item" style="text-align: center;display: none" id="form-button" >
        <button class="layui-btn" lay-filter="formSave" lay-submit>保存</button>
        <button class="layui-btn layui-btn-warm" onclick="closeWin()">关闭</button>
    </div>
</form>

    <%--文件下载--%>
    <form id="file-form" action="file/download.do" method="post">
        <input name="path" type="hidden">
    </form>
</div>
</body>

<script src="static/layui/layui.js"></script>
<script src="static/login/js/jquery-1.7.2.js"></script>
<script src="static/hniois/hniois.js"></script>
<script>
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);
    //初始化函数 order-1
    $(document).ready(function() {
        init();
        initMach();
        showFile()
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form','upload','laydate'], function() {
        var layer = layui.layer,
            upload=layui.upload,
            laydate=layui.laydate,
            form = layui.form;

        //获取时间日历
        laydate.render({
            elem: '#test1'
        });

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "zsProduct/" + ($("#key").val()==""?"add":"update") + ".do";
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

       /* //上传附件
        var str="";
        var filename="";
        upload.render({
            elem: '#test3'
            ,url: 'file/upload'
            ,auto:'fasle'
            ,accept: 'images' //上传图片
            ,multiple:true//允许上传多张图片
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo2').append('<img src="'+ result +' style="width: 180px;height: 180px;" '+'" alt="'+ file.name +'" class="layui-upload-img">')
                });
            }
            ,done: function(res){
                var url=res.url;
                var filename=res.fileName;
              //  alert(url);
               // $("#img").val(url);
            }
        });

        //触发事件
        var active={
            //下载附件
            down:function () {
                var path=$("#att").val();
                if(path==""){
                    layui.layer.msg("文件不存在");
                    return ;
                }
            }
        }
        $(".down").on('click',function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        })*/
    });


    //关闭弹框
    function closeWin(){
       parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${productor.code}"=="1"){
            $("#form-button").show();
        }
    }

    //初始化产品状态和是否成品
    function initMach(){
        $("#mach_sta").val("${productor.pro_statu}");
        $("#fin").val("${productor.isfinish}")
    }
</script>
</html>