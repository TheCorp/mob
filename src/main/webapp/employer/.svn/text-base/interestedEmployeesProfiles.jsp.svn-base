<%@ include file="/common/taglib.jsp"%>
<div id="select_profile_to_edit">
<div id="bc_main_outer">
<div id="bc_main_mid">
		<div class="bc_main_inner clear-both">
			<div id="outerlgb"><div class="lgrey_box"><div class="lgrey_box-r"><div class="lgrey_box-b">
				<div class="red_bar">
				
					<h1>Interested Employees Profiles of <s:property value="employer.organizationName"/>'s <s:property value="opportunity.str_job_name"/> opportunity</h1>
				</div>
				<div class="lgrey_simple select_profile"><div class="lgrey_simple-b"><div class="lgrey_simple-l"><div class="lgrey_simple-r"><div class="lgrey_simple-tl"><div class="lgrey_simple-tr"><div class="lgrey_simple-bl"><div class="lgrey_simple-content">
				  <s:if test="listOfInterestedEmployees.size!=0">
				<h2>Profiles</h2>
		    <s:iterator value="listOfInterestedEmployees">
			<div class="sel_prof_row">
				<s:url id="view" action="viewingInterestedEmployeeProfile">
				<s:param name="interestedEmployeeProfile.id" value="id"/>
				</s:url>
			 <div class="sel_prof_col spc_name">
			 <s:a href="%{view}"><s:property value="name" /></s:a>
			 </div>
		
			<div class="sel_prof_col spc_views"><s:property value="viewCount"/> Profile Views</div>
			<div class="sel_prof_col spc_items"><s:property value="itemcount"/> Items in Briefcase</div>
			<div class="sel_prof_col spc_messages">0 Messages</div>
			<div class="sel_prof_col spc_notes">My personal account for	consulting.</div>
			</div>
	        </s:iterator>
	        </s:if>
	         <s:if test="listOfInterestedEmployees.size==0">No Profiles Found</s:if>
					
			</div></div></div></div></div></div></div></div>
		</div></div></div></div>
	</div>
		</div>
</div>
</div>

