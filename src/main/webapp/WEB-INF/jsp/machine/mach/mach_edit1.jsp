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
    <title>仪器管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="mach_id" id="key" value="${mach.mach_id}">
    <div class="layui-form-item">
        <label class="layui-form-label">仪器编号<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="mach_id" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${mach.mach_id}">
        </div>

        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">仪器型号<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="model" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${mach.model}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">制造商<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="factory" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${mach.factory}">
            </div>
       <%-- </div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">出厂编号<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="out_num" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${mach.out_num}">
            </div>
       <%-- </div>--%>
       <%-- <div class="layui-form-item">--%>
            <label class="layui-form-label">附件<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block" >
                <input name="attach" class="layui-input" type="hidden" autocomplete="off"
                    id="att"   lay-verify="required" value="${mach.attach}">
                <button type="button" class="layui-btn" id="test3">上传</button>
                <button type="button" class="layui-btn" id="test5" url="${mach.attach}" onclick="fileDownload(this)" >下载</button>
                <span class="layui-btn layui-btn-danger down " id="test4"  data-method="clear">删除</span>
                <span id="show"></span>
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">仪器名称<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="mach_name" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${mach.mach_name}">
            </div>
        <%--</div>--%>
       <%-- <div class="layui-form-item">--%>
            <label class="layui-form-label">用途<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="for_use" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${mach.for_use}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">到达时间<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="arrive_time" class="layui-input" type="text" autocomplete="off"
                    id="test2"  placeholder="yyyy-MM-dd" lay-verify="required" value="${mach.arrive_time}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">启用时间<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="use_time" class="layui-input" type="text" autocomplete="off"
                       id="test1" placeholder="yyyy-MM-dd"   lay-verify="required" value="${mach.use_time}">
            </div>
       <%-- </div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">存放位置<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="address" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${mach.address}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">设备状况</label>
            <div class="layui-input-block">
                <select name="situation" id="mach_sta" lay-verify="required" lay-search="">
                        <option value="">请选择</option>
                        <option value="0">在用</option>
                        <option value="1">停用</option>
                        <option value="2">限用</option>
                </select>
            </div>
       <%-- </div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">责任人<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="person" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${mach.person}">
            </div>
        <%--</div>--%>
       <%-- <div class="layui-form-item">--%>
            <label class="layui-form-label">备注<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="bz" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${mach.bz}">
            </div>
       <%-- </div>--%>
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
        //获取时间日历
        laydate.render({
            elem: '#test2'
        });
        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "machine/" + ($("#key").val()==""?"add":"update") + ".do";
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

        //上传附件
        var str="";
        var filename="";
        upload.render({
            elem: '#test3'
            ,url: 'file/upload'
            ,accept: 'file' //普通文件
            //,multiple:true
            ,done: function(res){
                var url=res.url;
                var filename=res.fileName;
                // attached/file/20180503173641/2.docx
                $("#att").val(url);
               $("#show").html(filename.toString());
                $("#test5").attr("url",url);
            }
        });

        //触发事件
        var active={
            //清除附件
          clear:function(){
              $("#att").val("");
              $("#show").html("");
          },
            //下载附件
            down:function () {
                var path=$("#att").val();
                if(path==""){
                    layui.layer.msg("文件不存在");
                    return ;
                }
                // $.ajax({
                //     url:'file/download',
                //     type:'post',
                //     data:{
                //         path:path,
                //     }
                // })
            }
        }
        $(".down").on('click',function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        })
    });


    //显示附件名
    function showFile(){
        var filename="";
        var  arr = $("#att").val();
        filename=arr.substring(arr.lastIndexOf("/")+1);
        $("#show").html(filename);
    }

    //关闭弹框
    function closeWin(){
       parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${mach.code}"=="1"){
            $("#form-button").show();
        }
    }

    //初始化状况
    function initMach(){
        $("#mach_sta").val("${mach.situation}");
    }
</script>
</html>