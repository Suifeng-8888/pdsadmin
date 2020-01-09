/***
 * 河南省信息安全研究
 * 描述:基础公共组件相关js
 */

/**
 * 基础表单提交 begin----------------------------------------------------------------------------------------------------------------------
 *
 */
//获取查询参数
function getSearchData(){
    var obj = new Object();
    $(".hniois-search-data").each(function () {
        obj[$(this).attr("name")] = $(this).val();
    });
    return obj;
}

//清空查询参数
function clearSearchData(){
    $(".hniois-search-data").each(function () {
        $(this).val("");
    });
}

/**
 * 文件下载
 * */
function fileDownload(o){
    var url = $(o).attr("url");
    if(url==""){
        layui.layer.msg("文件路径错误");
        return false;
    }
    $("#file-form input[name='path']").val(url);
    $("#file-form").submit();
}

//导入/导出
function doExport(url) {
    var exportList = new Array();
    var comment ;
    $(".layui-table>thead>tr>th").each(function(index){
        comment = $(this).find("span:eq(0)").html();
        if(comment){
            exportList[index-1] = new Object();
            exportList[index-1].name = $(this).attr("data-field");
            exportList[index-1].comment = comment;
            exportList[index-1].order = index;
        }
    });
    //查询参数
    var param = getSearchData();
    $.ajax({
        url: 'excel/initExport.do',
        data: {
            showlist:JSON.stringify(exportList),
            showSearch:JSON.stringify(param),
            url:url
        },
        type: "post",
        dataType:'json',
        success: function(data){
            top._tools.goExcel();
        }
    });
}

/**
 * 基础表单提交 end----------------------------------------------------------------------------------------------------------------------
 *
 */

/**
 * 基础公共下拉框初始化 begin----------------------------------------------------------------------------------------------------------------------
 *
 */

//初始化角色下拉框 Role
function initRoleSelect(obj){
    $.ajax({
        url: 'user/findList.do',
        data: obj,
        type: "post",
        dataType:'json',
        success: function(data){
            var options = "<option value=''></option>";
            for(var i=0;i<data.length;i++){
                options+= "<option value='"+data[i].role_id+"'>"+data[i].role_name+"</option>";
            }
            $("#hniois-role-select").html(options);
            layui.form.render('select');//重载layui-select
        }
    });
}

/**
 * 基础公共下拉框初始化 end----------------------------------------------------------------------------------------------------------------------
 *
 */