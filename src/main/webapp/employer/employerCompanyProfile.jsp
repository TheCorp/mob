<%@ include file="/common/taglib.jsp"%>

<%@ taglib uri="/MOB" prefix="mob"%>

<div id="bc_main_outer">
		<div id="bc_main_mid">
			<div id="bc_profile_outernav">

	   			<div class="outer_page_nav">
					<ul>
						 <li class="active">
			         <a href="${ctx}/employer/listopportunities.action">Company Profile</a>
			         <li>
			   			
			   			
			   			<li class="align-right help">
							<mob:flag key="1" src="../styles/default/images/icon_help.png">
                             </mob:flag>
						</li>
						<!--
			   				<div class="outer_page_nav">
			   			
							<li class="align-right help">

								<span style="padding:5px"><img src = "${ctx}/styles/default/images/icon_flag.png"></img></span>
							</li>
							
							--><!--<li class="align-right">
							    <a href="/WebApp_ID/employee/privacy.action?profile.id=128">
									Privacy Settings
								</a>
							</li>
							       
							--><li class="align-right">
							  <a href="${ctx}/search/listOfEmployeeFeedbacksFromSearch.action?profile.id=<s:property value="employer.id"/>">

									Profile Feedback
									<em class="pos">
										<span id="positiveid"></span>
									</em>
								</a>
							</li>
					</ul>
				</div>
			</div>

			<div class="bc_main_inner clear-both">
				<div id="bc_Empr_profile_sec">
					<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
						<div>
							<div id="bc_Empr_profile_pic_spot">
								<div class="bc_pps_pic">
									<div id="bc_profile_pic"> 
								    <s:if test="user.picture!=null">
								    
							   <a rel="ibox" href='<s:property value="image"/>'>
		                     <img src='<s:property value="resizedMidImage_employerProfile"/>' alt="N/A" align="top"/>
		                         </a><!--
								 <img align="top" src="<s:property value="resizedMidImage_employerProfile"/>" alt="N/A"/>
								 --></s:if>
								 <s:else>
								<img src="${ctx}/styles/default/images/mobc-default-profile-image.jpg" alt="N/A"/>
							</s:else>
									</div>
								</div>
							</div><!--
							<img class="addAsFriendButton" src="${ctx}/styles/default/images/employerProfileImages/button_addtocontacts.png">
							--><div id="bc_Empr_profile_info">
								<h2 id="bc_profile_name"><s:property value="employer.emplrOrgName"/></h2>
								<div class="bc_pi_details">

									<div class="bc_pi_d_line"><h3>Industry:</h3><h4><s:property value="employer.industry.name" /></h4></div>
									<div class="bc_pi_d_line"><h3>Location:</h3><h4><s:property value="employer.city" /></h4></div>
									<div class="bc_pi_d_line"><h3>Email:</h3><h4><s:property value="employer.email" /></h4></div>
									<div class="bc_pi_d_line"><h3>Phone:</h3><h4><s:property value="employer.phoneNumber"/></h4></div>
									<div class="bc_pi_d_line"><h3>Website:</h3><h4><s:property value="employer.website"/></h4></div>

								</div>
							</div>
						</div>
						<br class="clear-both">
						<div class="bc_statement">
							<div id="bc_personal_statement">Mission Statement</div>
							<p><s:property value="employer.missionstatement" /></p>
						</div>
					</div></div></div></div></div>
				</div>
				<span class="clear-both"></span><span class="clear-both"></span>
				<div id="bc_employer_info">
					<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
						<div class="bc_greytbar">
	      					<h3 class="bc_gtb_title">Employer Details</h3>

	     				</div>
	     				<div class="employer_info_tabs">
	     					<div class="employer_info_tab selected"  onclick="showAboutUs();" style="cursor: default;" id="aboutId">ABOUT US</div>
	     					<div class="employer_info_tab " onclick="showWorkCulture();" style="cursor: default;" id="workCulId">WORK CULTURE</div>
	     					<div class="employer_info_tab" onclick="showWhyWorkHere();" style="cursor: default;" id="whyWorkId">WHY WORK HERE</div>
	     				</div>
	     				<div class="scroll_box">

		     				<div class="scroll_content">
		     					<div class="bc_scroll_section" id="aboutUsID">
		      						<s:property value="employer.emplrorganizationInfo" />
		      					</div>
		     					<div class="bc_scroll_section" id="workCultureId" style="display: none;">
		      						<s:property value="employer.emplrorganizationCulture" />
		      					</div>

		      					<div class="bc_scroll_section" id="whyWorkHereId" style="display: none;">
		      						<s:property value="employer.whyChooseUs" />
		      					</div>
	      					</div>
							<br class="clear-both">
						</div>
					</div></div></div></div></div>
				</div>
				
				<br class="clear-both">
	   			<div id="bc_opportunities_box">

					<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
						<div class="bc_greytbar">
							<div id="bc_viewall-briefcase" class="bc_gtb_viewall">
								 <a href="${ctx}/employer/employerOpportunity.action">Add Opportunity | </a>
								  <a href="${ctx}/employer/loadAllEmployerOpprotunity.action">View All</a>
	      					</div>
	      					<h3 class="bc_gtb_title">Opportunities (<s:property value="opportunityDetailsList.size"/>)</h3>
	     				</div>
	     				<div class="scroll_box">

		     				<div class="scroll_content">
		     					<div class="bc_scroll_section">
			      					<table width="100%" cellspacing="0" cellpadding="5">
										<tbody>
											<s:if test="opportunityDetailsList.size!=0" >
												<tr class="sec_heading">
													<td width="20px"></td>
													<td>Job Title</td>
													<td>Job Type</td>
													<td>Apply</td>
												</tr>
											</s:if>
											<s:iterator value="opportunityDetailsList" status="rowstatus">
											
											<tr class="<s:if test="#rowstatus.odd == true">odd</s:if><s:else>even</s:else>">
												<td>
												<s:if test="rowstatus.odd==true">
												 <img src="${ctx}/styles/default/images/employerProfileImages/star_idle.png">
												</s:if>
												<s:else>
												<img src="${ctx}/styles/default/images/employerProfileImages/star_favorited.png">
												</s:else>
												</td>
												
	
												<td> <a href="${ctx}/employer/viewEmployerOwnOpportunities.action?Opportunityid=<s:property value="opportunity.id"/>"><s:property value="title"/></a></td>
												<td><s:property value="str_job_type"/></td>
												<td><img src="${ctx}/styles/default/images/employerProfileImages/button_applynow_small.png"></td>

											</tr>
											</s:iterator>
											
										</tbody>

									</table>
		      					</div>
								<br class="clear-both">
							</div>
						</div>
					</div></div></div></div></div>
				</div>
	   			<div id="bc_briefcase">
	    			<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">

	     				<div class="bc_greytbar">
	      					<div id="bc_viewall-briefcase" class="bc_gtb_viewall">
								<!--<a href="/beta/employee/Briefcase.action?profile.id=4">View All</a>-->
								<a href="${ctx}/employer/employerBriefcase.action">View All</a>
	      					</div>
	      					<h3 class="bc_gtb_title"><span id="bc_person_fname-brief"><s:property value="profile.name"/></span>'s Briefcase </h3>

	     				</div>
	     				<div id="bc_bc_contents">
							
							<s:set name="id" value="itemsList" scope="request"/>
    
        <display:table name="${id}" id="id" class="bc_bc_table" cellspacing="0"
                       pagesize="5" sort="list" defaultsort="1" requestURI=""
                       decorator="com.mob.util.EmployerBriefCaseItems">
                       
            <display:column title="Type" scope="col" property="image"></display:column>
            <display:column property="name" title="Title" class="bc_tbl_shad"></display:column>            
            <display:column property="createdDate" title="Added"></display:column>
            <display:column property="modifiedDate" title="Last Viewed" class="bc_tbl_shad"></display:column>           
            <display:setProperty name="paging.banner.placement" value="bottom"/>

            <display:setProperty name="paging.banner.some_items_found" value=""/>


            <display:setProperty name="paging.banner.first" value="<div class=bc_items_List_pagination>
																			Previous {0}
																			<a href={3}>Next</a>
																			</div>">
            </display:setProperty>


            <display:setProperty name="paging.banner.full" value="<div class=bc_items_List_pagination>
																			<a href={2}>Previous</a>
																			{0} <a href={3}>Next</a>
																			</div>">
            </display:setProperty>

            <display:setProperty name="paging.banner.last" value="<div class=bc_items_List_pagination>
																			
																			<a href={2}>Previous</a>
																			{0} Next
																			</div>">
            </display:setProperty>


        </display:table>
	        				<span class="clear-both"></span>
	    				</div>
	    			</div></div></div></div></div>
					<br class="clear-both">

	  			</div>
	  			<br class="clear-both">
	 		</div>
		</div>
		
<!-- added for add new skill popup-->
<div id="addSkills" class="popup1">
</div>
<!-- added for add new category popup-->
<div id="addCatogories" class="popup1">
</div>
<!-- added for add new industry popup-->
<div id="confirm_delete1" class="popup1">
<div class="popup1-content">
	<div class="pu_row">
		<div class="pu_col right">
	        <span id="industryDetails">
	        	<span style="display:none;margin-top: 30px;color: red" id="industryNameId">
	         		<h5>Please Enter Industry</h5>
	         	</span>
				<h4>Industry Name:<input type="text" name="addIndustry" id="addIndustry"/></h4><br/><br/>
				<a href="#" onclick="return hide_pop_up_Industry()">
				<img src="${ctx}/styles/default/images/grn_no_btn-up.png" alt="No" /></a>
		 		<a class="second_a"  href="#" onclick="addAnotherIndustry()">
				<img src="${ctx}/styles/default/images/grn_yes_btn-up.png" alt="Yes"/></a>
			</span>
			<span style="display:none" id="progress">
				<img src="${ctx}/styles/default/images/pleasewait.gif"/>
			</span>
			<span style="display:none" id="success">
			  	<h6>Industry added successfully.<a href="#" onclick="return hide_pop_up_Industry()">Close</a></h6>
			</span>
			<span style="display:none" id="failure">
				Sorry, unable to add the Industry. <a href="#" onclick="return hide_pop_up_Industry()">
			    <img src="${ctx}/styles/default/images/grn_no_btn-up.png" alt="No" /></a>
			</span>    
		</div>
	</div>
</div>
</div>

		
		
		<script src="<c:url value='/styles/default/js/ibox.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/styles/default/js/contactInformation.js'/>" type="text/javascript"></script>
	</div>
	<br class="clear-both">

	
<script type="text/javascript" src="<c:url value='/styles/default/js/viewEmployerOpportunities.js'/>"></script>   
