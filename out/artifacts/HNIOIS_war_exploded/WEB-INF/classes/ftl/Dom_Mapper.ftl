<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${demoUp}Mapper">
    <!-- 保存 -->
    <insert id="save" parameterType="com.hniois.entity.${demo}.${demoUp}" useGeneratedKeys="true" keyProperty="id">
        insert into ${table}(`id`
        <#list fieldList as e>
        <if test="${e.name}!='' and ${e.name}!=null">,`${e.name}`</if>
        </#list>
        )
        values (id
        <#list fieldList as e>
        <if test="${e.name}!='' and ${e.name}!=null">,${r"#{"}${e.name}${r"}"}</if>
        </#list>
        )
    </insert>

    <!-- 批量保存 -->
    <insert id="saveBatch" parameterType="com.hniois.entity.${demo}.${demoUp}">
        insert into ${table}
        (
        <#list fieldList as e>`${e.name}`,</#list>
        )
        values
        <foreach collection="data" item="e" index="index" separator=",">
            (
       <#list fieldList as e>
           ${r"#{"}${e.name}${r"}"},
       </#list>
            )
        </foreach>
    </insert>

    <!-- 修改 -->
    <update id="update" parameterType="com.hniois.entity.${demo}.${demoUp}">
        update ${table}
        <set>
        <#list fieldList as e>
        <if test="${e.name}!='' and ${e.name}!=null">`${e.name}`=${r"#{"}${e.name}${r"}"},</if>
        </#list>
        </set>
        where id=${r"#{id}"}
    </update>

    <!-- 批量修改 -->
    <update id="updateBatch" parameterType="com.hniois.entity.${demo}.${demoUp}">
        update ${table}
        <set>
        <#list fieldList as e>
        <if test="${e.name}!='' and ${e.name}!=null">`${e.name}`=${r"#{"}${e.name}${r"}"},</if>
        </#list>
        </set>
        where id in
        <foreach item="item" index="index" collection="data" open="(" separator="," close=")">
            ${r"#{item}"}
        </foreach>
    </update>

    <!-- 删除 -->
    <delete id="delete" parameterType="com.hniois.entity.${demo}.${demoUp}">
        delete from ${table} where 1=1
        <#list fieldList as e>
        <if test="${e.name}!='' and ${e.name}!=null">and `${e.name}`=${r"#{"}${e.name}${r"}"}</if>
        </#list>
    </delete>

    <!-- 批量删除 -->
    <delete id="deleteBatch" parameterType="java.util.ArrayList">
        delete from ${table}
        where id in
        <foreach item="item" index="index" collection="data" open="(" separator="," close=")">
            ${r"#{item}"}
        </foreach>
    </delete>

    <!-- 查询 -->
    <select id="find" parameterType="com.hniois.entity.${demo}.${demoUp}" resultType="com.hniois.entity.${demo}.${demoUp}">
        select	t.*
        from ${table} t
        where 1=1
        <#list fieldList as e>
        <if test="${e.name}!='' and ${e.name}!=null">and t.`${e.name}`=${r"#{"}${e.name}${r"}"}</if>
        </#list>
    </select>

    <!-- 查询List -->
    <select id="findList" parameterType="com.hniois.entity.${demo}.${demoUp}" resultType="com.hniois.entity.${demo}.${demoUp}">
        select	t.*
        from ${table} t
        where 1=1
        <#list fieldList as e>
        <if test="${e.name}!='' and ${e.name}!=null">and t.`${e.name}`=${r"#{"}${e.name}${r"}"}</if>
        </#list>
        order by t.id
    </select>

    <!-- 查询Count -->
    <select id="findCount" parameterType="com.hniois.entity.${demo}.${demoUp}" resultType="java.lang.Integer">
        select count(*)
        from ${table} t
        where 1=1
        <#list fieldList as e>
        <if test="${e.name}!='' and ${e.name}!=null">and t.`${e.name}`=${r"#{"}${e.name}${r"}"}</if>
        </#list>
    </select>

    <!-- 分页查询 -->
    <select id="findPage" parameterType="com.hniois.entity.${demo}.${demoUp}" resultType="com.hniois.entity.${demo}.${demoUp}">
        select	t.*
        from ${table} t
        where 1=1
        <#list fieldList as e>
        <if test="${e.name}!='' and ${e.name}!=null">and t.`${e.name}`=${r"#{"}${e.name}${r"}"}</if>
        </#list>
        order by t.id
        limit ${r"#{offset},#{pageSize}"}
    </select>

    <!-- 分页查询Count -->
    <select id="findPageCount" parameterType="com.hniois.entity.${demo}.${demoUp}" resultType="java.lang.Integer">
        select count(*)
        from ${table} t
        where 1=1
        <#list fieldList as e>
        <if test="${e.name}!='' and ${e.name}!=null">and t.`${e.name}`=${r"#{"}${e.name}${r"}"}</if>
        </#list>
    </select>
</mapper>