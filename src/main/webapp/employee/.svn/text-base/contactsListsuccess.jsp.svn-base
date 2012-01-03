<%@ page language="java" pageEncoding="UTF-8" contentType="application/json" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<s:iterator value="contactList" status="rowstatus">
<input type="hidden" value="<s:property value="id"/>"name="contactId" id="contactIds"><s:property value="nickName"/><s:if test="!#rowstatus.last"></s:if>
</s:iterator>