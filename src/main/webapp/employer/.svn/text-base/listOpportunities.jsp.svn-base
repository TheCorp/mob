<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<div id="edit_opportunities">


<div id="bc_main_outer">
	<div id="bc_main_mid">
	 <s:hidden key="id" name="profile.id"/>
	<s:hidden key="id" name="user.id"/>
		<div class="bc_main_inner clear-both r_sel_prof">
			<div id="outerlgb"><div class="lgrey_box"><div class="lgrey_box-r"><div class="lgrey_box-b">
				<div class="red_bar"><div class="red_bar-l"><div class="red_bar-r">
					<h1>Edit Opportunities from <s:property value="user.organizationName"/>, Inc</h1> <h4 class="ta-left"><a href="#"></a></h4>
				</div></div></div>
				<div class="lgrey_simple select_profile"><div class="lgrey_simple-b"><div class="lgrey_simple-l"><div class="lgrey_simple-r"><div class="lgrey_simple-tl"><div class="lgrey_simple-tr"><div class="lgrey_simple-bl"><div class="lgrey_simple-content">
					<h2>Current Opportunities</h2>

					<div class="sel_prof_headers">
						<div class="sel_prof_col spc_jname"><h3>Job Name</h3></div>
						<div class="sel_prof_col spc_ptitle"><h3>Position Title</h3></div>
						<div class="sel_prof_col spc_empinted"><h3>Employees Interested</h3></div>
						<div class="sel_prof_col spc_empbooked"><h3>Bookmarked Employees</h3></div>
						<div class="sel_prof_col spc_empall"><h3>All Employees</h3></div>
						
					</div>
					
					  <s:iterator value="opportunityList">
					  <div class="sel_prof_row">
						<div class="sel_prof_col spc_jname"><s:property value="str_job_name" /></div>
						<div class="sel_prof_col spc_ptitle"><s:property value="title" /></div>
						<div class="sel_prof_col spc_empinted">
						<s:url id="viewInterestedEmployeeProfiles" action="viewInterestedEmployeeProfiles">
						<s:param name="opportunity.id" value="id"></s:param>
						</s:url>
						<s:property value="interestCount" />(<s:a href="%{viewInterestedEmployeeProfiles}">View All</s:a>)</div>
						<div class="sel_prof_col spc_empbooked">
						<s:url id="bookMarkedEmployeeProfiles" action="bookMarkedEmployeeProfiles">
						<s:param name="opportunity.id" value="id"></s:param>
						</s:url>
						<s:property value="bookMarkCount" /> (<s:a href="%{bookMarkedEmployeeProfiles}">View All</s:a>)</div>
						<div class="sel_prof_col spc_empall">
						<s:url id="allEmployeeProfiles" action="allEmployeeProfilesViewedOpportunity">
						<s:param name="opportunity.id" value="id"></s:param>
						</s:url>
						<s:property value="viewOppCount" />(<s:a href="">View All</s:a>)</div>
						<div class="sel_prof_col spc_actions">
						
						<s:url id="editOpportunity" action="loadEmployerOpprotunity">
						<s:param name="profile.id" value="%{profile.id}"  />
						<s:param name="opportunity.id" value="id"  />
						</s:url>
						<s:a href="%{editOpportunity}">
					  	<img src="${ctx}/styles/default/images/exp_entry-edit.gif" alt="Edit" /></s:a>	
						&nbsp;&nbsp;
						<s:url id="deleteOpportunity" action="deleteEmployeerOpportunity">
							<s:param name="profile.id" value="%{profile.id}"  />
							<s:param name="opportunity.id" value="id"  />	
							</s:url>
						<s:a href="%{deleteOpportunity}">
						<img src="${ctx}/styles/default/images/mobc_redx.gif" alt="Remove" />
						</s:a>
						</div>
					
					</div>
					</s:iterator>
					<div id="add_profile">
					<s:url id="addAnotherOpportunity" action="employerOpportunity">
					<s:param name="profile.id" value="%{profile.id}"/>
					</s:url>
					<s:a href="%{addAnotherOpportunity}"><img src="${ctx}/styles/default/images/add_another_opportunity.png" alt="Add another opportunity" /></s:a>
					</div>
					<div id="save_profile_changes">
					<!-- 
						<a href=""><img src="${ctx}/styles/default/images/save_profile_changes.png" alt="Save" /></a>
					 -->	
					</div>
				</div></div></div></div></div></div></div></div>

			</div></div></div></div>
		</div>
	</div>
</div>


				


<br/>
