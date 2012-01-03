<%@ include file="/common/taglib.jsp"%>
<authz:authorize ifNotGranted="ROLE_ADMIN,ROLE_EMPLOYER,ROLE_EMPLOYEE">
	<div id="login_spot">
		<div class="joinorlogin">Already a Member?</div>
		<div id="loginid" style="display: block">
			<form id="login" action="<c:url value='/j_security_check'/>" method="POST">
				<s:textfield cssClass="txt" name="j_username" onkeypress="clickButton();" value="you@somewhere.com" onfocus="inputOnFocus(this)" />
				<br/>
				<s:password cssClass="txt" name="j_password" value="your password" onfocus="inputOnFocus(this)" onkeypress="clickButton();" />
				<div class="frow">
					<div class="fcol-l">
						<s:checkbox name="j_remember_me" value="1" />
						<span class="remember_details">remember details</span>
					</div>
					<div class="fcol-r" style="margin-left: 2px">
						<input type="image" class="login_btn" id="loginImageId" onclick="clickButton()"
						value="login" src="${ctx}/styles/default/images/mobc_sm_login-up.jpg" />
					</div>
				</div>
				<div class="frow forgot_pass" style="margin-top: 30px;">
					<s:a href="${ctx}/public/forgotPassword.action">forgot password?</s:a>
				</div>
				<br>
			</form>
		</div>
	</div>
</authz:authorize>

<div class="danDiv">
	<authz:authorize ifAnyGranted="ROLE_ADMIN,ROLE_EMPLOYEE,ROLE_EMPLOYER">
		<font class="danText">Logged in as<b>
		<authz:authorize ifAnyGranted="ROLE_ADMIN,ROLE_EMPLOYEE">
			<authz:authentication operation="fullName"/>
		</authz:authorize>
		<authz:authorize ifAnyGranted="ROLE_ADMIN,ROLE_EMPLOYER">
			<authz:authentication operation="emplrOrgName"/>
		</authz:authorize>
		</b></font>
		<authz:authorize ifAnyGranted="ROLE_EMPLOYEE">
			<s:a href="${ctx}/employee/loadEmployeeAccount.action">
				<img src="${ctx}/styles/default/images/navigation_images/button_editaccount_focus.png">
			</s:a>
		</authz:authorize>
		<authz:authorize ifAnyGranted="ROLE_EMPLOYER">
			<s:a href="${ctx}/employer/editEmployerAccountdetails.action">
				<img src="${ctx}/styles/default/images/navigation_images/button_editaccount_focus.png">
			</s:a>
		</authz:authorize>
		<authz:authorize ifAnyGranted="ROLE_ADMIN,ROLE_EMPLOYER,ROLE_EMPLOYEE">
			<a href="${ctx}/public/logout.action"> 
				<img src="${ctx}/styles/default/images/navigation_images/button_logout_focus.png">
			</a>
		</authz:authorize>
	</authz:authorize>
</div>
<authz:authorize ifAnyGranted="ROLE_ADMIN,ROLE_EMPLOYEE,ROLE_EMPLOYER">
	<!--<div style="background-image:url('myContactAction1.action_files/divdiv.png');">-->
	<!--<img class="danImage" src="myContactAction1.action_files/dashboard_divider_horizontal.png" />-->
	<div class="danDivBottom">
		<form id="searchformId" action="" onsubmit="return false">
			<font class="danText2"><b>Search in:</b></font> 
			<select name="search1" id="searchvalueid" onchange="setAdvancedSearch();" onkeypress="clickButtonSearch()" class='danInput1'>
				<option value="Employees">Employees</option>
				<option value="Employers">Employers</option>
				<option value="Groups">Groups</option>
				<option value="Opportunities">Opportunities</option>
			</select> 
			<input type="text" class='danInput1' name="keyword" id="searchText" onkeypress="clickButtonSearch();" onfocus="inputOnFocus(this)">
			<input src="${ctx}/styles/default/images/navigation_images/button_go.png" type="image" id="searchlink" onclick=" return searchFromEmployeeHeader();">
		</form>
		<div style="float: right;">
			<a id='employeesearch' style="color: #FFFFFF; font-size: 11px; text-decoration: underline;" href="${ctx}/browse/employees.action">Browse</a>
			<a id='employersearch' style="color: #FFFFFF; font-size: 11px; text-decoration: underline;display:none" href="${ctx}/browse/employers.action">Browse</a>			
			<a id='groupssearch' style="color: #FFFFFF; font-size: 11px; text-decoration: underline;display:none" href="${ctx}/browse/groups.action">Browse</a>
			<a id='oppssearch' style="color: #FFFFFF; font-size: 11px; text-decoration: underline;display:none" href="${ctx}/browse/opps.action">Browse</a>
		</div>
	</div>
</authz:authorize>
<script type="text/javascript">
	function setAdvancedSearch(){
	   searchValue=$("#searchvalueid").val();
	   $("#employeesearch").attr("style","color: #FFFFFF; font-size: 11px; text-decoration: underline;display:none"); 
	   $("#employersearch").attr("style","color: #FFFFFF; font-size: 11px; text-decoration: underline;display:none"); 
	   $("#groupssearch").attr("style","color: #FFFFFF; font-size: 11px; text-decoration: underline;display:none"); 
	   $("#oppssearch").attr("style","color: #FFFFFF; font-size: 11px; text-decoration: underline;display:none"); 

	   if(searchValue=="Employees")
	   {
		   $("#employeesearch").attr("style","color: #FFFFFF; font-size: 11px; text-decoration: underline;display:"); 
	   }
	   if(searchValue=="Employers")
	   {
		   $("#employersearch").attr("style","color: #FFFFFF; font-size: 11px; text-decoration: underline;display:"); 
	   }
	   if(searchValue=="Opportunities")
	   {
		   $("#oppssearch").attr("style","color: #FFFFFF; font-size: 11px; text-decoration: underline;display:"); 
	   }
	   
	    if(searchValue=="Groups")
	   {
	 	   $("#groupssearch").attr("style","color: #FFFFFF; font-size: 11px; text-decoration: underline;display:"); 
	   }

	}
</script>

<script type="text/javascript" src="<c:url value='/styles/default/js/jquery-1.3.2.min.js'/>"></script>
<script src="<c:url value='/styles/default/js/searchFromHeader.js'/>" type="text/javascript"></script>