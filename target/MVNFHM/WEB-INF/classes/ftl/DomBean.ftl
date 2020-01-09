package com.hniois.entity.${packageName};

import com.hniois.common.page.Page;

public class ${objectName} extends Page{
    /**基础字段
     ************************************************************/
<#list fieldList as e>
    private String ${e.name}; //${e.comment}
</#list>
    /*************************************************************/


}
