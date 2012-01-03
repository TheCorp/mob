<%@ page language="java" pageEncoding="UTF-8" contentType="application/json" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

{
"categoryList":[
           <s:iterator value="briefcaseCategoryList" status="rowstatus">
           "<s:property value="briefcaseCategoryName"/>"
           <s:if test="!#rowstatus.last">,</s:if>
           </s:iterator>
        ]
}