<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><tiles:getAsString name='title'/></title>
<link rel="stylesheet" type="text/css" href="<c:url value='/styles/default/css/briefcase_style.css'/>" />

</head>
<body id="bc_home"><!-- change this for each page for active nav styles - this way the navbar code stays consistent without script, i.e. you can SSI #bc_navbar -->
<div id="bc_tophead">
	<a href="<c:url value='/'/>"><img src="<c:url value='/styles/default/images/mobc_logo-onblack.png'/>" style="margin-top: 25px;"></a>
	<tiles:insertAttribute name='header'/>
</div>

<div id="bc_navbar">
	<tiles:insertAttribute name='nav'/>
</div>

<div id="bc_main_outer">
	<tiles:insertAttribute name='body'/>
</div>



<br class="clear-both" />

<div id="footer">
	<tiles:insertAttribute name='footer'/>
</div>


<br/><br/>

</body>
</html>
