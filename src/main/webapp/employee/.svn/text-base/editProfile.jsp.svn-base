<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="<c:url value='/styles/default/css/calendar-win2k-cold-2.css'/>"/>
 


<script src="<c:url value='/styles/default/js/editProfile.js'/>" type="text/javascript"></script>

<script src="<c:url value='/styles/default/js/calendar.js'/>" type="text/javascript"></script>
 	

<style>
.startdatetxt
{
float: right;
top: 100px;
margin-top:2px;
margin-right:5px; 


}
.enddatetxt{
float: right;
top: 100px;
margin-top:2px;
}
</style>



<div id="bc_main_outer">
	<div id="create_opportunity">
		<div id="bc_main_outer">
			<div id="bc_main_mid">

				<div class="signupBorder">
					<div class="signupHeader" style="padding:5px 0px 15px 13px;">
						<span style="float: left; width: 778px;">Welcome <s:property value="%{user.firstName}"/>!</span>
						<span style="font-size: 11px;float:right;width: 317px;margin-top:-22px;">
						<img  style="float: left; margin-left:-25px;" src="${ctx}/styles/default/images/lock-icon.png"  >
						  <a style="color: #FFFFFF" href="${ctx}/employee/privacy.action?profile.id=<s:property value="profile.id"/>">Privacy Settings</a>
						  </span>
						<span style="font-size: 11px; ">
						
							<a style="color: #FFFFFF" href="${ctx}/employee/loadEmployeeProfilesList.action"><u>Skip these questions for now</u></a>
						</span>
					</div>
					<form id="editProfForm" action="${ctx}/employee/editNextEducationProfile.action"  method="post" enctype="multipart/form-data" >
						<s:hidden name="user.id"/>
						<s:hidden name="profile.id"/>
						<s:hidden name="user.id" value="%{user.id}"/>
					<div class="employeeSignupInfoRequest">
						Please tell us a little bit about yourself.
					</div>

					<div class="employeeSignupTabRow">
						<div class="employeeSignupTabSelected">1</div>
						<div class="employeeSignupTab">2</div> 
						<div class="employeeSignupTab">3</div>
					</div>
					<div class="employeeSignupTabContent">
					
						<div class="employeeSignupContentLeftTab">

							<div class="inputLabel">Name of Your Profile: </div>
							
							<span style="display:none;margin-top: 30px;color: red" id="profileNameId">                    
					                    	<h5>Please enter name of your profile</h5>
					                    </span>
					                    <span style="display:none;margin-top: 30px;color: red" id="profileNameId1">                    
					                    	<h5>Should have less than 45 characters</h5>
					                    </span>
		                             
							
							<s:textfield cssStyle="width:258px;" cssClass="profileName" name="profile.name" id="profilename"></s:textfield>
							
							<div class="profileNameDescription" style="padding-top:1px;width:300px;">
								This is the profilename associated with your account.<br/>
								You can create additional profiles at any time.
							</div><br/>
							<div class="inputLabel">Upload a New Photo: </div>
							<div class="inputBar"></div>
	                  		<div class="editPhotoBox">
								<s:if test="profile.picture!=null">					   
									<img style="float:left;" src='<s:property value="resizedMidImage"/>' alt="N/A"  align="top"/>
								</s:if>
								<s:else>
									<img style="float:left;" src="${ctx}/styles/default/images/nophoto.png" alt=""/>
								</s:else>
								<div class="profilePicUpload">
									File types accepted: JPG, GIF, PNG, TIF<br/><br/>
									<s:file name="upload" size="10" cssClass="txt xlg" id="uploadpic"/>
								</div>
							</div>
							<div class="clear-both"></div>
							<div class="inputLabel">Work Availability: </div>

							<div class="inputBar"></div><br/>
							<div class="signupQuestions">
								1. What is the <b>timeframe</b> of work you are looking for?<br/>
								<div class="signupAnswers">
									<br>
									<s:iterator value="workTimeFrameList" status="status">
										<s:checkbox name="worktimeframe1" fieldValue="%{worktimeframename}" value="%{worktimeframename in checkBoxList}"/>
										<s:property value="worktimeframename"/>&nbsp;
									</s:iterator>
								</div>
								2. What <b>salary range</b> are you looking for?<br/>
								<div class="signupAnswers">
									<br>
									<s:select cssStyle="margin: 0px 5px 5px 0px; float: left;" 										         									         
							          	name="salarytype1"
										list="salaryTypeList"
										listKey="type"
									  	listValue="type" value="profile.salaryType" disabled="false" id="yearlytype" onchange="checkSalaryType(this.value)">
									</s:select>
									<input class="salaryInput" type="text" id="hourlyrange" name="range1" style="width:100px">
									e.g. $40,000/year, $20/hour
								</div>
								3. What days are you available for work?<br/>

								<div class="signupAnswers">
									<s:iterator value="daysList">	
										<div class="dayofweekPair">
											<b><s:property value="name"/></b><br/>
											&nbsp;<s:checkbox name="days1" fieldValue="%{name}" value="%{name in ckBoxList}"/>											
										</div>
									</s:iterator>
								</div>

							</div>
						</div>
						<div class="employeeSignupContentRightTab">
							<div class="inputLabel">Work Experience: </div>						
							<div class="inputBar"></div>
							
							<div class="workExperienceHeader">
								<div class="workexperiencecol"><b>Company Name</b></div>
								<div class="workexperiencecol"><b>Title/Position</b></div>
								<div class="workexperiencecol"><b>From</b></div>
								<div class="workexperiencecol"><b>To</b></div>
							</div>
								
							<div id="currentWorkExp">
								<span id="validateWorkExp" style="color: red;"></span>
								<s:iterator value="workExperienceList">	
								<div class="workExperienceRowDan" id="expdiv<s:property value='id'/>">
									<input type="hidden" id="id<s:property value='id'/>" name="id" value=<s:property value="id"/> >
									<input type="hidden" id="employer<s:property value='id'/>" name="employerName" value=<s:property value="employerName"/> >
									<input type="hidden" id="description<s:property value='id'/>" name="description" value=<s:property value="description"/> >
									<input type="hidden" id="workstart<s:property value='id'/>" name="workStart" value=<s:date name="workStart" format="MM/dd/yyyy"/> >
									<input type="hidden" id="workend<s:property value='id'/>" name="workEnd" value=<s:date name="workEnd" format="MM/dd/yyyy"/> >
										
									<div class="workexperiencecol" id="employerdiv<s:property value='id'/>"><s:property value="employerName"/></div>
									<div class="workexperiencecol" id="descriptiondiv<s:property value='id'/>"><s:property value="description"/></div>
									<div class="workexperiencecol" id="workstartdiv<s:property value='id'/>"><s:date name="workStart" format="MM/dd/yyyy"/></div>
									<div class="workexperiencecol" id="workenddiv<s:property value='id'/>"><s:date name="workEnd" format="MM/dd/yyyy"/></div>								 
									
									<img src="${ctx}/styles/default/images/exp_entry-remove.gif" alt="remove" onclick="deleteWorkExperience('<s:property value="id"/>')" />
								</div>
								</s:iterator>
							</div>
							
							<div id="deldiv"></div>
						
							<div class="workExperienceHeader">
								<div class="workexperiencecol"><input class="workexperienceinputstyle" name="organizationname" type="text" id="companyname_txtbox"/></div>
								<div class="workexperiencecol"><input class="workexperienceinputstyle" name="descriptions" type="text" id="description_txtbox"/></div>
							    <div class="workexperiencecol"><input type="text" class="workexperiencedateinputstyle"  id="workStart_txtbox" name="startDate" value="mm/dd/yyyy"/>
								<img src="${ctx}/styles/default/images/icon_calendar.png" id="f_trigger_c" class="workExperienceIcon"  title="Date selector"/></div>				        
	                        		<script type="text/javascript">
									    Calendar.setup({
									        inputField     :    "workStart_txtbox",     // id of the input field
									        ifFormat       :    "%m/%d/%Y",      // format of the input field
									        button         :    "f_trigger_c",  // trigger for the calendar (button ID)
									        align          :    "Tl",           // alignment (defaults to "Bl")
									        singleClick    :    true
									    });
									</script>
								<div class="workexperiencecol"><input type="text" style="width:65px" id="workEnd_txtbox" style="width:67px" class="workexperiencedateinputstyle" name="endDate" value="mm/dd/yyyy"/>
		                        <img src="${ctx}/styles/default/images/icon_calendar.png" id="f_trigger_c1" class="workExperienceIcon"  title="Date selector"/></div>				        
	                        		<script type="text/javascript">
									    Calendar.setup({
									        inputField     :    "workEnd_txtbox",     // id of the input field
									        ifFormat       :    "%m/%d/%Y",      // format of the input field
									        button         :    "f_trigger_c1",  // trigger for the calendar (button ID)
									        align          :    "Tl",           // alignment (defaults to "Bl")
									        singleClick    :    true
									    });
									</script>
							</div>    
								
							<div>
						
							<img id="add_btn" style="padding-left:325px;padding-top: 10px" src="${ctx}/styles/default/images/button_addjob.png"></div>
							<br/>
							<div class="inputLabel">Personal Statement: </div>

							<div class="inputBar"></div>
							<div class="personalStatement" id="personal_textarea">
							<s:textarea rows="5" name="profile.personalStatement" cssStyle="width:400px"></s:textarea>										
						</div>
							</div>
					
					</div>
					<div class="continueToSignup1">
						<div class="pageWording">Page 1 of 3</div>
						
                 <s:submit type= "image" src="${ctx}/styles/default/images/button_signup_continue.png" onclick="return(editProfile())"/>
            
					</div>
					
					  </form>       
				</div>
					
			</div>
			<br style="clear: both;">
		</div>
	</div>
	

