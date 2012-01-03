<%@ page language="java" pageEncoding="UTF-8" contentType="application/json"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

{
"result":"success",
"name":"<s:property value='updatedBriefcaseItems.name'/>",
"category":"<s:property value='updatedBriefcaseItems.category'/>",
"privacySetting":"<s:property value='updatedBriefcaseItems.privacySetting'/>"
}