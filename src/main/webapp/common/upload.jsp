<%@ include file="/common/taglib.jsp"%>
<s:form action ="showUpLoad" method ="POST" enctype ="multipart/form-data" > 
<s:file name ="myFile" label ="Image File" /> 
<s:textfield name ="caption" label ="Caption"/> 
<s:submit /> 
</s:form > 
