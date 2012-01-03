<%@ include file="/common/taglib.jsp"%>

<div id="bc_main_outer">
<div id="create_opportunity">
<div id="bc_main_outer">
	<div id="bc_main_mid">
   <div class="outer_page_nav"  style="height:584px;">
  
   <ul>
		  


<div class="bc_main_inner clear-both">
 
 <div class="opportunityTitle">

	<b><s:property value="opportunity.title"/></b>
 </div>
 
 <div class="opportunitySpecifics">
	<b>Date Posted</b>: <s:property value="opportunity.createdDate"/><br/>
	<b>Position Title</b>: <s:property value="opportunity.title"/><br/>
	<b>Job Type</b>: <s:property value="opportunity.str_job_type"/><br/>

	<b>Job Location</b>: <s:property value="employer.city"/><br/>
	
 </div>
  <div class="opportunitySpecifics">
	<b>Education Required</b>: <s:property value="opportunity.str_education_requirment"/> <br/>
	<b>Salary Range</b>: <s:property value="opportunity.str_salary_range"/><br/>
	<b>Start Date</b>: 6/1/2010<br/>

	<b></b> <br/>
 </div>
 
 <div class="opportunityMain">
 <div class="opportunityButtons"><!--
 	 <img src="${ctx}/styles/default/images/button_applynow_large.png" ></img><br/><br/>
	 
	 --><!--<a class="apply_for_pos1" href="#"
							onclick="return applyforjob_pop_up(event,<s:property value='opportunity.id'/>,'apply_job',['center',500,'absolute'])">
						 <img src="${ctx}/styles/default/images/button_applynow_large.png" ></a>
	 
	  <a class="mark_as_fav1" href="#"
							onclick="return markasfavorite_pop_up(event,<s:property value='opportunity.id'/>,'mark_favorite',['center',500,'absolute'])">
							 <img src="${ctx}/styles/default/images/button_savetofavorites.png"></a>
	 
	 
	 
 --></div>
 <div class="opportunityDivider"></div>

 <div class="opportunityDetails">
	<b>DESCRIPTION AND RESPONSIBILITIES</B><br/>
    <s:property value="opportunity.description"/>
	<br/><br/>
	<b>SKILLS NEEDED</B><br/>
	<p><s:iterator value="opportunityskillsList">
								<s:property	value="skillsNeeded" />
						    	<s:property	value="level" />
								<s:property	value="jobType" />,<s:property value="noOfYears" />
							</s:iterator></p>
	<br/><br/>
	<b>APPLICATION CRITERIA</B><br/>
	<s:property value="opportunity.str_job_application_criteria"/>
	<br/><br/>
	<b>BENEFITS</B><br/>
	<s:property value="opportunity.str_benefits"/>
	<br/><br/>
	


	
 
 </div>
 </div>
 