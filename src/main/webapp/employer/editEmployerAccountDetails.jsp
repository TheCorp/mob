<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script type="text/javascript" src="<c:url value='/styles/default/js/editEmployerProfile.js'/>"></script>
<script src="<c:url value='/styles/default/js/editEmployerAccount.js'/>" type="text/javascript"></script>
<div id="bc_main_outer">
	<div id="create_opportunity">
		<div id="bc_main_outer1">
			<div id="bc_main_mid_new">

				<div class="edit_employer_border">
					<div class="signupHeader">Edit Employer Account Information</div>
					<form id="employerEditProfile" action="" method="post" enctype="multipart/form-data">
					<div class="edit_employer_content">
						<div class="edit_employer_top">
							<div class="edit_employer_topbox">
							    <s:hidden name="employer.id"/>
								<div class="labelInput"><font color="red">*</font>&nbsp;Organization Name:</div>
	              				<input class="employeeSignupInput" type="text"  name="organizationName" id="organizationName" 
	              				value='<s:property value="employer.organizationName"/>' />
								<div class="emplr_rt">
							      <div class="check" id="orgNameimageArea"></div>
						          <div class="expl" id="orgNamemessageArea"></div>
					           	</div>
	
								<div class="labelInput"><font color="red">*&nbsp;</font>Website:</div>
								<input class="employeeSignupInput" type="text" name="website" id="WebsiteId" 
								value='<s:property value="employer.website"/>' 
								onfocus="validateEmployer('organizationName','imgArea','msgArea');"/><br/>
								<div class="emplr_rt">
							      <div class="check" id="webSiteimageArea"></div>
						          <div class="expl" id="webSitemessageArea"></div>
					           	</div>
					           	
								<div class="labelInput">Phone Number:</div>
								<input class="employeeSignupInput" type="text" 
								name="phonenumber" value='<s:property value="employer.phoneNumber"/>' id="phoneNumberId"/><br/>
								<div class="emplr_rt">
							      <div class="check" id="phoneNoimageArea"></div>
						          <div class="expl" id="phoneNomessageArea"></div>
					           	</div>
					
								
								<div class="labelInput">Skype ID:</div>
								<input class="employeeSignupInput" type="text" name="SkypeId" id="SkypeId" 
								value='<s:property value="employer.skypeId"/>' /><br/>
								<div class="emplr_rt">
							      <div class="check" id="skypeimageArea"></div>
						          <div class="expl" id="skypemessageArea"></div>
					           	</div>
					           	
								<div class="labelInput">Address Line 1:</div>
								<input class="employeeSignupInput" type="text" name="address1" id="address1Id" 
								value='<s:property value="employer.address1"/>' /><br/>
								<div class="emplr_rt">
							      <div class="check" id="add1imageArea"></div>
						          <div class="expl" id="add1messageArea"></div>
					           	</div>
					           	
								<div class="labelInput">Address Line 2:</div>
								<input class="employeeSignupInput" type="text" name="address2" id="address2Id" 
								value='<s:property value="employer.address2"/>' /><br/>
								<div class="emplr_rt">
							      <div class="check" id="add2imageArea"></div>
						          <div class="expl" id="add2messageArea"></div>
					           	</div>
								
								<div class="labelInput">City:</div>
								<input class="employeeSignupInput" type="text" name="city" id="CityID" 
								value='<s:property value="employer.city"/>' /><br/>
								<div class="emplr_rt">
							      <div class="check" id="cityimageArea"></div>
						          <div class="expl" id="citymessageArea"></div>
					           	</div>
					           	
							<div class="labelInput">State and Zip Code:</div>
	                               <s:select name="state" cssClass="txt" id="state_1.6"
	                                   headerKey="1" headerValue="Select" list="states" value="employer.state"/>
	                               <input class="employeeSignupInputZip" type="text"  name="zipcode" id="zipcodeId" value='<s:property value="employer.zipcode"/>' /><br/>
	                               <div class="emplr_rt">
	                             <div class="check" id="zipimageArea"></div>
	                         <div class="expl" id="zipmessageArea"></div>
	                       </div>
	                           <div class="labelInput">Industry:</div>
	                                       <s:select name="industry.id"
	                                       cssStyle="width:38%;"
	                                       list="industryList"
	                                       listKey="id"
	                                       id="industry"
	                                       headerKey="0"
	                                       headerValue="Please select industry"
	                                       listValue="name" size="0"
	                                       value="employer.industry.id"></s:select><br>
	                               <div class="emplr_rt">
	                                       <div class="check" id="industryimageArea"></div>
	                                       <div class="expl" id="industrymessageArea"></div>
	                               </div> 
	                       </div>
							<div class="edit_employer_topbox">
								<div class="labelInput"><font color="red">*&nbsp;</font>Email:</div>
								<input class="employeeSignupInput" type="text" name="email" value='<s:property value="employer.email"/>' 
								id="emailId"  onblur="checkEmprEmail('emailId','imageArea11','msgArea11');"/ ><br/>
							<div class="emplr_rt">
							      <div class="check" id="emailimageArea"></div>
						          <div class="expl" id="emailmessageArea"></div>
					        </div>	
						
							<div class="labelInput">Change Password:</div>
							<div class="clear-both"></div>
				
						<span id="newPassId" style="display: none;margin-left: 150px;color: red"><h5>Please Enter New Password</h5></span>
						<span id="verifyNewPassId" style="display: none;margin-left: 150px;color: red"><h5>Please Enter Verify New Password</h5></span>
						<span id="oldPassId" style="display: none;margin-left: 150px;color: red"><h5>Please Enter Old Password</h5></span>
						<span id="wrongPassId" style="display: none;margin-left: 150px;color: red"><h5>You Have Entered Wrong Verify Password</h5></span>
						<span id="wrongOldPassId" style="display: none;margin-left: 150px;color: red"><h5>Wrong Old Password</h5></span>		
						
						<input type="hidden" name="currentPass" id="currentPass" value='<s:property value="employer.password"/>'/>
						<div class="labelInput">Current Password:</div>
						<input class="employeeSignupInput" type="password" name="currentpassword" id="old_password"><br/>
						<div class="emplr_rt">
					      <div class="check" id="currPassimageArea"></div>
				          <div class="expl" id="currPassmessageArea"></div>
			           	</div>

						<div class="labelInput">New Password:</div>
						<input class="employeeSignupInput" type="password" name="newpassword" id="new_password"><br/>
						<div class="emplr_rt">
					      <div class="check" id="newPassimageArea"></div>
				          <div class="expl" id="newPassmessageArea"></div>
			           	</div>
			           	
						<div class="labelInput">Confirm Password:</div>
						<input class="employeeSignupInput" type="password" name="confirmpassword" id="verify_new_password"  onblur="return(chageEmplrPassword())"><br/>
						<div class="emplr_rt">
					      <div class="check" id="confirmPassimageArea"></div>
				          <div class="expl" id="confirmPassmessageArea"></div>
			           	</div>
			           	
							</div>
							<div class="edit_employer_topbox">
								<div class="labelInput">Upload a New Photo:&nbsp;&nbsp; </div>


								<div class="clear-both"></div>
								<div class="photoUpload">
									Current Photo<br>
								 <s:if test="user.picture!=null">
								 <img align="top" src="<s:property value="resizedMidImage_employerProfile"/>" alt="N/A"/>
								 </s:if>
								  <s:else><img src="${ctx}/styles/default/images/nophoto.png"></s:else>
								</div>
								<div class="photoTextLabel">
									<div class="lt">
					                    <s:file name="upload" size="8" tabindex="5"  id="upload" />
				              	    </div>
								</div>
							</div>
							<div class="clear-both"></div>
						</div>
						<div class="edit_employer_bigtext">
							<div class="createOpportunityInputLabel">
								Mission Statement:</div>
							<div class="createOpportunityTextArea">
							
							  <s:textarea rows="5" name="missionstatement" id="missionstatementId" cssStyle="width:750px"></s:textarea>
                            </div>
							<div class="emplr_rt">
							      <div class="check" id="missionimageArea"></div>
						          <div class="expl" id="missionmessageArea"></div>
					        </div>

							<div class="createOpportunityInputLabel">
								Organization Info:</div>
							<div class="createOpportunityTextArea">
							  <s:textarea rows="5" name="emplrorganizationInfo" id="emplrorganizationInfoId"  cssStyle="width:750px"></s:textarea>
                            </div>
							
							<div class="createOpportunityInputLabel">
								Organization Culture</div>
							<div class="createOpportunityTextArea">
							
							  <s:textarea rows="5" name="emplrorganizationCulture" id="emplrorganizationCultureId"  cssStyle="width:750px"></s:textarea>
                            </div>
							
							<div class="createOpportunityInputLabel">
								Why Choose Us:</div>
                            <div class="createOpportunityTextArea">
                            
                            <s:textarea rows="5" name="whyChooseUs" cssStyle="width:750px"></s:textarea>
                            <!--	
                          <s:textfield cssStyle="width:750px;height:90px"  name="whyChooseUs" id="whyChooseUs"></s:textfield>
                           	<textarea name="whyChooseUs" rows="5" id="whyChooseUs" cols="94"></textarea><br>
                            --><!--<input class="createOpportunityTextArea" id="whyChooseUsId" name="whyChooseUs" 
							value='<s:property value="employer.whyChooseUs"/>'/>
							-->
							</div>
					        
							<div class="clear-both"></div>
						</div>
						<div class="clear-both"></div>
					</div>
					
					<div class="editemployerprofile">
							<s:submit type="image"  src="${ctx}/styles/default/images/button_savenow.png" 
							onclick="return editEmployerAccDetails1()"/>
					
				<!--	<img style="padding-left:130px" src="${ctx}/styles/default/images/button_savenow.png">
					onclick="editEmployerAccDetails()"
					</div>-->
					</div>
					</form>

					<div class="clear-both"></div>					
				</div>
			</div>

		</div>
	</div>
	</div>


