<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="static/layui/css/layui.css" rel="stylesheet" />
</head>
<body>
<form class="layui-form layui-form-pane" action="">
    <input type="hidden" name="record_id" id="key" value="${report.record_id}">
        <label class="layui-form-label">报告编号<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="serial_number" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${report.serial_number}">
        </div>
    <div id="ypmc">
        <label class="layui-form-label">样品名称<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input id="specimen_name" name="specimen_name" style="height:36px;width:400px" type="text" autocomplete="off" readonly="readonly"
            lay-verify="required" value="${report.specimen_name}">
            <span class="layui-btn-normal layui-btn" data-method="notice">选择样品</span>
        </div>
    </div>
    <input id="item_number" name="item_number" type="hidden" value="${report.item_number}"/>
    <label class="layui-form-label">检测标准<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input id="norm_name" value="${report.test_standard}" class="layui-input" type="text" autocomplete="off" lay-verify="required">
            <input id="norm_id" name="norm_id" type="hidden" value="${report.norm_id}"/>
        </div>
        <label class="layui-form-label">受检单位<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input id="accept_unit" name="accept_unit" class="layui-input" type="text" autocomplete="off" lay-verify="required" value="${report.accept_unit}">
        </div>
        <label class="layui-form-label">检验类别<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input id="detection_type" name="detection_type" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${report.detection_type}">
        </div>
        <label class="layui-form-label">生产单位</label>
        <div class="layui-input-block">
            <input id="production_unit" name="production_unit" class="layui-input" type="text" autocomplete="off"
                   value="${report.production_unit}">
        </div>
        <label class="layui-form-label">样品状态</label>
        <div class="layui-input-block">
            <input id="sample_status" name="sample_status" class="layui-input" type="text" autocomplete="off"
                   value="${report.sample_status}">
        </div>
        <label class="layui-form-label">抽样地点</label>
        <div class="layui-input-block">
            <input id="sampling_site" name="sampling_site" class="layui-input" type="text" autocomplete="off"
                   value="${report.sampling_site}">
        </div>
        <label class="layui-form-label">送样时间</label>
        <div class="layui-input-inline">
            <input class="layui-input" id="give_time" name="give_time" placeholder="yyyy-MM-dd"
                   value="${report.give_time}" type="text">
        </div>
        <br/>
        <label class="layui-form-label">样品数量</label>
        <div class="layui-input-block">
            <input id="specimen_amount" name="specimen_amount" class="layui-input" type="text" autocomplete="off"
                   value="${report.specimen_amount}">
        </div>
        <label class="layui-form-label">抽样基数</label>
        <div class="layui-input-block">
            <input id="sampling_number" name="sampling_number" class="layui-input" type="text" autocomplete="off"
                   value="${report.sampling_number}">
        </div>
        <label class="layui-form-label">检验日期</label>
        <div class="layui-input-inline">
            <input class="layui-input" id="inspect_time" name="inspect_time" placeholder="yyyy-MM-dd"
                   value="${report.inspect_time}" type="text">
        </div>
        <br/>
        <div id="demo">
            <label class="layui-form-label">使用仪器</label>
            <div class="layui-input-block">
                <input id="employ_facility" name="employ_facility" style="height:36px;width:400px" type="text" autocomplete="off" value="${report.employ_facility}">
                <span class="layui-btn-normal layui-btn" data-method="notice">选择仪器</span>
            </div>
        </div>
        <div>
            <label class="layui-form-label">仪器型号</label>
            <div class="layui-input-block">
                <input id="model" name="model" class="layui-input" type="text" autocomplete="off" value="${report.model}">
            </div>
        </div>
        <div >
            <label class="layui-form-label">仪器编号</label>
            <div class="layui-input-block">
                <input id="mach_id" name="mach_id" class="layui-input" type="text" autocomplete="off" value="${report.mach_id}">

            </div>
        </div>
        <label class="layui-form-label">实验室条件</label>
        <div class="layui-input-block">
            <input name="condition" class="layui-input" type="text" autocomplete="off"
                   value="${report.condition}">
        </div>
        <label class="layui-form-label">检查依据</label>
        <div class="layui-input-block">
            <input name="inspect_gist" class="layui-input" type="text" autocomplete="off" value="${report.inspect_gist}">
        </div>
        <label class="layui-form-label">判定依据</label>
        <div class="layui-input-block">
            <input name="judge_gist" class="layui-input" type="text" autocomplete="off" value="${report.judge_gist}">
        </div>
        <label class="layui-form-label">检验结论</label>
        <div class="layui-input-block">
            <input name="conclusion" class="layui-input" type="text" autocomplete="off" value="${report.conclusion}">
        </div>
        <label class="layui-form-label">签发日期</label>
        <div class="layui-input-inline">
            <input class="layui-input" id="sign_time" name="sign_time" placeholder="yyyy-MM-dd" value="${report.sign_time}" type="text">
        </div>
        <br/>
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <input name="comment" class="layui-input" type="text" autocomplete="off" value="${report.comment}">
        </div>
       <%-- <label class="layui-form-label">制表人</label>
        <div class="layui-input-block">
            <input name="lister" class="layui-input" type="text" autocomplete="off"
                   value="${report.lister}">
        </div>--%>

    <div class="layui-form-item" style="text-align: center;margin-top: 30px;">
        <button class="layui-btn" lay-filter="formSave" lay-submit id="form-button" style="display: none">保存</button>
        <button class="layui-btn layui-btn-warm" onclick="closeWin()">关闭</button>
    </div>
</form>
</body>
<script src="static/layui/layui.js"></script>
<script src="static/js/jQuery/jquery-1.7.2.js"></script>
<script>
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);
    //初始化函数 order-1
    $(document).ready(function() {
        init();
    });
    //layui模块加载 order-2
    layui.use(['layer', 'form' ,'laydate'], function() {
        var layer = layui.layer,
            form = layui.form,
        laydate = layui.laydate;

        laydate.render({
            elem: '#give_time'
        });
        laydate.render({
            elem: '#inspect_time'
        });
        laydate.render({
            elem: '#sign_time'
        });

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "report/" + ($("#key").val()==""?"add":"update") + ".do";
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

        //
        var active = {
            notice:function(){
                layer.open({
                    title:'选择使用仪器',
                    type:2,
                    offset:'auto',
                    maxmin: true,
                    moveType: 1,//可以拖拽
                    content:'report/choose.do',
                    area: ['90%', '90%']

                })
            }
        };
        $('#demo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

    });

    function closeWin(){
        parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${report.code}" == "1"){
            $("#form-button").show();
        }
    }
    $('#ypmc .layui-btn').on('click', function(){
        layer.open({
            title:'选择检测标准',
            type:2,
            offset:'auto',
            maxmin: true,
            moveType: 1,//可以拖拽
            content:'report/ypmc.do',
            area: ['90%', '90%']
        });
    });
</script>
</html>