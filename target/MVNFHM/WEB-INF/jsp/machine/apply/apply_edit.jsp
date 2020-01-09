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
    <title>采购申请</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
    <form class="layui-form layui-form-pane" action="" >
        <input type="hidden" name="apply_id" id="key" value="${apply.apply_id}">
        <div class="layui-form-item" >
            <label class="layui-form-label">申请购买ID<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="apply_id" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${apply.apply_id}">
            </div>

            <label class="layui-form-label">仪器名称<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="mach_name" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${apply.mach_name}">
            </div>

            <label class="layui-form-label">仪器型号<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="mach_model" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${apply.mach_model}">
            </div>

            <label class="layui-form-label">精确度<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="fate" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${apply.fate}">
            </div>

            <label class="layui-form-label">生产商<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="factory" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${apply.factory}">
            </div>

            <label class="layui-form-label">购买单价<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="price" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${apply.price}">
            </div>

            <label class="layui-form-label">购买数量<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="apply_num" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${apply.apply_num}">
            </div>

            <label class="layui-form-label">申请人<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="applyer" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${apply.applyer}">
            </div>

            <div id="layerDemo">
                <label class="layui-form-label">所选附件</label>
                <div class="layui-input-block">
                    <input id="test" type="hidden" style="width:400px;height:35px;" name="reason"  value="${apply.reason}" placeholder="请选择" />
                    <span data-method="notice" class="layui-btn " >上传</span>
                    <span class="layui-btn layui-btn-danger "  data-method="clear">删除</span>
                    <span class="layui-inline layui-upload-choose" id="att_file"></span>
                </div>
            </div>

            <label class="layui-form-label">杂费<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="cment" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${apply.cment}">
            </div>

            <div id="app_time">
                <label class="layui-form-label">申请时间</label>
                <div class="layui-input-block">
                    <input name="apply_time" class="layui-input" type="text" autocomplete="off"
                           id="test1" placeholder="yyyy-MM-dd"     value="${apply.apply_time}">
                </div>
            </div>
            <%--<div class="layui-form-item">--%>
            <div  id="approver" style="display: none">
                <label class="layui-form-label">审批人<span style="color: #FF5722">*</span></label>
                <div class="layui-input-block">
                    <input name="approver" class="layui-input" type="text" autocomplete="off"
                           value="${apply.approver}">
                </div>
            </div>
            <%--<div class="layui-form-item">--%>
            <div id="approve_time" style="display: none">
                <label class="layui-form-label">审批时间<span style="color: #FF5722">*</span></label>
                <div class="layui-input-block">
                    <input name="approve_time" class="layui-input" type="text" autocomplete="off"
                           value="${apply.approve_time}">
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
        showFile();
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form','laydate'], function() {
        var layer = layui.layer,
            form = layui.form,
            $ = layui.jquery,
            laydate = layui.laydate;

        //获取时间日历
        laydate.render({
            elem: '#test1'
        });

        ///监听提交
        form.on('submit(formSave)', function(data){
            var url = "apply/" + ($("#key").val()==""?"add":"update") + ".do";
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

        //触发事件
        var active = {
            //监听搜索表单提交
            notice:function () {
                layer.open({
                    title: "采购的商品",
                    type: 2,
                    offset: 't',
                    maxmin: true,
                    skin: 'layui-layer-rim', //加边框
                    moveType: 1,
                    content: "apply/upload.do",
                    area: ['400px', '320px'],
                });

            }
            ,
            clear:function () {
                $("#test").val("");
                $("#att_file").html("");

            }
        }

        $('#layerDemo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    });


    //显示附件名
    function showFile(){
        var filename="";
        var  arr = $("#test").val().split(",");
        for(var i=0;i<arr.length;i++){
            filename+=","+arr[i].substring(arr[i].lastIndexOf("/")+1);
        }
        $("#att_file").html(filename.substring(1,filename.length-1));
    }

    function closeWin(){
        parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${apply.code}"=="1"){
            $("#form-button").show();
        }else{
            $("#approver").show();
            $("#approve_time").show();
        }
        if($("#key").val()==null||$("#key").val()==""){
            //说明是新增状态
            $("#app_time").show();
        }else{
            $("#app_time").hide();
        }
    }

</script>
</html>