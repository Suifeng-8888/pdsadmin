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
        <input type="hidden" name="id" id="key" value="${purApp.id}">
        <input type="hidden" id="proid" name="pro_id" value="${purApp.pro_id}">
        <div class="layui-form-item" >
            <div id="layerDemo">
                <label class="layui-form-label">商品名称</label>
                <div class="layui-input-block">
                    <input id="test" type="text" style="width:400px;height:35px;" name="pro_name" lay-verify="required"
                           autocomplete="off"   value="${purApp.pro_name}" placeholder="请选择" />
                    <span data-method="notice" class="layui-btn">选择商品</span>
                </div>
            </div>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">采购数量</label>
            <div class="layui-input-block">
                <input id="num" name="pur_num" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required"  value="${purApp.pur_num}">
            </div>
            <%--<label class="layui-form-label">产品规格</label>
            <div class="layui-input-block">
                <input id="unit" name="pro_unit" class="layui-input" type="text" autocomplete="off"
                       value="${purApp.pro_unit}">
            </div>--%>
       <%-- </div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">申请原因</label>
            <div class="layui-input-block">
                <input name="pur_reason" class="layui-input" type="text" autocomplete="off"
                       value="${purApp.pur_reason}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">申请人</label>
            <div class="layui-input-block">
                <input name="applyer" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required"   value="${purApp.applyer}">
            </div>
       <%-- </div>--%>

       <%-- <div class="layui-form-item" id="send_time">--%>
            <div id="send_time">
                <label class="layui-form-label">申请时间</label>
            <div class="layui-input-block">
                <input type="text" name="apply_time"  class="layui-input" id="test1" placeholder="yyyy-MM-dd"
                       autocomplete="off"  lay-verify="required"    value="${purApp.apply_time}">
            </div>
        </div>
        <%--<div class="layui-form-item" >--%>
            <div id="check">
                <label class="layui-form-label">审批状态</label>
                <div class="layui-input-block">
                    <select name="status" id="stu" lay-search="">
                        <option value="">请选择</option>
                        <option value="0">审批通过</option>
                        <option value="1">审批驳回</option>
                        <option value="2">待审批</option>
                    </select>
                </div>
            </div>
        <%--<div class="layui-form-item" id="approve">--%>
            <div id="approve">
                <label class="layui-form-label">审批人</label>
                <div class="layui-input-block">
                    <input name="approver" class="layui-input" type="text" autocomplete="off"
                           value="${purApp.approver}">
                </div>
            </div>
        <%--<div class="layui-form-item" id="appr_time">--%>
            <div id="appr_time">
                <label class="layui-form-label">审批时间</label>
                <div class="layui-input-block">
                    <input name="approve_time" class="layui-input" type="text" autocomplete="off"
                           value="${purApp.approve_time}">
                </div>
            </div>
        <%--<div class="layui-form-item" id="bz">--%>
            <div id="bz">
                <label class="layui-form-label">申请批次号</label>
                <div class="layui-input-block">
                    <input name="bz" class="layui-input" type="text" autocomplete="off"
                           value="${purApp.bz}">
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
            $ = layui.jquery,
            laydate = layui.laydate;

        //获取时间日历
        laydate.render({
            elem: '#test1'
        });

        //监听提交
        form.on('submit(formSave)', function (data) {
            var url = "plan/" + ($("#key").val() == "" ? "add" : "update") + ".do";
            $.ajax({
                url: url,
                data: data.field,
                type: "post",
                dataType: 'json',
                success: function (data) {
                    if (data.state == "ok") {
                        parent.formReload();
                        parent.layer.msg(data.msg);
                        closeWin();
                    } else {
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
                var index2 = layer.open({
                    title: "采购的商品",
                    type: 2,
                    offset: 't',
                    maxmin: true,
                    skin: 'layui-layer-rim', //加边框
                    moveType: 1,
                    content: "plan/choose.do",
                    area: ['700px', '80%'],
                });
                 layer.full(index2);
            }
        }

        $('#layerDemo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    });


    function closeWin(){
        parent.layer.close(index);
    }

    function init(){

        //初始化按钮操作
        if("${purApp.code}"=="1"){
            $("#form-button").show();
            $("#check").hide();//新增或编辑时禁止修改审批状态
            $("#bz").hide();
            $("#approve").hide();
            $("#appr_time").hide();
        }

    }
    //初始化审批状态
    function initCheck(){
        $("#stu").val(${purApp.status});
    }
    //初始化产品品名下拉框
    function initCate(){
        $.ajax({
            url: 'product/findList.do',
            data: {},
            type: "post",
            dataType:'json',
            success: function(data){
                var options = "<option value=''>请选择申请的产品</option>";
                for(var i=0;i<data.length;i++){
                    options+= "<option value='"+data[i].pro_id+"'>"+data[i].pro_name+"</option>";
                }
                $("#proid").html(options);
                $("#proid").val("${purApp.pro_id}");


            }
        });
    }

</script>
</html>