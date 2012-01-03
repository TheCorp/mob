<%@ page language="java" pageEncoding="UTF-8" contentType="application/json"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

{
"names":[
			<s:iterator value="linkedskillList" status="rowstatus">
			"<s:property value="skillname"/>"
			<s:if test="!#rowstatus.last">,</s:if>
			</s:iterator>
		 ]
}			