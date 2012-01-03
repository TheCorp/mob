<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<style>
    .closetxt {
        margin-bottom: 50px;
    }
</style>
<div id="bc_home">
<div id="bc_main_outer">
	<div id="bc_main_mid">
		<div id="bc_profile_outernav">
		<div class="outer_page_nav">
		<ul>
		
	     	<li class="align-right">
		         <mob:flag key="2" src="../styles/default/images/icon_help.png">
                 </mob:flag>
		        </li>
		
		<li class="align-right help">

		  	<span style="padding:5px"><img src = "${ctx}/styles/default/images/icon_flag.png"></img></span>
	             </li>
	         <li class="active">
	         
            <a href="${ctx}/search/viewingEmployerProfileFromSearch.action?employerProfile.id =<s:property value="employerProfile.id"/>">     	         
	        Company Profile
	        </a>
	         <li class="align-right">
	          <a href="#"  onclick="return pop_up_feedback(event,'feedback',['center',300])">Leave Feedback</a>
	         </li>
		         
            <li class="align-right">
           <a href="${ctx}/search/listOfEmployeeFeedbacksFromSearch.action?profile.id =<s:property value="employerProfile.id"/>">
     Profile Feedback:<em class="pos"><span id="positiveid"><s:property
                    value="possitiveSize"/></span></em></a>                
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
										<s:if test="employer.picture!=null">
                                           <a rel="ibox" href='<s:property value="employer.pictureFromAmazon"/>'>
                                               <img src='<s:property value="employer.midPictureFromAmazon"/>' alt="N/A" align="top"/>
                                           </a>
                                        </s:if>
                                        <s:else>
                                        	<img src="${ctx}/styles/default/images/mobc-default-profile-image.jpg" alt=""  align="top" width="135" height="150"/>
                                        </s:else>									</div>
								</div>
							</div>
							<img class="addAsFriendButton" src="${ctx}/styles/default/images/employerProfileImages/button_addtocontacts.png"
							onclick="return pop_up_add_contact(event,<s:property value="employerProfile.id"/>,'confirm_add',[-150,-200,'negoffset_mouse'])">
							<div id="bc_Empr_profile_info">
								<h2 id="bc_profile_name"><s:property value="employer.emplrOrgName"/></h2>
								<div class="bc_pi_details">

									<div class="bc_pi_d_line"><h3>Industry:</h3><h4><s:property value="employer.industry.name" /></h4></div>
									<div class="bc_pi_d_line"><h3>Location:</h3><h4><s:property value="employer.city" /></h4></div>
									<div class="bc_pi_d_line"><h3>Email:</h3><h4><s:property value="employer.email" /></h4></div>
									<div class="bc_pi_d_line"><h3>Phone:</h3><h4><s:property value="employer.phoneNumber"/></h4></div>
									<div class="bc_pi_d_line"><h3>Website:</h3><h4>www.vipbooker.com</h4></div>

								</div>
							</div>
						</div>
						<br class="clear-both">
						<div class="bc_statement">
							<div id="bc_personal_statement">Mission Statement</div>
							<p><s:property value="employerProfile.personalStatement" /></p>
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
	     					<div class="employer_info_tab" onclick="showWorkCulture();" style="cursor: default;" id="workCulId">WORK CULTURE</div>
	     					<div class="employer_info_tab" onclick="showWhyWorkHere();" style="cursor: default;" id="whyWorkId">WHY WORK HERE</div>
	     				</div>
	     				<div class="scroll_box">

		     				<div class="scroll_content">
		     					<div class="bc_scroll_section" id="aboutUsID" ><br>
		      						<s:property value="employerProfile.aboutUs" />
		      					</div>
		     					<div class="bc_scroll_section" id="workCultureId">
		      						<s:property value="employerProfile.workCulture" />
		      					</div>

		      					<div class="bc_scroll_section" id="whyWorkHereId">
		      						<s:property value="employerProfile.whyWorkHere" />
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
							
								<!--<a href="${ctx}/employer/loadAllEmployerOpprotunity.action">View All</a>
	      					--></div>
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
												<td>
												<img src="${ctx}/styles/default/images/employerProfileImages/button_applynow_small.png"  style="cursor: pointer;"
												onclick="return applyForPosition_pop_up(event,'<s:property value="id"/>','apply_for_position',['center',20,'negoffset_mouse'])" >
												</td>

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
								<!--<a href="${ctx}/employer/employerBriefcase.action">View All</a>
	      					--></div>
	      					<h3 class="bc_gtb_title"><span id="bc_person_fname-brief"><s:property value="employerProfile.name"/></span>'s Briefcase </h3>

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
		<script src="<c:url value='/styles/default/js/ibox.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/styles/default/js/contactInformation.js'/>" type="text/javascript"></script>
	</div>
	<br class="clear-both">

	

<div id="apply_for_position" class="popup1"><div class="popup1-content">
	<div class="pu_row">
		<h3></h3>
		<form>
		    <div id="profilesDiv">
			<h5>Select profile from drop down list</h5>
			<h5><span style="display:none" id="selectProfile_apply_job">
            	<font color="red">Please select profile!</font>
            </span></h5>
			<s:select list="profilesListForSearch" 
			          headerKey="" 
			          headerValue="Please Select" 
			          listValue="name" 
			          listKey="id" 
			          id="interestedEmployeeid" onchange="chkSelectedProfile();">
			</s:select>
			</div>
			<span id="applyforopportunity">
			<s:a  onclick="applyforopportunity('apply_for_position');" cssStyle="cursor:pointer">Apply</s:a> | <a href="#" onclick="return applyPosition_hide_pop_up('apply_for_position')">Close</a>
            </span>
            <span style="display:none" id="progress">
            	<img src="${ctx}/styles/default/images/pleasewait.gif"/>
            </span>
            <span style="display:none" id="success">
            	Your application has been sent successfully. <a href="#"  onclick="return applyPosition_hide_pop_up('apply_for_position')">Close</a>
            </span>
            <span style="display:none" id="failure">
            	Sorry, unable to send your application successfully. <a href="#"  onclick="return applyPosition_hide_pop_up('apply_for_position')">Close</a>
            </span>			
			</form>
	</div>

</div></div>

<div id="markasfavorite" class="popup1"><div class="popup1-content">
	<div class="pu_row">
		<h3></h3>
		<form>
		<div id="profilesDivForMarkasFavorite">
		
		<h5>Select profile from drop down list</h5>
		<h5><span style="display:none" id="selectProfile_mark_favorite">
            <font color="red">Please select profile</font>
          </span></h5>
		<s:select list="profilesListForSearch" 
			          headerKey="" 
			          headerValue="Please Select" 
			          listValue="name" 
			          listKey="id" 
			          id="bookmarkedEmployeeid" onchange="chkSelectedList();">
			</s:select>
			</div>
			<span id="markAsFavorite">
			<s:a href="#" onclick="markasFavorite('markasfavorite');">Apply</s:a> | <a href="#" onclick="return markasfavorite_hide_pop_up('markasfavorite')">Close</a>
			</span>
			<span style="display:none" id="favorite_progress">
            	<img src="${ctx}/styles/default/images/pleasewait.gif"/>
            </span>
            <span style="display:none" id="favorite_success">
            	Marked the opportunity as your favorite. <a href="#"  onclick="return markasfavorite_hide_pop_up('markasfavorite')">Close</a>
            </span>
            <span style="display:none" id="favorite_failure">
            	Sorry, unable to mark the opportunity as your favorite. <a href="#"  onclick="return markasfavorite_hide_pop_up('markasfavorite')">Close</a>
            </span>		
			</form>
		<span class="clear-both"><!-- for IE6 --></span>
	</div>

</div></div>


<div id="feedback" class="popup1">
<div class="popup1-content">
 <div class="pu_row">
  <div class="pu_col"><img src="${ctx}/styles/default/images/mobc_default_profile_pic.jpg" alt="New Friend"/></div>
  <div class="pu_col">
   <form>
        <s:hidden name="employerProfile.id" id="profileid"/>
        <s:hidden name="employer.id" id="profileownerid"/>
    <div id="feedback_details">
    <h4><s:property value="employer.organizationName"/></h4><br/>
    <h6>Leave Feedback</h6><br/>
    
    <font size="1" face="arial, helvetica, sans-serif"> ( You may enter up to 250 characters. )<br>
    <textarea id="textareaId" name=message  cols=28 rows=4 onKeyDown="textCounter(this.form.message,this.form.remLen,250);" onKeyUp="textCounter(this.form.message,this.form.remLen,250);"></textarea>
    <br/>
    <input readonly type="hidden" id="remLenid" name=remLen size=3 maxlength=3 value="250"/><span id="spanid">250</span>&nbsp;characters left</font>
    </div>	  
   <span id="selFeedback">
 		<s:a id="feedbackDetails" onclick="storeEmployeeFeedback('feedback');">
		Leave Feedback</s:a> | <a href="#"  onclick="return hiding_pop_up('feedback')">Close</a>
    </span>
    <span style="display:none" id="feedbackProgress">
    	<img src="${ctx}/styles/default/images/pleasewait.gif"/>
    </span>
    <h5>
    <span style="display:none" id="feedbackSuccess">
    	Feedback added successfully. <a href="#"  onclick="return hiding_pop_up('feedback')">Close</a>
    </span>
    </h5>
    <h5>
    <span style="display:none" id="feedbackFailure">
     	Sorry, unable to add your feedback. <a href="#"  onclick="return hiding_pop_up('feedback')">Close</a>
    </span>
    </h5>         
   </form>
  </div>
  <span class="clear-both"><!-- for IE6 --></span>
 </div>
</div>
</div>





<div id="confirm_add" class="popup1" style="position: absolute">
    <div class="popup1-content">
        <div class="pu_row">
            <div class="pu_col"><img src="${ctx}/styles/default/images/mobc_default_profile_pic.jpg" alt="New Friend"/>
            </div>
            <div class="pu_col">
                <form>
                
                    <s:hidden id="employeeProfileId" name="contactOwner.id"/>
                    <div id="contact_details">
                    <h5> <span style="display:none" id="selectProfile">
                      <font color="red">Please select a profile!</font></span></h5>
                    <h5>Profiles :</h5>
                   <h5> <s:select
                            list="profilesListForSearch"
                            listKey="id"
                            headerKey=""
                            headerValue="Please Select"
                            listValue="name" id="associatedProfileId" onchange="getPrivacyGroups();"/>
                        </h5><br/>  
                     <h5> <span style="display:none" id="selectPrivacyGrp">
                     <font color="red" >Please select privacy group!</font>
	                </span></h5>
                    <h5>Privacy Group: </h5>
                    <div id="contactTypeDiv">
                    <s:select
                            list="contactTypesList"
                            listKey="name"
                            headerKey="1"
                            headerValue="Please Select"
                            listValue="name" name="contactType" id="selContactId"/>
                     </div>
                     </div>
                     <br/>
               		   <h5><span id="selContact">
	                   		<a style="cursor: pointer;" id="contactid" onclick="addEmplrContact('confirm_add');">
							Add as Contact</a> | <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                   </span></h5>
	                    <h5><span style="display:none" id="contactProgress">
	                    	<img src="${ctx}/styles/default/images/pleasewait.gif"/>
	                    </span></h5>
	                    <h5><span style="display:none" id="contactSuccess">
	                    	Contact added successfully. <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span></h5>
	                    <h5><span style="display:none" id="contactFailure">
	                    	Sorry, unable to add the contact. <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span> </h5>
	                   <h5><span style="display:none" id="contactExist">
	                    	You are already connected to this profile<a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span></h5>
	                             
                </form>
            </div>
            <span class="clear-both"><!--  for IE6 --> </span>
        </div>
    </div>
</div>







<!--
<script src="<c:url value='/styles/default/js/ApplayForPositionFromSearch.js'/>" type="text/javascript"></script> 
<script src="<c:url value='/styles/default/js/markasFavoriteFromSearch.js'/>" type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/leavefeedbackForEmployeeFromEmployee.js'/>" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/styles/default/js/viewEmployerOpportunitiesFromSearch.js'/>"></script>
-->
<script src="<c:url value='/styles/default/js/viewEmployerProfileFromSearch.js'/>" type="text/javascript"></script>

 <script type="text/javascript" src="<c:url value='/styles/default/js/viewEmployerOpportunities.js'/>"></script>   

<script src="<c:url value='/styles/default/js/addUserAsContactFromSearch.js'/>" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/styles/default/js/audio/yahoomediaplayer.js'/>"></script>
<script type="text/javascript" src="<c:url value='/styles/default/js/audio/yahoomediaplayerwikia.js'/>"></script>