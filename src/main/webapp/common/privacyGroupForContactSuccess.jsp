
<%@ page language="java" pageEncoding="UTF-8" contentType="application/json"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

{
"names":[
           <s:iterator value="contactTypesList" status="rowstatus">
           "<s:property value='name'/>"
           <s:if test="!#rowstatus.last">,</s:if>
           </s:iterator>
        ],
"profiles":[
           <s:iterator value="profiles" status="rowstatus">
           "<s:property value='id'/>","<s:property value='name'/>"
           <s:if test="!#rowstatus.last">,</s:if>
           </s:iterator>
        ]                

}