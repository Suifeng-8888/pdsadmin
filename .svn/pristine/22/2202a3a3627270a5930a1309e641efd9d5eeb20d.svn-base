<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <title>上传附件</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/layui/css/layui.css" rel="stylesheet" />
    <link href="static/layui/css/search.css" rel="stylesheet" />
    <link href="static/font-awesome/css/font-awesome.css" rel="stylesheet" />
</head>
<body>


<form class="layui-form layui-form-pane" action="" >

    <div class="layui-form-item">
        <div class="file-upload" style="text-align: center;padding-top: 10px;">
            <button class="layui-btn layui-btn-normal" id="selectFlie" type="button">上传1</button>
            <button class="layui-btn" id="uploadFile" type="button" >保存1</button>
        </div>
    </div>
    </div>
</form>

<%--<div class="hniois-search-btns">
        <a id="hniois-add" onclick="sendMsg()" class="layui-btn layui-btn-sm layui-btn-normal" href="javascript:;">
            <i class="fa  fa-lg" aria-hidden="true"></i> 上传</a>
        <a id="hniois-deletes" onclick="closeWin();" class="layui-btn layui-btn-sm layui-btn-danger" href="javascript:;" >
            <i class="fa  fa-lg" aria-hidden="true"></i> 保存</a>
</div>--%>
<%--文件名称--%>
<input type="hidden" id="file-name">
<%--文件路径--%>
<input type="hidden" id="file-url">
</body>
<script src="static/layui/layui.all.js"></script>
<script src="static/js/jQuery/jquery-1.7.2.js"></script>
<script src="static/hniois/hniois.js"></script>
<script>
    //初始化函数 order-1
    var data_table ;//数据表格
    $(document).ready(function() {
        var layer = layui.layer;
        var upload=layui.upload;

        //选完文件后不自动上传
        upload.render({
            elem: '#selectFlie'
            ,url: 'file/upload'
            ,auto: false
            ,bindAction: '#uploadFile'
            ,accept:'file'
            ,multiple:true
            ,choose: function(obj){
                $("#file-url").val("");
               // $("#file-name").val("");
            }
            ,done: function(res,index){
                if(res.state=="ok"){
                    var url =  res.url;
                    var name =  res.fileName;
                    //给父页面传值
                    $("#file-url").val($("#file-url").val()+ url + ",")
                   $("#file-name").val($("#file-name").val()+ name + "," )
                }
            }
            ,allDone: function(obj){ //当文件全部被提交后，才触发
                parent.$('#test').val($("#file-url").val());
               parent.$('#att_file').html($("#file-name").val());
                closeWin();
            }
        });
    });


    //给父页面传值
     function sendMsg(){
         var d = layui.table.checkStatus('table');
         if (d.data.length === 0) {
             layui.layer.msg('请选择要选择的商品');
             return;
         }
         var data = d.data,
             pro_names=[],
             nums=[],
             ids = [];

         for(var i=0;i<data.length;i++){
             ids.push(data[i].pro_id);
             pro_names.push(data[i].pro_name);
             nums.push(data[i].bz);
         }
        parent.$('#test').val(pro_names.toString());
         parent.$('#proid').val(ids.toString());
         parent.$('#num').val(nums.toString());
        /*parent.layer.tips('Look here', '#test', {time: 5000});*/
         closeWin();
    };

    function closeWin(){
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }

</script>
</html>
