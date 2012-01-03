<%@ include file="/common/taglib.jsp"%>

<div id="bc_main_outer">
<div id="create_opportunity">
<div id="bc_main_outer">
	<div id="bc_main_mid">
   <div class="outer_page_nav">

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
	 
	 --><a class="apply_for_pos1" href="#"
							onclick="return applyforjob_pop_up(event,<s:property value='opportunity.id'/>,'apply_job',['center',500,'absolute'])">
						 <img src="${ctx}/styles/default/images/button_applynow_large.png" ></a>
	 
	  <a class="mark_as_fav1" href="#"
							onclick="return markasfavorite_pop_up(event,<s:property value='opportunity.id'/>,'mark_favorite',['center',500,'absolute'])">
							 <img src="${ctx}/styles/default/images/button_savetofavorites.png"></a>
	 
	 
	 
 </div>
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
 
 
 
 </div>
 					</div>
					<br style="clear: both;">

				</div>
			</div>
	</div>
<!--#include file="mobc_footer.html"-->

	<!-- Added for display pop up message -->
	<div id="mark_favorite" class="popup1">
	<div class="popup1-content">
	<div class="pu_row">
		<form>
		    <div id="profilesDivForMarkasFavorite">
			<h5>Select one profile from drop down list</h5>
			<h5><span style="display:none" id="selectProfile_mark_favorite">
            	<font color="red">Please select profile</font>
            </span></h5>
			<s:select name="bookMarkedEmployee" headerKey=""
				headerValue="Please Select" list="profiles" listKey="id"
				listValue="name" id="bookmarkedemployeeid" onchange="chkSeletedProfile();">
			</s:select>
			</div>
			<h5><span id="markAsFavorite"><a href="#"
				onclick="markAsFavoriteThisOpp('mark_favorite')">Apply</a>|<a
				href="#" onclick="return markasfav_hide_pop_up('mark_favorite')" >Close</a>
			</span></h5>
			<h5><span style="display:none" id="favorite_progress">
            	<img src="${ctx}/styles/default/images/pleasewait.gif"/>
            </span></h5>
           <h5> <span style="display:none" id="favorite_success">
            	Marked the opportunity as your favorite. <a href="#"  onclick="return markasfav_hide_pop_up('mark_favorite')">Close</a>
            </span></h5>
            <h5><span style="display:none" id="favorite_failure">
            	Sorry, unable to mark the opportunity as your favorite. <a href="#"  onclick="return markasfav_hide_pop_up('mark_favorite')">Close</a>
            </span></h5>		
		</form>
  </div>
 </div>
</div>
	<br/>
	<div id="apply_job" class="popup1">
	<div class="popup1-content">
	<div class="pu_row">
	<form>
		 <div id="profilesDiv">
		<h5>Select one profile from drop down list</h5>
		<h5><span style="display:none" id="selectProfile_apply_job">
            	<font color="red">Please select profile</font>
            </span></h5>
		<s:select name="interestedEmployee" headerKey=""
			headerValue="Please Select" list="profiles" listKey="id"
			listValue="name" id="interestedEmployeeid" onchange="chkSelectedList();">
		</s:select>
		</div>
			<h5><span id="applyforopportunity">
				<a href="#"
			onclick="applyforopportunity('apply_job')">Apply</a>|<a href="#"
			onclick="return applyjob_hide_pop_up('apply_job')">Close</a>
		     </span></h5>
			<h5> <span style="display:none" id="progress">
		       	<img src="${ctx}/styles/default/images/pleasewait.gif"/>
            </span></h5>
           <h5> <span style="display:none" id="success">
            	Your application has been sent successfully. <a href="#"  onclick="return applyjob_hide_pop_up('apply_job')">Close</a>
            </span></h5>
           <h5><span style="display:none" id="failure">
            	Sorry, unable to send your application successfully. <a href="#"  onclick="return applyjob_hide_pop_up('apply_job')">Close</a>
            </span>	</h5>
	
	</form>
	
	</div>
	</div>
	</div>

</div>

<br />
	
	
	
<script src="<c:url value='/styles/default/js/applyforjob_popup.js'/>" 	type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/markasfavorite.js'/>" 	type="text/javascript"></script>
	
	

