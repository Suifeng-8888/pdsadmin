package com.hniois.entity.${demoUp};

import com.hniois.common.page.Page;

/**
*  ${demoName} Bean
*/
public class ${demoUp} extends Page{
    /**基础字段
     ************************************************************/
<#list fieldList as e>
    private String ${e.name}; //${e.comment}
</#list>
    /*************************************************************/

<#list fieldList as e>
    public String get${e.nameUp}() {
        return ${e.name};
    }

    public void set${e.nameUp}(String ${e.name}) {
        this.${e.name} = ${e.name};
    }

</#list>

}
