<%@ include file="/common/taglib.jsp"%>

<link rel="stylesheet" type="text/css" href="<c:url value='/styles/default/css/calendar-win2k-cold-2.css'/>" />

<script src="<c:url value='/styles/default/js/calendar.js'/>"
	type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/calendar_yearsback.js'/>"	type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/signUpPage.js'/>"	type="text/javascript"></script>


<div id="bc_main_outer">
	<div id="create_opportunity">
		<div id="bc_main_outer">
			<div id="bc_main_mid">

				
				<div class="signupHomeTitle"><b>Signup for a free account </b>
					<font style="font-size:11px;">&nbsp;&nbsp;Already a memeber?  <u>Login</u></font>
				</div>
				
				<div class="signupAccountSwitch">
					CHANGE ACCOUNT TYPE:<BR/><br/>
					<select id="myList" onchange="display()" >
						<option value="Please select...">Please select...</option>

						<option value="Employee">Employee</option>
						<option value="Employer">Employer</option>
					</select>
				</div>
				
				
				<div>
				
				<div class="initialSignupHeader" id="employeeHeader">
					Employee Signup:
				</div>
				
				<form id="">

				<div class="centerThisDiv" id="employeeAccount">
				<div class="employeeSignupLeftCol">
					<div class="labelInput"><font color="red">*&nbsp;</font>First Name:</div>
					<input class="employeeSignupInput" type="text"><br/>
					<div class="labelInput"><font color="red">*&nbsp;</font>Email:</div>
					<input class="employeeSignupInput" type="text"><br/>
					<div class="labelInput"><font color="red">*&nbsp;</font>Password:</div>

					<input class="employeeSignupInput" type="text"><br/>
					<div class="labelInput">Address Line 1:</div>
					<input class="employeeSignupInput" type="text"><br/>
					<div class="labelInput">Address Line 2:</div>
					<input class="employeeSignupInput" type="text"><br/>
					<div class="labelInput">Birthdate:</div>
					<input class="employeeSignupInputBirthDate" value="mm/dd/yyyy" type="text">

					<img src="images/icon_calendar.png"><br/>
					<div class="labelInput">Skype ID:</div>
					<input class="employeeSignupInput" type="text"><br/>
				</div>
				
				<div class="employeeSignupRightCol">
					<div class="labelInput"><font color="red">*&nbsp;</font>Last Name:</div>
					<input class="employeeSignupInput" type="text"><br/>

					<div class="labelInput"><font color="red">*&nbsp;</font>Re-Enter Email:</div>
					<input class="employeeSignupInput" type="text"><br/>
					<div class="labelInput"><font color="red">*&nbsp;</font>Confirm Password:</div>
					<input class="employeeSignupInput" type="text"><br/>
					<div class="labelInput">City:</div>
					<input class="employeeSignupInput" type="text"><br/>

					<div class="labelInput">State and Zip Code:</div>
					<select>
						<option value="AL">AL</option>
						<option value="AK">AK</option>
						<option value="AZ">AZ</option>
						<option value="AR">AR</option>

						<option value="CA">CA</option>
						<option value="CO">CO</option>
						<option value="CT">CT</option>
						<option value="DE">DE</option>
						<option value="FL">FL</option>
						<option value="GA">GA</option>

						<option value="HI">HI</option>
						<option value="ID">ID</option>
						<option value="IL">IL</option>
						<option value="IN">IN</option>
						<option value="IA">IA</option>
						<option value="KS">KS</option>

						<option value="KY">KY</option>
						<option value="LA">LA</option>
						<option value="ME">ME</option>
						<option value="MD">MD</option>
						<option value="MA">MA</option>
						<option value="MI">MI</option>

						<option value="MN">MN</option>
						<option value="MS">MS</option>
						<option value="MO">MO</option>
						<option value="MT">MT</option>
						<option value="NE">NE</option>
						<option value="NV">NV</option>

						<option value="NH">NH</option>
						<option value="NJ">NJ</option>
						<option value="NM">NM</option>
						<option value="NY">NY</option>
						<option value="NC">NC</option>
						<option value="ND">ND</option>

						<option value="OH">OH</option>
						<option value="OK">OK</option>
						<option value="OR">OR</option>
						<option value="PA">PA</option>
						<option value="RI">RI</option>
						<option value="SC">SC</option>

						<option value="SD">SD</option>
						<option value="TN">TN</option>
						<option value="TX">TX</option>
						<option value="UT">UT</option>
						<option value="VT">VT</option>
						<option value="VA">VA</option>

						<option value="WA">WA</option>
						<option value="WV">WV</option>
						<option value="WI">WI</option>
						<option value="WY">WY</option>
					</select>
					<input class="employeeSignupInputZip" type="text"><br/>
					<div class="labelInput">Gender:</div>

					<select style="margin:2px">
						<option value="">Please Select...</option>
						<option value="Male">Male</option>
						<option value="Female">Female</option>
					</select><br/>
					<div class="labelInput">Phone Number:</div>
					<input class="employeeSignupInput" type="text" value="(555)555-5555"><br/>

				</div>
				<div class="labelInput">Upload a Photo:</div>
					<input class="employeeSignupInputPhoto" type="text">
					<input type="button" value="Browse..."><br/>
				<div class="labelInput">Image Verification:</div>
					<input class="employeeSignupInputVerify" type="text">
					<u>Click</u> to change image<br/>

				<div class="captchaSample">
					<image src="images/captcha_sample.png">
				</div>
				<div class="acceptTermsOfService">
					<input type="checkbox">&nbsp;
					I have read, and I accept, My Own Briefcase's terms of use and privacy policy.
				</div>
				<div class="joinForFreeCenterButton">
					<image src="${ctx}/styles/default/images/signup_images/button_signup_join.png"></image>

				</div>
				</div>
				</form>
			</div>
				<!--		
			Employer			
			-->
				<div >		
				<div class="initialSignupHeader" id="employerHeader" style="display: none">
					Employer Signup:
				</div>
				
				<div class="rt">
						<div class="check" id="imgArea"></div>
						<div class="expl" id="msgArea"></div>
					</div>
				
				<form id="employerRegForm" action=""  method="post" 	enctype="multipart/form-data">
				<div class="centerThisDiv" id="employerAccount" style="display: none" >
				<div class="labelInput"><font color="red">*</font>&nbsp;Organization Name:</div>
					<input class="employeeSignupInputOrgName" type="text" name="employer.organizationName"  id="organizationName"><br/>
				<div class="employeeSignupLeftCol">

					<div class="labelInput"><font color="red">*&nbsp;</font>Email:</div>
					<input class="employeeSignupInput" type="text"    name="employer.email"  id="emailId"><br/>
					<div class="labelInput"><font color="red">*&nbsp;</font>Password:</div>
					<input class="employeeSignupInput" type="text"  name="employer.password"  id="emplrpassword"><br/>
					<div class="labelInput">Address Line 1:</div>
					<input class="employeeSignupInput" type="text"><br/>

					<div class="labelInput">Address Line 2:</div>
					<input class="employeeSignupInput" type="text"><br/>
				</div>
				
				<div class="employeeSignupRightCol">
					<div class="labelInput"><font color="red">*&nbsp;</font>Re-Enter Email:</div>
					<input class="employeeSignupInput" type="text" id="reEnterEmployeremail" name="reEnterEmployeremail"><br/>
					<div class="labelInput"><font color="red">*&nbsp;</font>Confirm Password:</div>

					<input class="employeeSignupInput" type="text"id="confirmEmplrPassword" name="confirmEmplrPassword"/><br/>
					<div class="labelInput">City:</div>
					<input class="employeeSignupInput" type="text" name="user.city" class="txt" id="empCity" ><br/>
					<div class="labelInput">State and Zip Code:</div>
					<select>
						<option value="AL">AL</option>
						<option value="AK">AK</option>

						<option value="AZ">AZ</option>
						<option value="AR">AR</option>
						<option value="CA">CA</option>
						<option value="CO">CO</option>
						<option value="CT">CT</option>
						<option value="DE">DE</option>

						<option value="FL">FL</option>
						<option value="GA">GA</option>
						<option value="HI">HI</option>
						<option value="ID">ID</option>
						<option value="IL">IL</option>
						<option value="IN">IN</option>

						<option value="IA">IA</option>
						<option value="KS">KS</option>
						<option value="KY">KY</option>
						<option value="LA">LA</option>
						<option value="ME">ME</option>
						<option value="MD">MD</option>

						<option value="MA">MA</option>
						<option value="MI">MI</option>
						<option value="MN">MN</option>
						<option value="MS">MS</option>
						<option value="MO">MO</option>
						<option value="MT">MT</option>

						<option value="NE">NE</option>
						<option value="NV">NV</option>
						<option value="NH">NH</option>
						<option value="NJ">NJ</option>
						<option value="NM">NM</option>
						<option value="NY">NY</option>

						<option value="NC">NC</option>
						<option value="ND">ND</option>
						<option value="OH">OH</option>
						<option value="OK">OK</option>
						<option value="OR">OR</option>
						<option value="PA">PA</option>

						<option value="RI">RI</option>
						<option value="SC">SC</option>
						<option value="SD">SD</option>
						<option value="TN">TN</option>
						<option value="TX">TX</option>
						<option value="UT">UT</option>

						<option value="VT">VT</option>
						<option value="VA">VA</option>
						<option value="WA">WA</option>
						<option value="WV">WV</option>
						<option value="WI">WI</option>
						<option value="WY">WY</option>

					</select>
					<input class="employeeSignupInputZip" type="text"><br/>
				</div>
				<div class="labelInput">Organization Info:</div>
					<input class="employeeSignupTextArea"  name="employer.orgInfo"  id="orgInfo"><br/>
				<div class="labelInput">Organization Culture:</div>
					<input class="employeeSignupTextArea" type="textarea"><br/>
				<div class="labelInput">Skype ID:</div>

					<input class="employeeSignupInput" type="text"  >
					
					<br/>
				<div class="labelInput">Upload a Photo:</div>
					 <!-- <input class="employeeSignupInputPhoto" type="text">
					<input type="button" value="Browse..."><br/>  -->
					<s:file name="upload" size="30" id="uploadpic"/><br/>
				<div class="labelInput">Image Verification:</div>
					<input class="employeeSignupInputVerify" type="text" name="employer.culture"  id="culture">
					<u>Click</u> to change image<br/>

				<div class="captchaSample">
					<image src="${ctx}/styles/default/images/signup_images/captcha_sample.png">
				</div>
				<div class="acceptTermsOfService">
					<input type="checkbox">&nbsp;
					I have read, and I accept, My Own Briefcase's terms of use and privacy policy.
				</div>
				<div class="joinForFreeCenterButton">
					
					<input type="image" value="Submit" src="${ctx}/styles/default/images/signup_images/button_signup_join.png" onclick="return(checkEmprForm())"/>

				</div>
				</div>
				</form>
				</div>
				
				
			</div>
			<br style="clear: both;">
		</div>
	</div>
	</div>



<!--#include file="mobc_footer.html"-->

	





