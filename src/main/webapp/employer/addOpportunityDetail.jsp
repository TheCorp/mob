<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="<c:url value='/styles/default/css/calendar-win2k-cold-2.css'/>" />


<script src="<c:url value='/styles/default/js/opportunitySkills.js'/>"	type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/opportunity.js'/>"type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/calendar.js'/>" type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/jquery.oop.bgiframe.min.js'/>" type="text/javascript"></script>

<div id="bc_main_outer">
	<div id="create_opportunity">
		<div id="bc_main_outer">
			<div id="bc_main_mid">
			 <s:hidden key="id" name="profile.id"></s:hidden>
     		 <form id="addOpportunityForm" action="${ctx}/employer/createOpportunity.action" class="opportunityForm" method="post">
				<div class="createOpportunitySignupBorder">
					<div class="signupHeader">
						Create Opportunity from <s:property value="employer.organizationName"/>, Inc.
					</div>
					 <s:hidden key="selectedDefaultProfile" name="selectedDefaultProfile"></s:hidden>
					<div class="createOpportunityContent">
				
							<div class="createOpportunityUpperLeft">
								<div class="createOpportunityInputLabel"><font color="red">*&nbsp;</font>Job Name:</div>
							    <input class="createOpportunityInputExtraWidth" type="text" name="opportunity.str_job_name" id="jodNameId">
							    <span class="emplr_rt" id="oppId" style="color: red;"></span>
							    
							    <div style="width: 300px; float: left;">
									<div class="createOpportunityInputLabel"><font color="red">*&nbsp;</font>Position Title:</div>
									<input class="createOpportunityInputNormalWidth" type="text"  name="opportunity.title"  id="PositionTextId">
									<span id="PositionId" style="color: red" class="emplr_rt"></span>
								</div>
								
								<div class="createOpportunityInputLabel">Job Type:</div>
								<div class="createOpportunitySelectNormalWidth">
									<s:select name="opportunity.str_job_type"
									headerKey="1" headerValue="--Please Select--"
		      						list="jobTypeList" listKey="jobTypeName"listValue="jobTypeName"></s:select>
								</div>
								<div style="width: 300px; float: left;">
									<div class="createOpportunityInputLabel">Education Required:</div>
										<s:select  name="opportunity.str_education_requirment" headerKey="1" headerValue="--Please Select--"
		     							list="educationRequiredList" listKey="educationrequired" listValue="educationrequired"></s:select><!--	
									<input class="createOpportunityInputNormalWidth" type="text" name="opportunity.str_education_requirment" id="educationText">
									--><span id="requirementsId" style="color: red" class="emplr_rt"></span>
								</div>
								<div class="createOpportunityInputLabel">Salary Range:</div>
								<div class="createOpportunitySelectNormalWidth">
									<s:select  name="opportunity.str_salary_range" headerKey="1" headerValue="--Please Select--"
		     							list="salaryList" listKey="range" listValue="range"></s:select>	
								</div>
							</div>
							
							<div class="createOpportunityUpperRight">
								<div class="createOpportunityInputLabel">Work Hours:</div>
									<s:select id="workhoursId"  onchange="WorkHours()" name="workingHours"
									headerKey="1" headerValue="--Please Select--"
		      						list="workHoursList" listKey="workhours"listValue="workhours"></s:select>
								
								<!--<input class="createOpportunityInputNormalWidth" type="text" name="opportunity.contactperson" id="contactpersonId">
								<div style="color: #B6B6B6;font-size: 11px;margin-left:125px;">e.g. John Doe</div>-->
								<span id="contPersId" style="color: red" class="emplr_rt"></span>
									
								
							<div class="createOpportunityInputLabel1">
							<div id="workhours_textbox" style="display: none;">	
								<input class="createOpportunityInputNormalWidth" type="text" name="workingHours_Others" id="workingText">
							
								</div></div>
								
								<!--
								<div class="createOpportunityInputLabel">Working Hours:</div>
								<input class="createOpportunityInputNormalWidth" type="text" name="opportunity.workingHours" id="workingText">
								-->
								<span id="workingHoursId" style="color: red" class="emplr_rt"></span>
								
								<div style="float:left;width:300px;margin-top:14px;">						
									<div class="createOpportunityInputLabel">Start Date:</div>
									<s:textfield cssClass="txt md" cssStyle="width:100px" name="opportunity.createdDate" id="startDate"/>
		    					    <img src="${ctx}/styles/default/images/icon_calendar.png" id="f_trigger_c1"  title="Date selector"/>					        
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
									<div class="createOpportunityTextArea">
								<!-- <input class="createOpportunityTextArea" type="textarea" name="opportunity.str_benefits" id="benefitsText"> -->
								  <s:textarea rows="5" name="opportunity.str_benefits" id="benefitsText"  cssStyle="width:750px;height:94px;"></s:textarea>
								  </div>
								<div id="benefitsId" style="color: red" class="emplr_rt"></div>
								
								<div class="createOpportunityInputLabel"><font color="red">*&nbsp;</font>Job Description:</div>
							<!-- <input class="createOpportunityTextArea" type="textarea" name="opportunity.description" id="descId"> -->	
								<div class="createOpportunityTextArea">
								  <s:textarea rows="5" name="opportunity.description" id="descId"  cssStyle="width:750px;height:94px;"></s:textarea> </div>
								<div id="oppId1" style="color: red" class="emplr_rt"></div>
									
								<div class="createOpportunityInputLabel">Application Criteria:</div>
								<!--<input class="createOpportunityTextArea" type="textarea" name="opportunity.str_job_application_criteria" >
								  -->
								<div class="createOpportunityTextArea">
								 <s:textarea rows="5" name="opportunity.str_job_application_criteria" id="descId"  cssStyle="width:750px;height:94px;"></s:textarea>
								  </div>
								<div class="emplr_rt" id="criteId" style="color: red"></div>
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
								
                               <div class="createOpportunityTableEntryRow1" id="opportunity_list"></div>
								
								<div class="createOpportunityTableRow">
									   <div class="createOpportunityTableColCategory">
										 <input class="createOpportunityInputNormalWidth" type="text" 
										 name="opportunitySkills.category"  id="categoryId" style="left:0px;">
									   	 <span id="categoryWarn" style="color: red" class="emplr_rt"></span>	
									   </div><!--
                           
                             <div class="createOpportunityYearsSelect">
	                     		<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r">
								<input type="hidden" name="skillname" value=<s:property value="skillname"/> />
							   
								</span></span></span>
								</div>
					 	-->
					 	<div class="createOpportunityYearsSelect">
						 <tr>
					 	 	<td class="row" width="10%" style="width:21px;">
							 	<div style="display: none" id="textId">
							    <input type="text" class="city3" id="skillfromlist1"/>
							    </div><!--
							    <input type="text" id="build_acfb"/>
							    <input type="text" id="skillfromlist1" name="skillname"/>
						 	--></td>
					 	</tr>
	                                   		<!--<s:select name="opportunitySkills.skillsNeeded" cssStyle="height:27px;"
								       			headerKey="1" headerValue="Select One"
									   			list="skillsList"
									   			listKey="skillname"
									   			listValue="skillname" id="skillfromlist1">
											</s:select>
											--><span id="skillsWarn" style="color: red" class="emplr_rt"></span>
										</div>
										
										<div class="createOpportunityTableColName" style="width:140px;">
											<input class="createOpportunityInputNormalWidth" type="text" name="opportunitySkills.noOfYears" id="nofYears">
											<span id="expWarn" style="color: red" class="emplr_rt"></span>
										</div>
										<div class="createOpportunityTableColLevel">
											<div class="createOpportunitySkillSelect">
												<s:select name="opportunitySkills.level" cssStyle="height:27px;"
										       headerKey="1" headerValue="Select One"
											   list="{'Beginner','Intermediate','Expert','Mastered It!'}"
											   id="skillfromlist2">
											</s:select>
											<span id="skilLevelWarn" style="color: red" class="emplr_rt"></span>
											</div>
										</div>
										<div class="createOpportunityTableColNotes">
											<input class="createOpportunityInputNotesWidth" type="text"  name="opportunitySkills.notes" id="notesId">
											<span id="notesWarn" style="color: red" class="emplr_rt"></span>
										</div>
										<div class="createOpportunityTableColButtons">
											<img  style="padding-top:4px" id="add_btn" class="add_btn" src="${ctx}/styles/default/images/create_opportunity_5_add.png" 
											onclick="addOpportunitySkills()"/>
										</div>
								</div>
							</div>
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
<!--#include file="mobc_footer.html"-->