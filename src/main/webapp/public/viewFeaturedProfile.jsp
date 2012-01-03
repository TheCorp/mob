<%@ include file="/common/taglib.jsp"%>
<%@ taglib uri="/MOB" prefix="mob"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<style>
.closetxt
{
  margin-bottom:50px;
}
</style>

<div id="bc_main_outer">
 <div id="bc_main_mid" style="padding: 0 0 50px 0">
   <div id="bc_profile_outernav">
	   <div class="outer_page_nav">
		   <ul>
				   <li class="active">
				   <a href="${ctx}/public/viewFeaturedProfile.action?employeeProfileId=<s:property value="employeeProfileId"/>">View Profile</a>               
		           </li>
		            <!--<li>
			            <authz:authorize  ifNotGranted="ROLE_ADMIN,ROLE_EMPLOYER,ROLE_EMPLOYEE" >
			               <a href="${ctx}/public/signup.action">View Profile Details</a>
			            </authz:authorize>
			            <authz:authorize  ifAnyGranted="ROLE_ADMIN,ROLE_EMPLOYER,ROLE_EMPLOYEE" >
			               <a href="#" >View Profile Details</a>
			            </authz:authorize>   
		            </li>-->
		            <li class="align-right">
			            <authz:authorize  ifNotGranted="ROLE_ADMIN,ROLE_EMPLOYER,ROLE_EMPLOYEE" >
			               <a href="${ctx}/public/signup.action">Profile Feedback<em class="pos"></em></a>	
			            </authz:authorize>
			            <authz:authorize  ifAnyGranted="ROLE_ADMIN,ROLE_EMPLOYER,ROLE_EMPLOYEE" >
			                 <a href="#">Profile Feedback<em class="pos"></em></a>                   
						</authz:authorize>
		            </li>
		       </ul>
	     </div>
    </div>
    <div class="bc_main_inner clear-both">
	   <!-- start left div -->
	   <div class="bc_main_left">
	   
		   <div id="bc_profile_sec_VP">
		    <div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content_VP">
			    <div class="profile_info_left">
				     <div id="bc_profile_pic_spot_VP">
					      <div class="bc_pps_pic_VP">
						       <div id="bc_profile_pic">
						       <s:if test="employeeProfile.picture!=null">
						       <a rel="ibox" href='<s:property value="image"/>'>
							       <img src='<s:property value="resizedMidPicture"/>' alt="N/A" align="top"/>
						       </a>
						       </s:if>
						       <s:else>
						       <img src="${ctx}/styles/default/images/mobc-default-profile-image.jpg" alt=""  align="top" width="135" height="150"/>
						       </s:else>
						       </div>
					       </div>
			   			   <div class="bc_pi_details" style="margin:0px;padding-top: 10px;">
					                <h2 id="bc_profile_name_VP">Physical Traits</h2>
					                <div class="bc_pi_d_line">Height: <s:property value="heightFt"/>ft <s:property value="heightIn"/>in</div>
					                <div class="bc_pi_d_line">Weight: <s:property value="physicalTraits.weight"/>lbs</div>
					                <div class="bc_pi_d_line">Build: <s:property value="physicalTraits.build"/></div>
					                <div class="bc_pi_d_line">Measurements: <s:property value="measurements"/></div>
					
					                <div class="bc_pi_d_line">Shoe Size: <s:property value="physicalTraits.shoesize"/></div>
					                <div class="bc_pi_d_line">Hair Color: <s:property value="physicalTraits.haircolor"/></div>
					                <div class="bc_pi_d_line">Eye Color: <s:property value="physicalTraits.eyecolor"/></div>
					                <div class="bc_pi_d_line">Ethnicity: <s:property value="physicalTraits.ethnicity"/></div>
					       </div>
				     </div>
			    </div> <!-- end left -->
				<div class="profile_info_right">
			    	<div id="bc_profile_info_VP">
						<h2 id="bc_profile_name_VP"><s:property value="employee.firstName"/> <s:property  value="employee.lastName"/></h2>
						<div class="bc_pi_details">
							<div class="bc_pi_d_line"><h3>Industry:</h3><h4><s:property value="employeeProfile.industry.name"/></h4></div>
							<div class="bc_pi_d_line"><h3>Birthday:</h3><h4><s:date name="employee.dob" format="MM/dd/yyyy"/></h4></div>
							<div class="bc_pi_d_line"><h3>Location:</h3><h4><s:property value="employee.city"/></h4></div>
							<div class="bc_pi_d_line"><h3>Email:</h3><h4><s:property value="employee.email"/></h4></div>
							<div class="bc_pi_d_line"><h3>Phone:</h3><h4><s:property value="employee.phoneNumber"/></h4></div>
						</div>
					</div>
					<br class="clear-both">
					<div class="bc_statement">
						<div id="bc_personal_statement">Personal Statement</div>
						<p><s:property value="employeeProfile.personalStatement"/></p>
					</div>
				</div>
				<div class="clear-both"></div>
			</div></div></div></div></div>
		</div>
	
		<br class="clear-both">
		<div id="bc_contacts">
	        <div class="bc_light_box">
	            <div class="bc_lb-tr">
	                <div class="bc_lb-bl">
	                    <div class="bc_lb-br">
	                        <div class="bc_lb-content_VP">
		                            <div class="bc_greytbar">
		                                <!--<s:url id="viewContacts" action="viewBriefcaseContacts">
		                                    <s:param name="employee.id" value="employee.id"/>
		                                </s:url>
		                               -->
		                               <div id="bc_viewall-contacts" class="bc_gtb_viewall">
			                               <!--
			                                <s:a href="%{viewContacts}">View All</s:a>                          
			                              
			                              -->
			                              <authz:authorize  ifNotGranted="ROLE_ADMIN,ROLE_EMPLOYER,ROLE_EMPLOYEE" >
			                               	<a href="${ctx}/public/signup.action">View All</a>
							              </authz:authorize>
							              <authz:authorize  ifAnyGranted="ROLE_ADMIN,ROLE_EMPLOYER,ROLE_EMPLOYEE" >
			                              	<a href="#">View All</a>                           
			                              </authz:authorize>   
		                              </div>
		                                <h3 class="bc_gtb_title"><span id="bc_person_fname-cont"><s:property
		                                        value="employeeProfile.name"/></span>'s Contacts (<span
		                                        id="bc_num_person_conts"><s:property
		                                        value="employeeProfile.noOfContacts"/></span>)</h3>
		                            </div>
		                            <div class="bc_prof_thumbs">
		                                <div class="bc_pt_arrow">
		                                    <div class="bc_pt_arr_vm"></div>
		                                </div>
		                                <ul>
		                                    <s:iterator value="contacts">
		                                        <li class="active">
		                                        <a href="#">
		                                            <div class="bc_pt_thumb">
		                                                <!--<div class="bc_info_btn"></div>-->
		                                                <s:if test="contactOwner.picture!=null">
															 <img src="<s:property value="contactOwner.resizedMinPicture"/>" alt=<s:property value="nickName"/>/>
														</s:if>
		                                                <s:else>
		                                                    <img src="${ctx}/styles/default/images/mobc_placeholder_thumb.jpg"
		                                                         width="50" height="50" alt="N/A"/>
		                                                </s:else>
		                                            </div>
		                                            <h5><s:property value="nickName"/></h5></a></li>
		                                    </s:iterator>
		                                </ul>
		                            </div><br><br>
		                            <div id="bcc_info_tab" class="clear-both" style="display:none">
		                                <div class="bc_grey_info_tab">
		                                    <div class="bc_git-tr">
		                                        <div class="bc_git-br">
		                                            <div class="bc_git-content">
		                                                <div id="bcc_info_tab1"></div>
		                                                <div id="bcc_info_tab1_employer"></div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                            <span class="clear-both"></span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
    
    </div><!-- end left div -->
		
   <!-- start right div -->
   <div class="bc_main_right">
    
    <div id="bc_edu_work_skill">
					<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content_VP">
						<div class="bc_greytbar">
	      					<h3 class="bc_gtb_title">Work Experience / Education / Skills</h3>
	     				</div>

     					<div class="bc_section">
      						<div class="sec_title">Work Experience</div>
      						<s:if test="workExperienceList.size!=0">
	      					<table width="463" cellspacing="0" cellpadding="5">
								<tbody>
									<tr class="sec_heading">
										<td>Company</td>
										<td>Position</td>

										<td>Tenure</td>
									</tr>
									<s:iterator value="workExperienceList" status="rowstatus">
								
									<tr class="<s:if test="#rowstatus.odd== true">odd</s:if><s:else>even</s:else>" >
										<td><s:property value="employerName"/></td>
										<td><s:property value="description"/></td>
										<td><s:date name="workStart" format="MMM yyyy"/>- <s:date name="workEnd" format="MMM yyyy"/></td>
										
									</tr>
									
								</s:iterator>
									
								</tbody>
							</table>
							</s:if>
							<s:else>
							<span class="noItems">&nbsp;N/A</span></s:else>

      					</div>
      					<div class="grey_line"></div>
      					<div class="bc_section">
      						<div class="sec_title">Education</div>
      						<s:if test="educationList.size!=0">
      						<table width="463" cellspacing="0" cellpadding="5">
								<tbody>
									<tr class="sec_heading">
										<td>College</td>

										<td>Degree</td>
										<td>Emphasis</td>
									</tr>
									
									 <s:iterator value="educationList" status="rowstatus">
									<tr class="<s:if test="#rowstatus.odd== true">odd</s:if><s:else>even</s:else>" >
									
										<td><s:property value="schoolName"/></td>
										<td><s:property value="degree"/></td>
										<td><s:property value="concentration"/></td>

									</tr>
									</s:iterator>
									
								</tbody>

							</table>
							</s:if>
							<s:else>
							<span class="noItems">&nbsp;N/A</span></s:else>
      					</div>
      					<div class="grey_line"></div>
      					<div class="bc_section">
      						<div class="sec_title">Skills</div>
      						<s:if test="userSkillsDetailsList.size!=0">
      						<table width="463" cellspacing="0" cellpadding="5">
								<tbody>
									<tr class="sec_heading">

										<td>Skill Name</td>
										<td>Level</td>
										<td>Experience (Years)</td>
									</tr>
									<s:iterator value="userSkillsDetailsList" status="rowstatus">
									<tr class="<s:if test="#rowstatus.odd== true">odd</s:if><s:else>even</s:else>" >
										<td><s:property value="skillName"/></td>
										<td><s:property value="level"/></td>
										<td><s:property value="experience"/></td>
									</tr>
									</s:iterator>
								</tbody>
							</table>
							</s:if>
							<s:else>
							<span class="noItems">&nbsp;N/A</span>
							</s:else>
      					</div>
						<br class="clear-both">
					</div></div></div></div></div>

				</div>
    
   <div id="bc_briefcase">
    <div class="bc_light_box">
        <div class="bc_lb-tr">
            <div class="bc_lb-bl">
                <div class="bc_lb-br">
                    <div class="bc_lb-content">
                        <div class="bc_greytbar">
                            <!--<s:url id="view" action="viewBriefcaseFromSearch">
                                <s:param name="employeeProfile.id" value="employeeProfileId"/>
                                <s:param name="employee.id" value="employee.id"/>
                                </s:url>-->
                            <div id="bc_viewall-briefcase" class="bc_gtb_viewall">
                            <!--<s:a href="%{view}">View All</s:a>-->
                             <authz:authorize ifNotGranted="ROLE_ADMIN,ROLE_EMPLOYER,ROLE_EMPLOYEE" >
                             	<a href="${ctx}/public/signup.action">View All</a>
				             </authz:authorize>
				             <authz:authorize  ifAnyGranted="ROLE_ADMIN,ROLE_EMPLOYER,ROLE_EMPLOYEE" >
                              	<a href="#">View All</a>
                             </authz:authorize>                         
                             </div>
                            <h3 class="bc_gtb_title"><span id="bc_person_fname-brief"><s:property
                                    value="employeeProfile.name"/></span>'s Briefcase 
                            </h3>
                        </div>

                        <div id="bc_bc_contents">
                            <s:hidden name="employeeProfile.id" id="briefcaseProfilrId"/>
                            <s:set name="id" value="briefcaseItemsList" scope="request"/>

                            <display:table name="${id}" id="id" class="bc_bc_table" cellspacing="0"
                                           pagesize="5" sort="list" defaultsort="1" requestURI=""
                                           decorator="com.mob.util.BriefCaseItems">

                                <display:column title="Type" scope="col" property="image"></display:column>
                                <display:column property="name" title="Title" class="bc_tbl_shad"></display:column>
                                <display:column property="createdDate" title="Added"></display:column>
                                <display:column property="modifiedDate" title="Last Viewed"
                                                class="bc_tbl_shad"></display:column>
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
                            <div class=bc_items_List_pagination></div>
                        </div>
                        <span class="clear-both"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="clear-both"></div>
</div> <!-- end right div -->
</div><div class="clear-both"/></div></div></div>
<script src="<c:url value='/styles/default/js/ibox.js'/>" type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/contactInformation.js'/>" type="text/javascript"></script>

