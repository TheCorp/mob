<%@ include file="/common/taglib.jsp" %>

<div id="bc_navbar">
    <ul>
    	<authz:authorize  ifNotGranted="ROLE_ADMIN,ROLE_EMPLOYER,ROLE_EMPLOYEE" >
            <li class="bcn_home" style="background-color:#889295">
                <a href="${ctx}/public/signup.action">Home</a>
            </li>
            <li class="bcn_mybriefcase" style="background-color:#44494B">
                <a href="${ctx}/public/signup.action">MyBriefcase</a>
            </li>
            <li class="bcn_profiles" style="background-color:#44494B">
                <a href="${ctx}/public/signup.action">MyProfiles</a>
            </li>
            <li class="bcn_myinbox"  style="background-color:#44494B">
                <a href="${ctx}/public/signup.action">MyInbox</a>
            </li>
            <li class="bcn_myinbox"  style="background-color:#44494B">
                <a href="${ctx}/public/signup.action">Forum</a>
            </li>
            <li class="bcn_myOpportunities"  style="background-color:#44494B">
                <a href="${ctx}/public/signup.action">MyOpportunities</a>
            </li>
            
            <li class="bcn_myOpportunities"  style="background-color:#44494B">
                <a href="${ctx}/public/signup.action">MyGroups</a>
            </li>
        </authz:authorize>   
        <authz:authorize  ifAnyGranted="ROLE_ADMIN" >
            <li class="bcn_home" style="background-color:#889295">
        		 <a href="${ctx}/public/authenticatedUserLandingPage.action">Home</a>
            </li>
        </authz:authorize>
        <authz:authorize ifAnyGranted="ROLE_EMPLOYEE">
            <li class="bcn_home" style="background-color:#889295">
                <a href="${ctx}/public/authenticatedUserLandingPage.action">Home</a>
            </li>
            <li class="bcn_mybriefcase" style="background-color:#44494B">
                 <a href="${ctx}/employee/Briefcase.action">MyBriefcase</a>
            </li>
            <li class="bcn_profiles" style="background-color:#44494B">
                <a href="${ctx}/employee/loadEmployeeProfilesList.action">MyProfiles</a>
            </li>
            <li class="bcn_myinbox"  style="background-color:#44494B">
                <a href="${ctx}/employee/myInbox.action">MyInbox</a>
            </li>
            <li class="bcn_myinbox"  style="background-color:#44494B">
                <a href="${ctx}/forums/list.page" target="_blank">Forum</a>
            </li>
            <li class="bcn_myOpportunities"  style="background-color:#44494B">
                <a href="${ctx}/employee/myOpportunities.action">MyOpportunities</a>
            </li>
            
             <li class="bcn_myOpportunities"  style="background-color:#44494B">
                <a href="${ctx}/employee/myGroup.action">MyGroups</a>
            </li>
        </authz:authorize>
        <authz:authorize ifAnyGranted="ROLE_EMPLOYER">
            <li class="bcn_home" style="background-color:#889295">
               <a href="${ctx}/public/authenticatedUserLandingPage.action">Home</a>
            </li>
            <li class="bcn_mybriefcase" style="background-color:#44494B">
                <a href="${ctx}/employer/employerBriefcase.action">MyBriefcase</a>
            </li>
            <li class="bcn_profiles" style="background-color:#44494B">
                <a href="${ctx}/employer/listopportunities.action">MyProfiles</a>
            </li>
            <li class="bcn_myinbox"  style="background-color:#44494B">
                <a href="${ctx}/employer/employerInbox.action">MyInbox</a>
            </li>
            <li class="bcn_myinbox"  style="background-color:#44494B">
                <a href="${ctx}/forums/list.page">Forum</a>
            </li>
            <li class="bcn_myOpportunities"  style="background-color:#44494B">
                <a href="${ctx}/employer/loadAllEmployerOpprotunity.action">MyOpportunities</a>
            </li>
             <li class="bcn_myOpportunities"  style="background-color:#44494B">
                <a href="${ctx}/employer/myGroup.action">MyGroups</a>
            </li>
        </authz:authorize>
       
      
    </ul>
</div>
