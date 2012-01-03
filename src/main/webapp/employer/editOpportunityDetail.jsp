<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="<c:url value='/styles/default/css/calendar-win2k-cold-2.css'/>" />

<script src="<c:url value='/styles/default/js/editOpportunitySkills.js'/>"	type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/opportunity.js'/>" type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/calendar.js'/>" type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/jquery.oop.bgiframe.min.js'/>" type="text/javascript"></script>

<div id="bc_main_outer">
	<div id="create_opportunity">
		<div id="bc_main_outer">
			<div id="bc_main_mid">
				<div class="createOpportunitySignupBorder">
					<div class="signupHeader">Edit Opportunity from <s:property value="user.organizationName"/>, Inc.</div>
					<div class="createOpportunityContent">
					<form id="editOpportunityForm" action="${ctx}/employer/updateEmployerOpportunity.action" class="opportunityForm">
					    <s:hidden name="profile.id" />
					    <s:hidden name="opportunity.id"/>
						<div class="createOpportunityUpperLeft">
								<div class="createOpportunityInputLabel"><font color="red">*&nbsp;</font>Job Name:</div>
								<input class="createOpportunityInputExtraWidth" id="jodNameId" name="str_job_name" 
									value='<s:property value="opportunity.str_job_name"/>' />
								<span class="emplr_rt" id="oppId" style="color: red"></span>	
								
								<div style="width: 300px; float: left;">
								<div class="createOpportunityInputLabel"><font color="red">*&nbsp;</font>Position Title:</div>
								<input class="createOpportunityInputNormalWidth" id="PositionTextId" name="title" 
								value='<s:property value="opportunity.title"/>' />
								<span class="emplr_rt" id="PositionId" style="color: red"></span>			
								</div>
										
								<div class="createOpportunityInputLabel">Job Type:</div>
								<div class="createOpportunitySelectNormalWidth">
									<s:select  name="str_job_type" headerKey="1" headerValue="--Please Select--"
			      						list="jobTypeList" listKey="jobTypeName" listValue="jobTypeName" value="opportunity.str_job_type">
									</s:select>	
								</div>
								
								<div style="width: 300px; float: left;">
									<div class="createOpportunityInputLabel">Education Required:</div>
									
									<s:select name="str_education_requirment" headerKey="1" headerValue="--Please Select--"
		     							 list="educationRequiredList" listKey="educationrequired" listValue="educationrequired" value="opportunity.str_education_requirment">
									</s:select>
									
									
									<!--<input class="createOpportunityInputNormalWidth" id="educationText" 
									name="str_education_requirment" value='<s:property value="opportunity.str_education_requirment"/>' >
									<span class="emplr_rt" id="requirementsId" style="color: red"></span>-->
								</div>
								
								<div class="createOpportunityInputLabel">Salary Range:</div>
								<div class="createOpportunitySelectNormalWidth">
									<s:select name="str_salary_range" headerKey="1" headerValue="--Please Select--"
		     							 list="salaryList" listKey="range" listValue="range" value="opportunity.str_salary_range">
									</s:select>
								</div>
							</div>
							
							<div class="createOpportunityUpperRight">
								<div class="createOpportunityInputLabel">Work Hours:</div>
								<s:select id="workhoursId"  onchange="WorkHours()" name="opportunity.workingHours"
									headerKey="1" headerValue="--Please Select--"
		      						list="workHoursList" listKey="workhours" listValue="workhours" value="opportunity.workingHours">
		      						
		      						</s:select>
								<span class="emplr_rt" id="contactpersonId" style="color: red"></span>
												
							<div class="createOpportunityInputLabel1">
							<div id="workhours_textbox" style="display: none;">	
								<input class="createOpportunityInputNormalWidth" type="text" name="opportunity.workingHours" id="workingText">
							
								</div></div>
								
									
								<!--<div class="createOpportunityInputLabel">Working Hours:</div>
								<input class="createOpportunityInputNormalWidth" id="workingText" name="workingHours" 
								value='<s:property value="opportunity.workingHours"/>' >
								
								
								-->
								<span class="emplr_rt" id="workingHoursId" style="color: red";></span>
								<div style="float: left; width: 300px;margin-top:14px;">	
									<div class="createOpportunityInputLabel">Start Date:</div>
									<input class="createOpportunityInputCalendarWidth" type="text" id="startDate" name="createdDate" 
									value='<s:date name="opportunity.createdDate" format="MM/dd/yyyy"/>' />
									<img style="padding: 6px 0px 0px 5px;" src="${ctx}/styles/default/images/icon_calendar.png" 
									id="f_trigger_c1"  title="Date selector"/>
									<script type="text/javascript">
									    Calendar.setup({
									        inputField     :    "startDate",     
									        ifFormat       :    "%m/%d/%Y",      
									        button         :    "f_trigger_c1",  
									        align          :    "Tl",           
									        singleClick    :    true
									    });
									</script>
							   </div>
							   <span id="startDateWarnId" style="color: red" class="emplr_rt"></span>	
							</div>
							
							<div class="createOpportunityMiddle">
								<div class="createOpportunityInputLabel">Benefits and Perks:</div>
								<!--<input class="createOpportunityTextArea" id="benefitsText" name="str_benefits" 
								value='<s:property value="opportunity.str_benefits"/>' />
								 -->
								 <div class="createOpportunityTextArea">
								 <s:textarea rows="5" name="str_benefits" id="benefitsText"  cssStyle="width:750px"></s:textarea>
							</div>
								<div class="emplr_rt" id="benefitsId" style="color: red"></div>
									
								<div class="createOpportunityInputLabel"><font color="red">*&nbsp;</font>Job Description:</div>
								<!--<input class="createOpportunityTextArea" type="textarea" name="description" 
								value='<s:property value="opportunity.description"/>' id="descId"/>
								-->
								 <div class="createOpportunityTextArea">
								 <s:textarea rows="5" name="description" id="benefitsText"  cssStyle="width:750px"></s:textarea>
							</div>
								<div class="emplr_rt" id="oppId1" style="color: red"></div>
								
								<div class="createOpportunityInputLabel">Application Criteria:</div>
								 <div class="createOpportunityTextArea">
								 <s:textarea rows="5" name="str_job_application_criteria" id="benefitsText"  cssStyle="width:750px"></s:textarea>
							</div>
								<!--<input class="createOpportunityTextArea" id="benefitsText" name="str_job_application_criteria" 
								value='<s:property value="opportunity.str_job_application_criteria"/>' />
								<div class="emplr_rt" id="criteId" style="color: red"></div>-->
							</div>
							
							<div class="createOpportunityTable">
								<div class="createOpportunityInputLabel">Skills Needed:</div>
								<div class="createOpportunityInputBarWide"></div>
								<div class="createOpportunityTableRow">
									<div class="createOpportunityTableColCategory" style="width:183px;"><b>Category</b></div>
									<div class="createOpportunityTableColName"><b>Skill Name</b></div>
									<div class="createOpportunityTableColYears"><b>Years Exp.</b></div>
									<div class="createOpportunityTableColLevel"><b>SKill Level</b></div>
									<div class="createOpportunityTableColNotes"><b>Notes/Comments</b></div>
									<div class="createOpportunityTableColButtons">&nbsp;</div>
								</div>
                                <div class="createOpportunityTableEntryRow1" id="opportunity_list">
                                	<s:iterator value="opportunitySkillsList">
										<div class="sel_prof_row_skill" id="oppskillsdiv<s:property value="id" />">
										<input type="hidden" name="oppSkills_id" id="id<s:property value="id" />" value=<s:property value="id" /> >
										<input type="hidden" name="category" id="category<s:property value="id" />" value=<s:property value="skillscategory" /> >
										<input type="hidden" name="skillsNeeded" id="skillsNeeded<s:property value="id" />" value=<s:property value="skillsNeeded" /> >
										<input type="hidden" name="level" id="level<s:property value="id" />" value=<s:property value="level" /> >
										<input type="hidden" name="noOfYears" id="noOfYears<s:property value="id" />" value=<s:property value="noOfYears" /> >
										<input type="hidden" name="notes" id="notes<s:property value="id" />" value=<s:property value="notes" /> >
																						
										<div class="sel_prof_col spc_category1" id="skillcategorydiv<s:property value="id" />"><s:property value="skillscategory" /></div>
										<div class="sel_prof_col spc_skillname1" id="skillnamediv<s:property value="id" />"><s:property value="skillsNeeded" /></div>
										<div class="sel_prof_col spc_numyears1" id="numyearsdiv<s:property value="id" />"><s:property value="noOfYears" /></div>
										<div class="sel_prof_col spc_skilllevel1" id="skillleveldiv<s:property value="id" />"><s:property value="level" /></div>
										<div class="sel_prof_col spc_notes1" id="notesdiv<s:property value="id" />"><s:property value="notes" /></div>
										
										<div class="sel_prof_col spc_actions_new" style="padding:37px 0 6px;">
										<img src="${ctx}/styles/default/images/exp_entry-edit.gif" title="Edit" alt="Edit" onclick="loadEditOpportunitySkils(<s:property value="id" />)"/>&nbsp;&nbsp;
										<img src="${ctx}/styles/default/images/mobc_redx.gif" title="Remove" alt="Remove" onclick="deleteOpportunitySkills(<s:property value="id" />)" /></div>
									</div>
									</s:iterator>
                                </div>
								<div class="createOpportunityTableRow">
									<div class="createOpportunityTableColCategory">
										<input class="createOpportunityInputNormalWidth" type="text" id="categoryId" style="left:0px;">
										<span id="categoryWarn" style="color: red" class="emplr_rt"></span>
									</div>
									<div class="createOpportunityYearsSelect">
									
									
									
										 <tr>
					 	 	<td class="row" width="10%" style="width:21px;">
							 	<div style="display: none" id="textId">
							    <input type="text" class="city3" id="skillfromlist1"/>
							    </div>
							    <input type="text" id="build_acfb"/>
							    <input type="hidden" id="skillfromlist1" name="skillname"/>
						 	</td>
					 	</tr><!--
									
									
											<s:select name="skillsNeeded_tb" cssStyle="height:27px;"
								       			headerKey="1" headerValue="Select One"
									   			list="skillsList"
									   			listKey="skillname"
									   			listValue="skillname" id="skillfromlist1" >
											</s:select>
											--><span id="skillsWarn" style="color: red" class="emplr_rt"></span>
									</div>
									<div class="createOpportunityTableColYears"  style="width:140px;">
										<input class="createOpportunityInputNormalWidth" name="noOfYears_tb" id="nofYears" 
										value='<s:property value="opportunitySkills.noOfYears"/>' >
										<span id="expWarn" style="color: red" class="emplr_rt"></span>
									</div>
									<div class="createOpportunityTableColLevel">
											<s:select name="level_tb" cssStyle="height:27px;"
										       headerKey="1" headerValue="Select One"
											   list="{'Beginner','Intermediate','Expert','Mastered It!'}"
											   id="skillfromlist2">
											</s:select>
											<span id="skilLevelWarn" style="color: red" class="emplr_rt"></span>
									</div>
									<div class="createOpportunityTableColNotes">
										<input class="createOpportunityInputNotesWidth" type="text" id="notesId">
										<span id="notesWarn" style="color: red" class="emplr_rt"></span>
									</div>
									<div class="createOpportunityTableColButtons">
										<s:hidden name="oppSkillId_tb" id="oppSkillId_tb"/>
										<img src="${ctx}/styles/default/images/create_opportunity_5_add.png" 
										class="add_btn" alt="Add" id="addbtn_opportunity"/>
									</div>
								</div>
							</div>
							<!-- Added for storing deleted rows id's -->
							<div id="deloppodiv"></div>
							
					 </div> 
					 
					
				</div>
				<div class="opportunityFinishButton">
								<input type="image" value="Finish" src="${ctx}/styles/default/images/button_signup_finish.png" 
							  	onclick="return(oppDateValidation())"/>
				</div>
				</form>
			</div>
			<br style="clear: both;">
			</div>
	</div>
	</div>