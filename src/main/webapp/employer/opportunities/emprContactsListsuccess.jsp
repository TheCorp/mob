<%@ page language="java" pageEncoding="UTF-8" contentType="application/json" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:iterator value="skillsList" status="rowstatus">
<input type="hidden" id="skillfromlist1" name="skillfromlist1" value="<s:property value="skillname"/>"><s:property value="skillname"/><s:if test="!#rowstatus.last"></s:if>
</s:iterator>