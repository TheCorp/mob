<%@ include file="/common/taglib.jsp"%>

<link rel="stylesheet" type="text/css" href="<c:url value='/styles/default/css/calendar-win2k-cold-2.css'/>" />

<script src="<c:url value='/styles/default/js/calendar.js'/>" type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/calendar_yearsback.js'/>"	type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/signUpPage.js'/>"	type="text/javascript"></script>
<script type="text/javascript">
function displayChoice(){
	display('<s:property value="accountType"/>');
}
</script>
<div id="bc_main_outer">
	<div id="create_opportunity">
		<div id="bc_main_outer" >
			<div id="bc_main_mid"  style="height:621px;">
				<div class="signupHomeTitle"><b>Signup for a free account </b>
					<font style="font-size:11px;">&nbsp;&nbsp;Already a memeber?<a style="color: #FFFFFF" href="${ctx}/public/landingpage.action"> <u>Login</u></a></font>
				</div>
				<form id="regForm" action="" onsubmit="return jcap();"  method="post" 	enctype="multipart/form-data">
				<div class="signupAccountSwitch">
			         CHANGE ACCOUNT TYPE: <br/><br/>
					<select id="myList"  onchange="display()" style="width: 200px">
						<option value="Please select...">Please select...</option>
						<option value="Employee">Employee</option>
						<option value="Employer">Employer</option>
					</select>
				</div>
			    <div id="restofregform" style="display: none;">	
					<div class="initialSignupHeader">
						Employee Signup:
					</div>
					<div class="centerThisDiv">
						<div class="employeeSignupLeftCol">
							<div class="labelInput"><font color="red">*&nbsp;</font>First Name:</div>
							<div class="lt">
								<input type="text" tabindex="1" id="firstName" name="user.firstName" class="employeeSignupInput"/>
							</div>
							<div class="rt">
								<div id="imageArea"></div>
								<div id="messageArea"></div>
							</div>
							<div class="labelInput"><font color="red">*&nbsp;</font>Email:</div>
							<div class="lt">
								<input type="text" tabindex="3" id="email" name="user.email" class="employeeSignupInput" 
								onfocus="validate('firstName','imageArea','messageArea');
								validate('lastName','imageArea1','messageArea1');" />
							</div>
							<div class="rt">
								<div class="check" id="imageArea2"></div>
								<div class="expl" id="messageArea2"></div>
							</div>
							<div class="labelInput"><font color="red">*&nbsp;</font>Password:</div>
							<div class="lt">
								<input type="password" tabindex="5" id="password" name="user.password" class="employeeSignupInput" 
								onfocus="CheckEmailForSignup('email','imageArea2','messageArea2');
								CheckReEnterEmail('reEnteredEmail','imageArea222','messageArea222');
								validate('lastName','imageArea1','messageArea1');validate('firstName','imageArea','messageArea');" />
							</div>
							<div class="rt">
								<div class="check" id="imageArea5"></div>
								<div class="expl" id="messageArea5"></div>
							</div>
							<div class="labelInput">Address Line 1:</div>
							<div class="lt">
							<input type="text" tabindex="7" name="user.address1" class="employeeSignupInput" id="address1" 
								onfocus="confirmPwd('imageArea555','messageArea555'); validatePwd('imageArea5','messageArea5');
								CheckEmailForSignup('email','imageArea2','messageArea2');
								CheckReEnterEmail('reEnteredEmail','imageArea222','messageArea222');
								validate('lastName','imageArea1','messageArea1');validate('firstName','imageArea','messageArea');"/>
							</div>
							<div class="rt">
								<div class="check" id="address1empimageArea"></div>
								<div class="expl" id="address1empmessageArea"></div>
							</div>
							<div class="labelInput">City:</div>
							<div class="lt">
								<input type="text" tabindex="9" name="user.city" class="employeeSignupInput" id="empCity"
								 onfocus="validateEmprAddress('address1','address1empimageArea','address1empmessageArea');
								 confirmPwd('imageArea555','messageArea555');CheckReEnterEmail('reEnteredEmail','imageArea222','messageArea222');
								 validatePwd('imageArea5','messageArea5');CheckEmailForSignup('email','imageArea2','messageArea2');
								 validate('lastName','imageArea1','messageArea1');validate('firstName','imageArea','messageArea');
								" />
							</div>
							<div class="rt">
								<div class="check" id="imageArea6"></div>
								<div class="expl" id="messageArea6"></div>
							</div>
							<div class="labelInput">Birthdate:</div>
							<div class="lt">
								<table cellspacing="0" cellpadding="0" style="border-collapse: collapse">
									<tr>
										<td><input type="text" tabindex="12" style="width: 119px; margin-right: 5px;" class="employeeSignupInputBirthDate" 
										id="dob" name="user.dob" onfocus="validateEmpCity('empCity','imageArea6','messageArea6');
										validateEmprAddress('address1','address1empimageArea','address1empmessageArea');
										validateEmprAddress('address2','address2empimageArea','address2empmessageArea');
										CheckReEnterEmail('reEnteredEmail','imageArea222','messageArea222');
										CheckEmailForSignup('email','imageArea2','messageArea2');validate('lastName','imageArea1','messageArea1');
										validate('firstName','imageArea','messageArea');" /></td>
										<td><img src="${ctx}/styles/default/images/icon_calendar.png" id="f_trigger_c" title="Date selector" /></td>
									</tr>
								</table>
								<script type="text/javascript">
								
			                        Calendar.setup({
								        inputField     :    "dob",           // id of the input field
								        ifFormat       :    "%m/%d/%Y",      // format of the input field
								        button         :    "f_trigger_c",  // trigger for the calendar (button ID)
								        align          :    "Tl",           // alignment (defaults to "Bl")
								        singleClick    :    true
								    });
		                      					   
								</script>
								
							</div>
							<div class="rt">
								<div class="check" id="dobimageArea"></div>
								<div class="expl" id="dobmessageArea"></div>
							</div>
							<div class="labelInput">Skype ID:</div>
							<div class="lt">
								<input type="text" tabindex="14" name="user.skypeId" class="employeeSignupInput" id="skypeId" 
								onfocus="confirmPwd('imageArea555','messageArea555');
								CheckReEnterEmail('reEnteredEmail','imageArea222','messageArea222');validateEmprAddress('address2','address2empimageArea','address2empmessageArea');
								validateEmprAddress('address1','address1empimageArea','address1empmessageArea');
								validateEmpCity('empCity','imageArea6','messageArea6');
								validatePwd('imageArea5','messageArea5');CheckEmailForSignup('email','imageArea2','messageArea2');
								validate('lastName','imageArea1','messageArea1');validate('firstName','imageArea','messageArea');
								checkDateForSignup('dob','dobimageArea','dobmessageArea');validatePhoneNumber('phoneNumberId','pnImageArea','pnMessageArea');
								validateEmpZipCode('empZipCode','imageArea8','messageArea8');"/> 
							</div>
							<div class="rt">
								<div class="check" id="imageArea9"></div>
								<div class="expl" id="messageArea9"></div>
							</div>
						</div>
					
						<div class="employeeSignupRightCol">
							<div class="labelInput"><font color="red">*&nbsp;</font>Last Name:</div>
							<div class="lt">
								<input type="text" tabindex="2" id="lastName" name="user.lastName" class="employeeSignupInput" 
								onfocus="validate('firstName','imageArea','messageArea');" />
							</div>
							<div class="rt">
								<div class="check" id="imageArea1"></div>
								<div class="expl" id="messageArea1"></div>
							</div>
							<div class="labelInput"><font color="red">*&nbsp;</font>Re-Enter Email:</div>
							<div class="lt">
								<input type="text" tabindex="4" id="reEnteredEmail" name="reEnteredEmail" class="employeeSignupInput" 
								onfocus="CheckEmailForSignup('email','imageArea2','messageArea2');
								validate('lastName','imageArea1','messageArea1');validate('firstName','imageArea','messageArea');" />
							</div>
							<div class="rt">
								<div class="check" id="imageArea222"></div>
								<div class="expl" id="messageArea222"></div>
							</div>
							<div class="labelInput"><font color="red">*&nbsp;</font>Confirm Password:</div>
							<div class="lt">
								<input type="password" tabindex="6" id="confirmPassword" name="confirmPassword" class="employeeSignupInput" 
								onfocus="validatePwd('imageArea5','messageArea5');CheckReEnterEmail('reEnteredEmail','imageArea222','messageArea222');
								CheckEmailForSignup('email','imageArea2','messageArea2');validate('lastName','imageArea1','messageArea1');
								validate('firstName','imageArea','messageArea');" />
							</div>
							<div class="rt">
								<div class="check" id="imageArea555"></div>
								<div class="expl" id="messageArea555"></div>
							</div>
							<div class="labelInput">Address Line 2:</div>
							<div class="lt">
							<input type="text" tabindex="8" name="user.address2" class="employeeSignupInput" id="address2" 
								onfocus="validateEmpCity('empCity','imageArea6','messageArea6');validateEmprAddress('address1','address1empimageArea','address1empmessageArea');
								confirmPwd('imageArea555','messageArea555'); validatePwd('imageArea5','messageArea5');
								CheckEmailForSignup('email','imageArea2','messageArea2');
								CheckReEnterEmail('reEnteredEmail','imageArea222','messageArea222');
								validate('lastName','imageArea1','messageArea1');validate('firstName','imageArea','messageArea');"/>
							</div>
							<div class="rt">
								<div class="check" id="address2empimageArea"></div>
								<div class="expl" id="address2empmessageArea"></div>
							</div>
							<div class="labelInput">State and Zip Code:</div>
						     <s:select  
							    name="user.state" tabindex="10" cssClass="txt" id="empState_1.6" cssStyle="font-size: 12px;width:55px;"
							    headerKey="1"
							    headerValue="Select"
							    list="states"/>
							<input type="text" tabindex="11" name="user.zipcode" class="employeeSignupInputZip" id="empZipCode" 
								onfocus="validateEmprAddress('address2','address2empimageArea','address2empmessageArea');
								validateEmprAddress('address1','address1empimageArea','address1empmessageArea');
								confirmPwd('imageArea555','messageArea555');CheckReEnterEmail('reEnteredEmail','imageArea222','messageArea222');
								validateEmpCity('empCity','imageArea6','messageArea6');
								validatePwd('imageArea5','messageArea5');CheckEmailForSignup('email','imageArea2','messageArea2');
								validate('lastName','imageArea1','messageArea1');validate('firstName','imageArea','messageArea');" 
								onblur="return validateEmpZipCode('empZipCode','imageArea8','messageArea8');" />	
							<div class="rt">
								<div class="check" id="imageArea8"></div>
								<div class="expl" id="messageArea8"></div>
								<div class="check" id="imageArea7"></div>
								<div class="expl" id="messageArea7"></div>
							</div>
							<div class="labelInput">Phone Number:</div>
							<div class="lt">
								<input type="text" tabindex="13" name="user.phoneNumber" class="employeeSignupInput" id="phoneNumberId" onfocus="confirmPwd('imageArea555','messageArea555');
								CheckReEnterEmail('reEnteredEmail','imageArea222','messageArea222');validateEmprAddress('address2','address2empimageArea','address2empmessageArea');
								validateEmprAddress('address1','address1empimageArea','address1empmessageArea');
								validateEmpCity('empCity','imageArea6','messageArea6');
								validatePwd('imageArea5','messageArea5');CheckEmailForSignup('email','imageArea2','messageArea2');
								validate('lastName','imageArea1','messageArea1');validate('firstName','imageArea','messageArea');
								checkDateForSignup('dob','dobimageArea','dobmessageArea');
								validateEmpZipCode('empZipCode','imageArea8','messageArea8');" onblur="return validatePhoneNumber('phoneNumberId','pnImageArea','pnMessageArea');" />
						    </div>
							<div class="rt">
								<div class="check" id="pnImageArea"></div>
								<div class="expl" id="pnMessageArea"></div>
							</div>
							<div class="labelInput">Gender:</div>
					    	<div class="lt">
								<select name="user.sex" tabindex="15">
									<option value="Male">Male</option>
									<option value="Female">Female</option>
								</select>
							</div>
						</div>
						<div class="clear-both"></div>
						<div class="labelInput"><font color="red">*</font>&nbsp;Image Verification:</div>
				 		<div class="imagechange" style="padding-top: 3px;"><u style="cursor: pointer" onclick="sjcap('Employee');">Click</u> to change image<br/></div>
						<div class="lt">
							<div id="empeecaptcha"></div>
							<div class="check" id="imageAreaVcode"></div>
							<div class="expl" id="messageAreaVcode"></div>
						</div>
						
						<div class="acceptTermsOfService" style="padding-top:3px;">
							<input id="acceptEmployeeCondi" type="checkbox" tabindex="17">&nbsp;
							I have read, and I accept, My Own Briefcase's terms of use and privacy policy.
							<br/><span id="acceptTermsOfServiceWarnMsgEmployee" style="color:red;"></span>
						</div>
						<div class="joinForFreeCenterButton">
							<input id="finish_button" type="image" value="Finish" src="${ctx}/styles/default/images/joinforfree_red-up.png" onclick="return(checkForm())" />
						</div>
					</div>
				</div>
			<div id="restofregform3" style="display: none;">			
						
				<div class="initialSignupHeader">
					Employer Signup:
				</div>
				
			
				<div class="centerThisDiv">
					
					<div class="employeeSignupLeftCol">
						<div class="labelInput"><font color="red">*</font>&nbsp;Company Name:</div>
						<input  class="employeeSignupInput" type="text" tabindex="1" name="employer.organizationName" 
						class="imgtext" id="organizationName" />
						
						<div class="fieldError_1.6">
								<div class="check" id="imgArea"></div>
						<div class="expl" id="msgArea"></div>
					   </div>
					   
					   
						<div class="labelInput"><font color="red">*&nbsp;</font>Email:</div>
					
						<input class="employeeSignupInput" type="text" tabindex="3" name="employer.email" class="imgtext" 
							id="emailId" onfocus="validateEmployer('organizationName','imgArea','msgArea');
							validateEmprState('nameURL','imageArea88','msgArea88');"/>
					
						<div class="rt">
							<div class="check" id="imageArea11"></div>
							<div class="expl" id="msgArea11"></div>
						</div>
						
						<div class="labelInput"><font color="red">*&nbsp;</font>Password:</div>
					
						<input class="employeeSignupInput" type="password" tabindex="5" name="employer.password" class="imgtext" 
						id="emplrpassword" onfocus="reEnterEmprEmail('reEnterEmployeremail','imageArea111','msgArea111');
						checkEmprEmail('emailId','imageArea11','msgArea11');validateEmployer('organizationName','imgArea','msgArea');
						validateEmprState('nameURL','imageArea88','msgArea88');" />
						<div class="rt">
							<div class="check" id="imageArea22"></div>
							<div class="expl" id="msgArea22"></div>
						</div>
						
						<div class="labelInput">Address Line 1:</div>
						<input class="employeeSignupInput" type="text" tabindex="7" name="employer.address1" class="imgtext" id="address1Id"
							onfocus="validateEmprPwd('imageArea22','msgArea22');confirmEmprPwd('confirmimageArea22','confirmmsgArea22');
							reEnterEmprEmail('reEnterEmployeremail','imageArea111','msgArea111');
							checkEmprEmail('emailId','imageArea11','msgArea11');validateEmployer('organizationName','imgArea','msgArea');
							validateEmprState('nameURL','imageArea88','msgArea88');"><br/>
						<div class="rt">
							<div class="check" id="address1imageArea"></div>
							<div class="expl" id="address1msgArea"></div>
						</div>
					
						<div class="labelInput">City:</div>
						<input class="employeeSignupInput" type="text" tabindex="9" name="employer.city" class="txt" id="emprCity" 
							onfocus="confirmPwd('imageArea555','messageArea555');validateEmprAddress('address1Id','address1imageArea','address1msgArea');
							CheckReEnterEmail('reEnteredEmail','imageArea222','messageArea222');
							validatePwd('imageArea5','messageArea5');validateEmprState('nameURL','imageArea88','msgArea88');" />
						<div class="rt">
							<div class="check" id="imageAreaCity"></div>
							<div class="expl" id="messageAreaCity"></div>
						</div>
						
						<div class="labelInput">Phone Number:</div>
						<!--<div class="lt">-->
							<input type="text" name="employer.phoneNumber" tabindex="12" class="txt" id="emplrphoneNumberId" 
							onfocus="validateEmpZipCode('emplrZipCode','emplrZipimageArea','emplrZipmessageArea');
							validateEmprCity('emprCity','imageAreaCity','messageAreaCity');
							validateEmprPwd('imageArea22','msgArea22');confirmEmprPwd('confirmimageArea22','confirmmsgArea22');
							validateEmprAddress('address1Id','address1imageArea','address1msgArea');
							validateEmprAddress('address2Id','address2imageArea','address2msgArea');
							reEnterEmprEmail('reEnterEmployeremail','imageArea111','msgArea111');
							checkEmprEmail('emailId','imageArea11','msgArea11');validateEmployer('organizationName','imgArea','msgArea');
							validateEmprState('nameURL','imageArea88','msgArea88');"
							onblur="return validatePhoneNumbernew('emplrphoneNumberId','pnImageArea5','pnMessageArea5');" />
						<!--</div>-->
						<div class="rt">
							<div class="check" id="pnImageArea5"></div>
							<div class="expl" id="pnMessageArea5"></div>
						</div>
					</div>
					
					<div class="employeeSignupRightCol">
						<div class="labelInput"><font color="red">*</font>&nbsp;Website:</div>

						<input class="employeeSignupInput" type="text" tabindex="2" name="employer.website" class="txt" 
						id="nameURL" onfocus="validateEmployer('organizationName','imgArea','msgArea');"><br/>
						
							<div class="rt">
						<div class="check" id="imageArea88"></div>
						<div class="expl" id="msgArea88"></div>
					</div>
					
					<div class="labelInput"><font color="red">*&nbsp;</font>Re-Enter Email:</div>
					<input  class="employeeSignupInput"  type="text" tabindex="4" name="reEnterEmployeremail" 
						class="imgtext" id="reEnterEmployeremail" 
						onfocus="validateEmployer('organizationName','imgArea','msgArea');
						checkEmprEmail('emailId','imageArea11','msgArea11');
						validateEmprState('nameURL','imageArea88','msgArea88');" />
					<div class="rt">
						<div class="check" id="imageArea111"></div>
						<div class="expl" id="msgArea111"></div>
					</div>
						
					<div class="labelInput"><font color="red">*&nbsp;</font>Confirm Password:</div>
					<input class="employeeSignupInput" type="password" tabindex="6" name="confirmEmplrPassword" class="imgtext" id="confirmEmplrPassword" 
						onfocus="validateEmprPwd('imageArea22','msgArea22');reEnterEmprEmail('reEnterEmployeremail','imageArea111','msgArea111');
						checkEmprEmail('emailId','imageArea11','msgArea11');validateEmployer('organizationName','imgArea','msgArea');
						validateEmprState('nameURL','imageArea88','msgArea88');" onblur="return validatePwd('imageArea5','messageArea5');"  />
					<div class="rt">
						<div class="check" id="confirmimageArea22"></div>
						<div class="expl" id="confirmmsgArea22"></div>
					</div>

					<div class="labelInput">Address Line 2:</div>
					<input class="employeeSignupInput" type="text" tabindex="8" name="employer.address2" class="txt" 
						id="address2Id" onfocus="validateEmprCity('emprCity','imageAreaCity','messageAreaCity');
						validateEmprPwd('imageArea22','msgArea22');confirmEmprPwd('confirmimageArea22','confirmmsgArea22');
						validateEmprAddress('address1Id','address1imageArea','address1msgArea');reEnterEmprEmail('reEnterEmployeremail','imageArea111','msgArea111');
						checkEmprEmail('emailId','imageArea11','msgArea11');validateEmployer('organizationName','imgArea','msgArea');
						validateEmprState('nameURL','imageArea88','msgArea88');"><br/>
					<div class="rt">
						<div class="check" id="address2imageArea"></div>
						<div class="expl" id="address2msgArea"></div>
					</div>
						
					<div class="labelInput">State and Zip Code:</div>
					  <s:select   
						    name="employer.state" cssClass="txt" tabindex="10" id="state_1.6"
						    onfocus="validateEmprCity('emprCity','imageAreaCity','messageAreaCity');
						    validateEmprPwd('imageArea22','msgArea22');confirmEmprPwd('confirmimageArea22','confirmmsgArea22');
							validateEmprAddress('address1Id','address1imageArea','address1msgArea');
							validateEmprAddress('address2Id','address2imageArea','address2msgArea');
							reEnterEmprEmail('reEnterEmployeremail','imageArea111','msgArea111');
							checkEmprEmail('emailId','imageArea11','msgArea11');validateEmployer('organizationName','imgArea','msgArea');
							validateEmprState('nameURL','imageArea88','msgArea88');"
						    headerKey="1"
						    headerValue="Select"
						    list="states"/>
						<input class="employeeSignupInputZip" type="text" name="employer.zipcode" tabindex="11" id="emplrZipCode"
						onfocus="validateEmprCity('emprCity','imageAreaCity','messageAreaCity');
						    validateEmprPwd('imageArea22','msgArea22');confirmEmprPwd('confirmimageArea22','confirmmsgArea22');
							validateEmprAddress('address1Id','address1imageArea','address1msgArea');
							validateEmprAddress('address2Id','address2imageArea','address2msgArea');
							reEnterEmprEmail('reEnterEmployeremail','imageArea111','msgArea111');
							checkEmprEmail('emailId','imageArea11','msgArea11');validateEmployer('organizationName','imgArea','msgArea');
							validateEmprState('nameURL','imageArea88','msgArea88');"><br/>
						<div class="rt">
							<div class="check" id="emplrZipimageArea"></div>
							<div class="expl" id="emplrZipmessageArea"></div>
						</div>	
						<div class="labelInput">Skype ID:</div>

						<input class="employeeSignupInput" type="text" tabindex="13" name="employer.skypeId" id="skypeId"><br/>
					</div>
					<div class="clear-both"></div>
					<div class="labelInput">Mission Statement:</div>
					<div class="lt">
						<input class="employeeSignupTextArea" type="text" tabindex="14" name="employer.missionstatement" 
						id="missionstatementId" onfocus="validateEmpZipCode('emplrZipCode','emplrZipimageArea','emplrZipmessageArea');
						validateEmprCity('emprCity','imageAreaCity','messageAreaCity');
							validateEmprPwd('imageArea22','msgArea22');confirmEmprPwd('confirmimageArea22','confirmmsgArea22');
							validateEmprAddress('address1Id','address1imageArea','address1msgArea');
							validateEmprAddress('address2Id','address2imageArea','address2msgArea');
							reEnterEmprEmail('reEnterEmployeremail','imageArea111','msgArea111');
							checkEmprEmail('emailId','imageArea11','msgArea11');validateEmployer('organizationName','imgArea','msgArea');
							validateEmprState('nameURL','imageArea88','msgArea88');validatePhoneNumbernew('emplrphoneNumberId','pnImageArea5','pnMessageArea5');">
					</div>
					<div class="rt">
						<div class="check" id="missionStmtimageArea"></div>
						<div class="expl" id="missionStmtmsgArea"></div>
					</div>
					
					
						<div class="labelInput">Industry</div>
					<div class="industry_emplr">
							<s:select name="industryName"
								cssStyle="width:28%;"
								list="industryList"
								listKey="id"
								id="industry"
								headerKey="0"
								headerValue="Please select industry"
								listValue="name" size="0">
							</s:select>
						    </div>
					
					<div class="clear-both"></div>
					<div class="labelInput">Upload a Photo:</div>
					
					<div class="lt" style="padding-bottom:2px;">
						<s:file name="upload" size="30" tabindex="15" id="uploadpic"/>
					</div>
					<div class="rt">
						<div class="check" id="imageAreaImage"></div>
						<div class="expl" id="messageAreaImage"></div>
					</div>
					
					
					<div class="clear-both"></div>
					<div class="labelInput"><font color="red">*</font>&nbsp;Image Verification:</div>
                    <div class="imagechange" style="padding-top: 3px;"><u style="cursor: pointer" onclick="sjcap('Employer');">Click</u> to change image<br/></div>
					<div class="lt">
						<div id="emprcaptcha"></div>
						<div class="check" id="imageAreaEmprVcode"></div>
						<div class="expl" id="messageAreaEmprVcode"></div>
						
					</div>
					<!--<div class="clear-both"></div>
					<div class="captchaSample">
					</div>-->
					<div class="acceptTermsOfService"  style="padding-top:3px;">
						<input type="checkbox" id="acceptEmployerCondi" tabindex="17" name="checkbox">&nbsp;
						I have read, and I accept, My Own Briefcase's <a href="${ctx}/public/termsOfService.action" title="Terms of Service">terms of use</a> and <a href="${ctx}/public/privacyPolicy.action" title="Privacy Policy">Privacy Policy</a>.
						 
						
						<br><span id="acceptTermsOfServiceWarnMsgEmployer" style="color:red;"></span>
					</div>
					<div class="rt">
						<div class="check" id="imageArea55"></div>
						<div class="expl" id="messageArea55"></div>
					</div>
					
					<div class="joinForFreeCenterButton">
					
					<input id="finishEmpr_button" type="image" value="Submit" 
					src="${ctx}/styles/default/images/button_signup_join.png" 
					onclick="return(checkEmprForm2());"/>
					</div>
					
				</div>
				   </div>
				</form>
                </div>
			</div>
			<br style="clear: both;">
		</div>
	</div>