<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<div id="edit_opportunity">

<div id="bc_main_outer">
<div id="bc_main_mid">

<div class="bc_main_inner clear-both r_sel_prof">
<div id="outerlgb">
<div class="lgrey_box">
<div class="lgrey_box-r">
<div class="lgrey_box-b">
<div class="red_bar">
<div class="red_bar-l">
<div class="red_bar-r">
<h1>Opportunity in <s:property value="orgName" />, Inc</h1>
<h4 class="ta-left"><a href="#">(click to change)</a></h4>
</div>
</div>
</div>
<div class="lgrey_simple">
<div class="lgrey_simple-b">
<div class="lgrey_simple-l">
<div class="lgrey_simple-r">
<div class="lgrey_simple-tl">
<div class="lgrey_simple-tr">
<div class="lgrey_simple-bl">
<div class="lgrey_simple-content">
<form id="editOpportunityForm" class="opportunityForm"
	onsubmit="return false">
<div class="frow">
<h4>Job Name</h4>
<s:property value="opportunity.str_job_name" /></div>
<div class="frow">
<h4>Position Title</h4>
<s:property value="opportunity.title" /></div>

<div class="frow">
<div class="fcol">
<h4>Start Date</h4>
<s:property value="opportunity.createdDate" /></div>
<div class="fcol">
<h4>Location</h4>
<s:property value="opportunity.str_location" /></div>
<div class="fcol">
<h4>Type of Work</h4>

<s:property value="opportunity.str_type_of_work" />

</div>

<div class="fcol">
<h4>Education Requirements (Degree)</h4>
<s:property value="opportunity.str_education_requirment" /></div>
<div class="fcol">
<h4>Salary Range</h4>
<span style="font-size: 12px">
<s:property value="opportunity.str_salary_range" />
</span>
</div>
</div>
<div class="frow">
<div class="fcol">
<h4>Benefits</h4>
<s:property value="opportunity.str_benefits" /></div>

<div class="fcol" >
<h4>Job Type</h4>
<span style="font-size: 12px">
<s:property value="opportunity.str_job_type" />
</span>
</div>
<div class="fcol">
<h4>Working Hours</h4>
<s:property value="opportunity.workingHours" /></div>
</div>
<div class="frow">

<h4>Description</h4>
<s:property value="opportunity.description" /></div>
<div class="frow">
<div class="fcol">
<div class="frow">
<div class="fcol">
<div class="frow" id="opportunity_list">
	<s:iterator	value="opportunityskillsList">
	<div class="sel_prof_row" id="oppskillsdiv">
	<div class="sel_prof_col spc_skillname" id="skillnamediv"><s:property value="skillsNeeded" /></div>
	<div class="sel_prof_col spc_skilllevel" id="skillleveldiv"><s:property	value="level" /></div>
	<div class="sel_prof_col spc_jobtype" id="jobtypediv"><s:property value="jobType" /></div>
	<div class="sel_prof_col spc_numyears" id="numyearsdiv"><s:property value="noOfYears" /></div>
	</div>
	</s:iterator>
</div>
</div>
<div class="fcol">
<h4>Job Application Criteria</h4>
<s:property value="opportunity.str_job_application_criteria" /></div>


</div>
</div>
</div>

<div class="bcope_actions">
<div class="qlink apply_for_pos"><a href="#"
	onclick="return applyforjob_pop_up(event,'apply_job',['center',500,'absolute'])"> <img
	src="${ctx}/styles/default/images/mobc_applyforopp.png" alt="Apply" />Apply
for this position</a> <a href="#"
	onclick="return markasfavorite_pop_up(event,'mark_favorite',['center',500,'absolute'])">
<img src="${ctx}/styles/default/images/mobc_addtofav.png" alt="Apply" />Mark
as Favorite</a></div>
</div>
</form>

</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</div>
</div>


<!-- Added for display pop up message -->
<div id="mark_favorite" class="popup1">
<div class="popup1-content">
<div class="pu_row">
<form><s:hidden name="opportunityid" id="opportunityid" />
 <br>
 <s:select
	name="bookMarkedEmployee" headerKey="1" headerValue="Please Select"
	list="profiles" listKey="id" listValue="name" id="bookmarkedemployeeid">
</s:select>
<div class="submit_btn">
<a href="#" onclick="markAsFavoriteThisOpp('mark_favorite')">
<img src="${ctx}/styles/default/images/grn_save_btn-up.png" alt="apply"/>
</a>
</div>
<div class="ftos">Mark this opportunity as favorite.</div>
</form>

<a class="close_link" href="#"
	onclick="return markasfav_hide_pop_up('mark_favorite')">Close</a></div>

</div>
</div>

<br />

<div id="apply_job" class="popup1">
<div class="popup1-content">
<div class="pu_row">
<form><s:hidden name="opportunityid" id="opportunityid" />
<br>
 <s:select
	name="interestedEmployee" headerKey="1" headerValue="Please Select"
	list="profiles" listKey="id" listValue="name" id="interestedEmployeeid">
</s:select>
<div class="submit_btn">
	<a href="#" onclick="applyforopportunity('apply_job')">
	<img src="${ctx}/styles/default/images/grn_save_btn-up.png" alt="apply"/>
	</a>
	</div>
<div class="ftos">Apply for the Opportunity.</div>
</form>

<a class="close_link" href="#" onclick="return applyjob_hide_pop_up('apply_job')">Close</a>
</div>

</div>
</div>


<script src="<c:url value='/styles/default/js/applyforjob_popup.js'/>" type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/markasfavorite.js'/>" type="text/javascript"></script>

