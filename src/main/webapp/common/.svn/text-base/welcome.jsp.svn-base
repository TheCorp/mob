<%@ include file="/common/taglib.jsp"%>
<div id="bc_main_outer">
	<div id="bc_main_mid">
	
	<authz:authorize ifAllGranted="ROLE_EMPLOYER">
	<jsp:include page="/employer/listopportunity.action"></jsp:include>
	</authz:authorize>

	<authz:authorize ifAllGranted="ROLE_EMPLOYEE">
	<jsp:include page="/employee/loadEmployeeProfiles.action"></jsp:include>
	</authz:authorize> 
</div>
</div>