<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="<c:url value='/styles/default/css/calendar-win2k-cold-2.css'/>" />


<script src="<c:url value='/styles/default/js/calendar.js'/>"	type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/addProfile.js'/>" type="text/javascript"></script>



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
					<div class="signupHeader" style="height: 23px;">
						<div style="width: 200px; float: left;">Welcome <s:property value="%{user.firstName}"/></div>
						<div style="float:right;font-size:11px;">
								<a style="color: #FFFFFF" href="${ctx}/employee/loadEmployeeProfilesList.action"><u>Skip These Questions For Now.</u></a>
						</div>
					</div>
					<form id="editProfForm" action="${ctx}/employee/addProfile.action"  method="post" enctype="multipart/form-data">
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

							
							<!--<input class="profileName" type="text">-->
							<input type="text" class="profileName" style="width:258px;" name="name" id="profilename"/><br/>
							<div class="profileNameDescription" style="padding-top:1px;width:300px;">
								This is the profilename associated with your account.<br/>
								You can create additional profiles at any time.
							</div><br/>
							<div class="inputLabel">Upload a New Photo: </div>
							<div class="inputBar"></div>

							<div style="padding-bottom: 6px; height:160px;width:442px;float:left;">
							<span id="picId" style="color: red;font-siz	e: 15px"></span>
    							
								<img style="float:left;" src="${ctx}/styles/default/images/nophoto.png">
								<div style="float:left; font-size:11px">
									&nbsp;&nbsp;File types accepted: JPG, GIF, PNG, TIF<br/><br/>
									&nbsp;&nbsp;
										<s:file name="upload" size="10" id="uploadpic" />
								</div>
							</div>
							<div class="inputLabel">Work Availability: </div>

							<div class="inputBar"></div><br/>
							<div class="signupQuestions">
								1. What is the <b>timeframe</b> of work you are looking for?<br/>
								<div class="signupAnswers"><br/>
																		
									<s:iterator value="workTimeFrameList">
									
									    <s:checkbox name="worktimeframe1"  fieldValue='%{worktimeframename}'/>
									    <s:property value="worktimeframename"/>
									
									</s:iterator>
								</div>
								2. What <b>salary range</b> are you looking for?<br/>
								<div class="signupAnswers"><br/>
									<s:select cssStyle="margin: 0px 5px 5px 0px; float: left;" name="salarytype1"
										          headerKey="1"          headerValue="Please Select"
			      						          list="salaryTypeList"  listKey="type"
			     						          listValue="type" onchange="checkSalaryType(this.value)">
										</s:select><!--
								<input type='text' style="width:100px" name='range1' id='hourlyrange'/>
									--><input class="salaryInput" type="text" name='range1' id='hourlyrange'>
									e.g. $40,000/year, $20/hour
								</div>
								3. What days are you available for work?<br/>

								<div class="signupAnswers">
									<!--<h5>What days are you available for work?</h5>-->
									<s:iterator value="daysList">	
									<div class="dayofweekPair">
									<h5><s:property value="name"/></h5><s:checkbox name="days1" fieldValue="%{name}"/>
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
							
							</div>
							
							<div class="workExperienceHeader">
								<div class="workexperiencecol"><input class="workexperienceinputstyle" name="organizationname2" type="text" id="companyname_txtbox"/></div>
								<div class="workexperiencecol"><input class="workexperienceinputstyle" name="descriptions1" type="text" id="description_txtbox"/></div>
								<div class="workexperiencecol">				
									<input class="txt" type="text" id="workStart_txtbox"  style="width:67px" name="Started"/>
									<img class="workExperienceIcon" src="${ctx}/styles/default/images/icon_calendar.png" id="f_trigger_c"  title="Date selector"/>					        
									<script type="text/javascript">
									    Calendar.setup({
									        inputField     :    "workStart_txtbox",     // id of the input field
									        ifFormat       :    "%m/%d/%Y",      // format of the input field
									        button         :    "f_trigger_c",  // trigger for the calendar (button ID)
									        align          :    "Tl",           // alignment (defaults to "Bl")
									        singleClick    :    true
									    });
									</script>
								</div>	
								<div class="workexperiencecol">		
											<input  type="text" id="workEnd_txtbox" class="txt" style="width:67px" name="Started"/>
									<img src="${ctx}/styles/default/images/icon_calendar.png" id="f_trigger_c1"  title="Date selector"/>
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
							</div>
								
							<div>
							
							<!--<div class="f_col smish">
									<img style="padding-left:325px;padding-top: 10px" src="${ctx}/styles/default/images/button_addjob.png" 
									onclick="return addExperience1()"/>
									</div>
							
							--><div class="f_col smish">
							<!--<img style="padding-left:325px;padding-top: 10px"  src="${ctx}/styles/default/images/button_addjob.png"  onclick="return (addExperiencetest())"/>
							   <s:submit type= "image" src="${ctx}/styles/default/images/button_addjob.png" onclick="return(addExperience1())"/>-->
							   <img id="add_btn1" style="padding-left:325px;padding-top: 10px" src="${ctx}/styles/default/images/button_addjob.png" onclick="return addExperience1();" />
								</div>
							
							
							
							
							<br/>
							<div class="inputLabel">Personal Statement: </div>

							<div class="inputBar"></div>

							<textarea class="personalStatement"  name="personalStatement"></textarea>

						</div>
							</div>
									</div>
					
				
					<div class="continueToSignup1">
						<div class="pageWording1">Page 1 of 3</div>
						 <s:submit type= "image" src="${ctx}/styles/default/images/button_signup_continue.png" onclick="return(addProfile())"/>
					</div>
			
					</form>
						</div>
			</div>
			<br style="clear: both;">
		</div>
	</div>
	




<br class="clear-both" />
<script>
setPercAnsweredTo(33);
</script>
