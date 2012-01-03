<%@ include file="/common/taglib.jsp"%>
<div id="bc_navbar"> 
	<ul>

            <s:if test="nav='home'">
                <li class="bcn_home" style="background-color:#889295">
            </s:if>
            <s:else>
                <li class="bcn_home" style="background-color:#44494B">
            </s:else>
            <authz:authorize  ifNotGranted="ROLE_ADMIN,ROLE_EMPLOYER,ROLE_EMPLOYEE" >
			 <s:a href="${ctx}/public/landingpage.action">Home</s:a>
			</authz:authorize>
			
			<authz:authorize  ifAnyGranted="ROLE_ADMIN,ROLE_EMPLOYER,ROLE_EMPLOYEE" >
			 <s:a href="${ctx}/public/authenticatedUserLandingPage.action"><s:property value="nav"/> </s:a>
			</authz:authorize>
			</li>

            <s:if test="nav=='briefcase'">
                <li class="bcn_mybriefcase" style="background-color:#889295">
            </s:if>
            <s:else>
                <li class="bcn_mybriefcase" style="background-color:#44494B">
            </s:else>
  			<authz:authorize  ifAnyGranted="ROLE_ADMIN,ROLE_EMPLOYEE" >
			 <s:a href="${ctx}/employee/Briefcase.action">MyBriefcase</s:a></authz:authorize></li> 
			 
            <s:if test="nav=='briefcase'">
                <li class="bcn_mybriefcase" style="background-color:#889295">
            </s:if>
            <s:else>
                <li class="bcn_mybriefcase" style="background-color:#44494B">
            </s:else>			<authz:authorize  ifAnyGranted="ROLE_ADMIN,ROLE_EMPLOYER" >
			 <s:a href="${ctx}/employer/employerBriefcase.action">MyBriefcase</s:a></authz:authorize></li> 
			

             <s:if test="nav=='profile'">
                <li class="bcn_profiles" style="background-color:#889295">
            </s:if>
            <s:else>
                <li class="bcn_profiles" style="background-color:#44494B">
            </s:else>
  	       <authz:authorize  ifAnyGranted="ROLE_ADMIN,ROLE_EMPLOYEE">
	       <s:a href="${ctx}/employee/loadEmployeeProfilesList.action">MyProfiles</s:a></authz:authorize></li>
	       <li class="bcn_profiles">
	       <authz:authorize  ifAnyGranted="ROLE_ADMIN,ROLE_EMPLOYER">
	       <s:a href="${ctx}/employer/listopportunities.action">MyProfiles</s:a></authz:authorize></li>
	       
	       
	       
	       <li class="bcn_myinbox">
	       <authz:authorize  ifAnyGranted="ROLE_EMPLOYEE">
	       <s:a href="${ctx}/employee/myInbox.action">MyInbox</s:a></authz:authorize></li>
	       
	        <li class="bcn_myinbox">
	       <authz:authorize  ifAnyGranted="ROLE_EMPLOYER">
	       <s:a href="${ctx}/employer/employerInbox.action">MyInbox</s:a></authz:authorize></li>
	       
	       
	       <li class="bcn_myinbox">
	       <authz:authorize  ifAnyGranted="ROLE_EMPLOYEE">
	       <s:a href="${ctx}/forums/list.page" target="_blank">Forum</s:a></authz:authorize></li>

		   <li class="bcn_myinbox">
	       <authz:authorize  ifAnyGranted="ROLE_EMPLOYER">
	       <s:a href="${ctx}/forums/list.page">Forum</s:a></authz:authorize></li>

	       <li class="bcn_myOpportunities">
	       <authz:authorize  ifAnyGranted="ROLE_EMPLOYEE">
	       <s:a href="${ctx}/employee/myOpportunities.action">MyOpportunities</s:a></authz:authorize></li>

           <li class="bcn_myOpportunities">
	       <authz:authorize  ifAnyGranted="ROLE_EMPLOYER">
	       <s:a href="${ctx}/employer/loadAllEmployerOpprotunity.action">MyOpportunities</s:a></authz:authorize></li>
	       
	          <li class="bcn_myOpportunities">
	       <authz:authorize  ifAnyGranted="ROLE_EMPLOYEE">
	       <s:a href="${ctx}/employee/myOpportunities.action">MyOpportunities</s:a></authz:authorize></li>

	     
	       
	       
  </ul>
</div>
			