<%@ page language="java" pageEncoding="UTF-8" contentType="application/json" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:iterator value="contactList" status="rowstatus">
<input type="hidden" name="contactIds" value="<s:property value="nickName"/>"/><s:property value="nickName"/>
</s:iterator>