<%@ include file="/common/taglib.jsp"%>
<%@ taglib uri="/MOB" prefix="mob"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="<c:url value='/styles/default/css/calendar-win2k-cold-2.css'/>" />



<!--
<script src="<c:url value='/styles/default/js/editWorkexperience.js'/>"	type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/editProfile.js'/>" type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/editProfileEducation.js'/>"	type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/editEducation.js'/>"	type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/editTraining.js'/>" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/styles/default/js/editskills.js'/>"></script>
<script	type="text/javascript" src="<c:url value='/styles/default/js/addAnotherIndustryAfterLogin.js'/>"></script>
<script type="text/javascript" src="<c:url value='/styles/default/js/addAnotherSkillsAfterLogin.js'/>"></script>
<script type="text/javascript" src="<c:url value='/styles/default/js/addAnotherCategoryAfterLogin.js'/>"></script>
<script type="text/javascript" src="<c:url value='/styles/default/js/getSkillsDetailsAfterLogin.js'/>"></script>

-->
<script src="<c:url value='/styles/default/js/editProfile.js'/>" type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/editProfileEducation.js'/>"	type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/styles/default/js/editskills.js'/>"></script>
<script type="text/javascript" src="<c:url value='/styles/default/js/autosuggest.js'/>"></script>
<script src="<c:url value='/styles/default/js/calendar.js'/>" type="text/javascript"></script>




<div id="bc_profile">
<div id="bc_main_outer">

	<div id="bc_main_mid">
		<div id="bc_profile_outernav"><div class="outer_page_nav">
		<ul>
		        
		       <li><!--
			       <s:url id="viewProfile" action="myContactAction1.action">
				      <s:param name="profile.id" value="profile.id"/>
				    </s:url>
			       <s:a href="%{viewProfile}">View Profile</s:a>
			       --><a href="${ctx}/employee/myContactAction1.action?profile.id=<s:property value="profile.id"/>">View Profile</a>
		       </li>
		       
		       <li>
			       <!--<s:url id="viewProfileDetails" action="viewProfileDetailsForEmployee.action">
				      <s:param name="profile.id" value="profile.id"/>
				   </s:url>
			       <s:a href="%{viewProfileDetails}">View Profile Details</s:a>
			       -->                  <a href="${ctx}/employee/viewProfileDetailsForEmployee.action?profile.id=<s:property value="profile.id"/>">View Profile Details</a>
			     
		       </li>
		       <li class="active"><!--
			       <s:url id="editProfileDetails" action="loadProfileDetailsForEmployee.action">
				   <s:param name="profile.id" value="profile.id"/>
			   	   </s:url>
			       <s:a href="%{editProfileDetails}">Edit my Profile</s:a>
			         --><a href="${ctx}/employee/loadProfileDetailsForEmployee.action?profile.id=<s:property value="profile.id"/>">Edit my Profile</a>
		       </li>
		       <li class="align-right">
			       <!--<s:url id="privacy" action="privacy.action">
				   <s:param name="profile.id" value="profile.id"/>
			   	   </s:url>
			   	   <s:a href="%{privacy}">Privacy Settings</s:a>
			   	   --><a href="${ctx}/employee/privacy.action?profile.id=<s:property value="profile.id"/>">Privacy Settings</a>
		   	   </li><!--
		      
		       <s:url id="listfeedbacks" action="listOfEmployeeFeedbacks.action">
			      <s:param name="profile.id" value="profile.id"/>
			   </s:url>
		       --><li class="align-right">
		       <!--<s:a href="%{listfeedbacks}">Profile Feedback:<em class="pos"><span id="positiveid"><s:property value="possitiveSize"/></span></em></s:a>
		         -->
		         <a href="${ctx}/employee/listOfEmployeeFeedbacks.action?profile.id=<s:property value="profile.id"/>">Profile Feedback:<em class="pos"><span id="positiveid"><s:property value="possitiveSize"/></span></em></a>
		       </li>
		       <li class="align-right help">
		         <mob:flag key="1" src="../styles/default/images/icon_help.png">
                 </mob:flag>
		        </li>
       </ul>		
		
		
		</div></div>

		<div class="bc_main_inner clear-both">
			<div id="bc_profile_sec">
				<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
					<div id="bc_profile_pic_spot">
						<div class="bc_pps_pic">
							<div id="bc_profile_pic">
								 <s:if test="profile.picture!=null">					   
									<img src="${ctx}<s:property value="profile.picture"/>" alt=""  width="130" height="100" />
									</s:if>
									<s:else>
									<img src="${ctx}/styles/default/images/mobc_default_profile_pic.jpg" alt=""  width="130" height="100" />
									</s:else>
							</div>
						</div>
						
					</div>
					<div id="bc_profile_info">
						<h2 id="bc_profile_name"><s:property value="user.firstName"/>  <s:property value="user.lastName"/></h2>
						 <s:if test="profile.jobcategory!=''">
	 					 <h3 id="bc_profile_profession"> <s:property value="profile.jobcategory"/></h3>
	   					 </s:if><div class="bc_pi_details">

							<div class="bc_pi_d_line clear-both"><h3>Locations:</h3><h4 id="bc_profile_locations"><s:property value="user.city"/>,<s:property value="user.state"/></h4></div>
							</div>

					</div>
					<br class="clear-both" />
				<form method="get" action="editEmployeeProfileDetails.action">
				<s:hidden name="profile.id"></s:hidden>
					<div id="bc_profile_details">
						<div class="brief_desc">
							<div class="col"><h3>Primary Industry:</h3> 
							<p><s:select name="profile.jobcategory"
	          						headerKey="1" headerValue="--Please Select--"
		      						list="jobCateoryList"
		      						listKey="name"
		      						listValue="name">
								</s:select></p></div>
							<div class="col"><h3>Desired Salary Range:</h3> 
							<p><s:select name="profile.range"
			     							list="salaryList"
		      								listKey="range"
		      								listValue="range"
		      								cssStyle="width:90px">
									</s:select></p></div>
							<div class="col"><h3>Available for work:</h3> 
							<p><s:iterator value="workTimeFrameList" status="status">   
                                         <s:checkbox name="profile.workTimeframe"
                                                     fieldValue="%{worktimeframename}" 
                                                     value="%{worktimeframename in checkBoxList}"/>
                                     
                                          <s:property value="worktimeframename"/> <br>
                                     </s:iterator></p></div>

						</div>
						<div class="info_row work_experience">
							<h3>Work Experience:</h3>
							<span id="validateWorkExp" style="color: red"></span>
							<div class="sel_prof_headers">		
							
								<div class="sel_prof_col spc_name"><h4>Job Name</h4></div>
								<div class="sel_prof_col spc_title"><h4>Title</h4></div>
								<div class="sel_prof_col spc_date"><h4>Date Range</h4></div>

							</div>
						<div id="currentWorkExp" >
						 <s:iterator value="workExperienceList">	
						 
						<div class="exp_entry" id="expdiv<s:property value='id'/>">
									<input type="hidden" id="id<s:property value='id'/>" name="id" value=<s:property value="id"/> >
									<input type="hidden" id="employer<s:property value='id'/>" name="employerName" value=<s:property value="employerName"/> >
									<input type="hidden" id="description<s:property value='id'/>" name="description" value=<s:property value="description"/> >
									<input type="hidden" id="workstart<s:property value='id'/>" name="workStart" value=<s:date name="workStart" format="MM/dd/yyyy"/> >
									<input type="hidden" id="workend<s:property value='id'/>" name="workEnd" value=<s:date name="workEnd" format="MM/dd/yyyy"/> >
									
									<div class="where" id="employerdiv<s:property value='id'/>"><s:property value="employerName"/> </div>
									<div class="what" id="descriptiondiv<s:property value='id'/>"><s:property value="description"/></div>
									<div class="when" id="workstartdiv<s:property value='id'/>"><s:date name="workStart" format="MM/dd/yyyy"/> 
									 <s:if test="workEnd!=''">
									       <s:date name="workEnd" format="MM/dd/yyyy"/>
									  </s:if>
									  <s:else>
									  -<s:date name="workEnd" format="MM/dd/yyyy"/>
									   </s:else>
									
									</div>
									
									<div class="actions"><img id="image_edit" src="${ctx}/styles/default/images/exp_entry-edit.gif" title="Edit" alt="Edit" onclick="loadForEditWorkExperience('<s:property value='id'/>')" />
									<img  src="${ctx}/styles/default/images/exp_entry-remove.gif" title="Remove" alt="remove" onclick="deleteWorkExperience('<s:property value="id"/>')" /></div>
								</div>
						
							</s:iterator>	
						
						</div>
						<!--
							 <s:iterator value="workExperienceList">
							 <div class="sel_prof_row">
									<div class="sel_prof_col spc_name"><s:property value="employerName"/> </div>
									<div class="sel_prof_col spc_title"><s:property value="description"/></div>
									<div class="sel_prof_col spc_date"><s:date name="workStart" format="MM/dd/yyyy"/> - <s:date name="workEnd" format="MM/dd/yyyy"/></div>
							 </div>
							</s:iterator>
						-->
						</div>
						
						<!-- Added deldiv for storing deleted experience row id's	-->		
						<div id="deldiv">
						</div>	
									
						<div id="addWorkExp">
								<div class="f_col">														
								<h5>Company Name</h5>
               					<input class="txt" name="organizationname" type="text" id="companyname_txtbox"  />
								</div>
								
								<div class="f_col">
								<h5>Title/Position</h5>
							    <input class="txt" name="descriptions" type="text" id="description_txtbox"/>
								</div>
								
						        <div class="f_col">
						         <h5>From</h5>
						          					        
                                <input type="text" class="txt" style="width:65px" id="workStart_txtbox" name="startDate"/>
                                 <img src="${ctx}/styles/default/images/datepicker_image.GIF" id="f_trigger_c" class="startdatetxt"  title="Date selector"/>

								<script type="text/javascript">
								    Calendar.setup({
								        inputField     :    "workStart_txtbox",     // id of the input field
								        ifFormat       :    "%m/%d/%Y",      // format of the input field
								        button         :    "f_trigger_c",  // trigger for the calendar (button ID)
								        align          :    "Tl",           // alignment (defaults to "Bl")
								        singleClick    :    true
								    });
								</script>
						         <p class="ex">ex: 02/09/2007</p>
						        </div>
						        
						        <div class="f_col">
						         <h5>To</h5>
						         					        
                                   <input type="text" style="width:65px" id="workEnd_txtbox" style="width:67px" class="txt" name="endDate"/>
                               <img src="${ctx}/styles/default/images/datepicker_image.GIF" id="f_trigger_c1" class="enddatetxt"  title="Date selector"/>

								<script type="text/javascript">
								    Calendar.setup({
								        inputField     :    "workEnd_txtbox",     // id of the input field
								        ifFormat       :    "%m/%d/%Y",      // format of the input field
								        button         :    "f_trigger_c1",  // trigger for the calendar (button ID)
								        align          :    "Tl",           // alignment (defaults to "Bl")
								        singleClick    :    true
								    });
								</script>
                        	         <p class="ex">ex: 02/09/2007</p>
						        </div>					
								
								<div class="f_col smish">
								<img id="add_btn" src="${ctx}/styles/default/images/add_entry_btn-up.png"/>												
									<!-- if you another input type=image is used for the actual form submit, it needs to physically be placed below this line for most browsers to recognize it as the form's default submit -->
								</div>
								
							</div>
						<div class="info_row education">
							<h3>Education:</h3>
							<span id="validateEducationId"  style="color: red"></span>
							<div class="sel_prof_headers">
								<div class="sel_prof_col spc_name"><h4>Name</h4></div>
								<div class="sel_prof_col spc_degree"><h4>Degree</h4></div>
								<div class="sel_prof_col spc_attended"><h4>Attended</h4></div>
								<div class="sel_prof_col spc_concentration"><h4>Major/Concentration</h4></div>
								<div class="sel_prof_col spc_gpa"><h4>GPA</h4></div>
								<div class="sel_prof_col spc_notes"><h4>Notes</h4></div>
							</div>
							
					<!-- Added deldiv for storing deleted education row id's	-->		
					<div id="deleducationdiv">
					</div>
					<div id="your_education">
					<s:iterator value="educationList">
					<div class="sel_prof_row" id="educationdiv<s:property value='id'/>">
					
				         <input type="hidden" id="id<s:property value='id'/>"  name="education_id"  value=<s:property value="id"/> >
					 	 <input type="hidden" id="schoolName<s:property value='id'/>" name="schoolName" value=<s:property value="schoolName"/> >
						 <input type="hidden" id="degree<s:property value='id'/>" name="degree" value=<s:property value="degree"/> >
						 <input type="hidden" id="courseStart<s:property value='id'/>" name="courseStart" value=<s:date name="courseStart" format="MM/dd/yyyy"/> >
						 <input type="hidden" id="courseEnd<s:property value='id'/>" name="courseEnd" value=<s:date name="courseEnd" format="MM/dd/yyyy"/> >
						 <input type="hidden" id="concentration<s:property value='id'/>" name="concentration" value=<s:property value="concentration"/> >
						 <input type="hidden" id="gpa<s:property value='id'/>" name="gpa" value=<s:property value="gpa"/> >
						 <input type="hidden" id="honors<s:property value='id'/>" name="honors" value=<s:property value="honors"/> >
						         
						<div class="sel_prof_col spc_school" id="schoolNamediv<s:property value='id'/>" ><s:property value="schoolName"/></div>
						<div class="sel_prof_col spc_degree" id="degreediv<s:property value='id'/>" > <s:property value="degree"/></div>
						<div class="sel_prof_col spc_dateattended" id="courseStartdiv<s:property value='id'/>"  ><s:date name="courseStart" format="MM/dd/yyyy"/>-<s:date name="courseEnd" format="MM/dd/yyyy"/></div>
						<div class="sel_prof_col spc_degreename" id="concentrationdiv<s:property value='id'/>"><s:property value="concentration"/></div>
						<div class="sel_prof_col spc_gpa" id="gpadiv<s:property value='id'/>"><s:property value="gpa"/></div>
						<div class="sel_prof_col spc_honors" id="honorsdiv<s:property value='id'/>"><s:property value="honors"/></div>
						<div class="sel_prof_col spc_actions"><img src="${ctx}/styles/default/images/exp_entry-edit.gif" title="Edit" alt="Edit" onclick="loadEditEducationDetails('<s:property value='id'/>')" />
						<img src="${ctx}/styles/default/images/mobc_redx.gif" title="Remove" alt="Remove" onclick="deleteEducationDetails('<s:property value="id"/>')" /></div>
						
					</div>
					</s:iterator>
				
					</div>
					
					
							<!--
							 <s:iterator value="educationList">
							<div class="sel_prof_row">
								<div class="sel_prof_col spc_name"><s:property value="schoolName"/></div>
								<div class="sel_prof_col spc_degree"><s:property value="degree"/></div>
								<div class="sel_prof_col spc_attended"><s:date name="courseStart" format="MM/dd/yyyy"/> - <s:date name="courseEnd" format="MM/dd/yyyy"/></div>
								<div class="sel_prof_col spc_concentration"><s:property value="concentration"/></div>

								<div class="sel_prof_col spc_gpa"><s:property value="gpa"/></div>
								<div class="sel_prof_col spc_notes"><s:property value="honors"/></div>
							</div>
							</s:iterator>
							
						-->
						
						<!-- Added deldiv for storing deleted training row id's	-->		
						<div id="deltrainingdiv">
						</div>
		
					
					  <div id="employeeSignUpForm">
						<div class="frow">
						
							<div class="fcol">
								<h4>School Name</h4>
								<input type="text" class="txt md" name="schoolNames" id="schoolName_txtbox"/>
							</div>
							
							<div class="fcol">

								<h4>Degree Attained</h4>
								<input type="text" class="txt md" name="degrees" id="degree_txtbox" />
							</div>
							
							<div class="fcol">
								<h4>From</h4>
							 
						    <input type="text" id="educationStart_txtbox" class="txt sm" style="width:67px" name="Started"/>
	    					    <img src="${ctx}/styles/default/images/datepicker_image.GIF" id="f_trigger"  title="Date selector"/>					        
                                
                               

								<script type="text/javascript">
								    Calendar.setup({
								        inputField     :    "educationStart_txtbox",     // id of the input field
								        ifFormat       :    "%m/%d/%Y",      // format of the input field
								        button         :    "f_trigger", 
								        align          :    "Tl",
								        singleClick    :    true
								    });
								</script>
							     <div class="input_ex">ex: <em>02/09/2007</em></div>
							  
								
							</div>
							
							<div class="fcol">
								<h4>To</h4>
								
							    <input type="text" id="educationEnd_txtbox" class="txt sm" style="width:67px" name="End"/>
	    					    <img src="${ctx}/styles/default/images/datepicker_image.GIF" id="f_trigger1"  title="Date selector"/>
								<script type="text/javascript">
								    Calendar.setup({
								        inputField     :    "educationEnd_txtbox",     // id of the input field
								        ifFormat       :    "%m/%d/%Y",      // format of the input field
								        button         :    "f_trigger1",  // trigger for the calendar (button ID)
								        align          :    "Tl",
								        singleClick    :    true
								    });
								</script>
	   		                   
							<div class="input_ex">ex: <em>02/09/2007</em></div>
							</div>
							  
							<div class="fcol">

								<h4>Concentration</h4>
								<input type="text" class="txt lg" name="concentrations" id="concentration_txtbox"/>
							</div>
							
							<div class="fcol">
								<h4>&nbsp;</h4>
								<select name="major" id="sel">
								<option value="1">Select</option>
									<option value="Major">Major</option>
									<option value="Minor">Minor</option>
								</select>

							</div>
							
							<div class="fcol">
								<h4>GPA</h4>
								<input type="text" class="txt sm" name="gpas" id="gpa_txtbox"/>
							</div>
							
							<div class="fcol">
								<h4>Honors/Achievments</h4>
								<input type="text" class="txt lg" name="honor" id="honors_txtbox"/>

							</div>		
							<div class="f_col">
							<img class="txt lg1" id="add_btn_education" src="${ctx}/styles/default/images/add_entry_btn-up.png"/>					
									<!-- if you another input type=image is used for the actual form submit, it needs to physically be placed below this line for most browsers to recognize it as the form's default submit -->
							</div>
						</div>	
							
						</div>
						</div>
						<div class="info_row experience">
							<h3>Skills:</h3>
                             <span id="editskillsId" style="color: red"></span>
							<div class="sel_prof_headers">
								<div class="sel_prof_col spc_name"><h4>Name</h4></div>
								<div class="sel_prof_col spc_experience"><h4>Experience (Years)</h4></div>
								<div class="sel_prof_col spc_skilllevel"><h4>Skill Level</h4></div>
								<div class="sel_prof_col spc_notes"><h4>Notes</h4></div>

							</div>
							<!--<s:iterator value="userSkillsDetailsList">
							<div class="sel_prof_row">
								<div class="sel_prof_col spc_name"><s:property value="skillName"/></div>
								<div class="sel_prof_col spc_experience"><s:property value="experience"/></div>
								<div class="sel_prof_col spc_skilllevel"><s:property value="level"/></div>
								<div class="sel_prof_col spc_notes"><s:property value="notes"/></div>
							</div>
							</s:iterator>
						-->
						
						<div id="sel_prof_row">
				        <s:iterator value="userSkillsDetailsList">
						<div class="sel_prof_row" id="skillsdiv<s:property value='id'/>">
							<input type="hidden" id="id<s:property value='id'/>" name="skillId" value=<s:property value="id"/> >
							<input type="hidden" id="skillname<s:property value="id"/>" name="skillName" value=<s:property value="skillName"/> >
							<input type="hidden" id="experience<s:property value="id"/>" name="experience" value=<s:property value="experience"/> >
							<input type="hidden" id="level<s:property value="id"/>" name="level" value=<s:property value="level"/> >
							<input type="hidden" id="notes<s:property value="id"/>" name="notes" value=<s:property value="notes"/> >
				
							<div class="sel_prof_col spc_industry" id="skillname_div<s:property value="id"/>"><s:property value="skillName"/></div>
							<div class="sel_prof_col spc_years" id="experience_div<s:property value="id"/>"><s:property value="experience"/> </div>
							<div class="sel_prof_col spc_skill" id="level_div<s:property value="id"/>"><s:property value="level"/> </div>
							<div class="sel_prof_col spc_info" id="notes_div<s:property value="id"/>"><s:property value="notes"/>  </div>
							<div class="sel_prof_col spc_actions">
							<img src="${ctx}/styles/default/images/exp_entry-edit.gif" title="Edit" alt="Edit" onclick="loadEditSkills('<s:property value="id"/>')"/>
							<img src="${ctx}/styles/default/images/mobc_redx.gif" title="Remove" alt="Remove" onclick="deleteSkills('<s:property value='id'/>')"/></div>
						    
						</div>
						</s:iterator>
				      
				      </div>
				      <div id="deleteskills">
					  </div>
					  <div id="skillsForm">
					  
					 
				      <div class="input_row">
				      <h4>Your Industry</h4><!--
				      <input type="text"  style="width:176px;" class="txt lg" name="industryName" id="industry" onclick="getIndustry()";/>
				      --><s:select name="industryName"
					             cssStyle="width:30%;"
							  list="industryList"
							  listKey="name"
							  id="industry"
							  headerKey="1"
							  headerValue="Please select industry"
							  listValue="name" size="5">
				    </s:select>
				      </div>
				      <div id="ajbx_industry" style="display:none;"> 
				      <ul></ul>   
				        
				      <div class="add_one" >
				      <a href="#" onclick="return pop_up_industry(event,'confirm_delete1',[-220,20,'negoffset_mouse'])">Add Another Industry...</a>
				      </div>
				      </div>
					  <div class="input_row">
					       <div class="fbrow">
					        <div class="fbcol">
					         <h4>Category</h4>
					         <input type="text" class="txt lg" name="category" id="skillscategory" onclick="getCategory()" />
					        </div>
					        <div class="fbcol">
					        <h4>Skill Name</h4>
					        
					        <input type="text" class="txt lg" name="skill" id="skills" onclick="getSkills()" />
					        <div id="ajbx_skills" style="display:none;" class="add_one" >
					        <ul></ul>
					         <a href="#" onclick="return pop_up_skill(event,'addSkills',[-220,20,'negoffset_mouse'])">Add Another Skill...</a>
					        </div>
					     </div>
					        <div class="fbcol">
					         <h4>Years Experience</h4>
					         <input type="text" class="txt sm" name="experience" id="experience" />
					         
					         
					        </div>
					        <div class="fbcol">
					         <h4>Skill Level</h4>
					         <s:select name="skilllevel"
					                headerKey="1" headerValue="Select One"
					             list="{'Beginner','Intermediate','Expert','Mastered It!'}"
					             id="skill_level">
					         </s:select> 
					        </div>
					        <div class="fbcol">
					         <h4>Notes/Comments</h4>
					         <input type="text" class="txt lg" name="notes" id="notes"/>
					        </div>
					        
					        <div class="fbcol">
					         <img  src="${ctx}/styles/default/images/mobc_add-up.png" id="addbtn_skills" style="padding-top:6px;"/>            
					        </div>
					
					       </div>
					      </div>
					      </div>
					      <div id="ajbx_category" style="display:none;">
					      <ul></ul>
					      <div class="add_one">
					       <a href="#" onclick="return pop_up_category(event,'addCatogories',[-220,20,'negoffset_mouse'])">Add Another Category...</a>
					      </div>      
					      </div>
      
						</div>
					</div>
<div id="save_profile_changes">
	<!--<s:url id="editingProfileDetails" action="editEmployeeProfileDetails.action">
	<s:param name="profile.id" value="profile.id"/>
	</s:url>
	<s:a href="%{editingProfileDetails}">
	<img src="${ctx}/styles/default/images/save_profile_changes.png" alt="Save" /></s:a>
-->
<div id="percAnswered" style="display: none"><div class="perc-m"><div class="perc-l"><div class="perc-r">
        <div id="percExpl">0% of questions answered.</div>
       </div></div></div></div>
<s:submit type= "image" src="${ctx}/styles/default/images/save_profile_changes.png"/>
				
</div>
		</form></div></div></div></div></div>
			</div>
	

				
			<br class="clear-both" />
		</div>
	</div>
</div>

<div id="confirm_add" class="popup1"><div class="popup1-content">
	<div class="pu_row">
		<div class="pu_col"><img src="${ctx}/styles/default/images/mobc_default_profile_pic.jpg" alt="New Friend" /></div>

		<div class="pu_col">
			<form onsubmit="return false">
				<h4>Jason Cosby Joseph</h4><br />
				<h6>Privacy Group: </h6>
				<select>
					<option value="">Potential Employer</option>
				</select>

				<br />
				<a href="#">Add as Contact</a> | <a href="#" onclick="return hide_pop_up('confirm_add')">Close</a>
			</form>
		</div>
		<span class="clear-both"><!-- for IE6 --></span>
	</div>
</div></div>

<br class="clear-both" />

<div id="leave_feedback" class="popup1"><div class="popup1-content">
	<div class="pu_row">
		<div class="pu_col">
			<span class="pu_prof_pic"><img src="images/mobc_default_profile_pic.jpg" /></span>
		</div>

		<div class="pu_col">
			<h3 class="leave_feedback_for">Leave Feedback For</h3>
			<h4 class="prof_name">Jason Joseph</h4>
			<form class="feedback_form" onsubmit="return false">
				<div class="row">
					<div class="col">
						<h5>Feedback Type:</h5>

					</div>
					<div class="col">
						<select name="feedback_type">
							<option value="positive">Positive</option>
							<option value="neutral">Neutral</option>
							<option value="negative">Negative</option>
						</select>

					</div>
				</div>
				<div class="row">
					<textarea name="feedback_body"></textarea>
				</div>
			<div class="feedback_actions"><a href="#" onclick="return false;">Add Feedback</a> | <a href="#" onclick="return hide_pop_up('leave_feedback')">Cancel</a></div>

			</form>
		</div>
		<span class="clear-both"><!-- for IE6 --></span>
	</div>
</div></div>
</div>

<!-- added -->
 	  <div id="addSkills" class="popup1">
  </div>

  <!-- added -->
  <div id="addCatogories" class="popup1">
  </div>
  
  <!-- added -->
<div id="confirm_delete1" class="popup1">
<div class="popup1-content">
	<div class="pu_row">
		<div class="pu_col right">
		 <span id="industryDetails">
				<h4>Industry Name:<br><input type="text" id="addIndustry"/></h4>
				<br>
	    		<a href="#" onclick="return hide_pop_up_Industry()">
	    		<img src="${ctx}/styles/default/images/grn_no_btn-up.png" alt="No" />
	    		</a>
	    		<a class="second_a"  href="" onclick="addAnotherIndustry()">
				<img src="${ctx}/styles/default/images/grn_yes_btn-up.png" alt="Yes"/></a>
				</span>
				
				<span style="display:none" id="progress">
	               <img src="${ctx}/styles/default/images/pleasewait.gif"/>
	            </span>
	            <span style="display:none" id="success">
	              	<h6>Industry added successfully.<a href="#" onclick="return hide_pop_up_Industry()">Close</a></h6>
	            </span>
	            <span style="display:none" id="failure">
	               	Sorry, unable to add the Industry. <a href="#" onclick="return hide_pop_up_Industry()">Close</a>
	             </span>
	    		
		</div>
		

	</div>
</div>
</div>
	  <!-- end -->