<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />


<script type="text/javascript" src="<c:url value='/styles/default/js/addskills.js'/>"></script>
<script type="text/javascript" src="<c:url value='/styles/default/js/autosuggest.js'/>"></script>
<script src="<c:url value='/styles/default/js/jquery.oop.bgiframe.min.js'/>" type="text/javascript"></script>


<style type="text/css">
	a { text-decoration:none }
	#addLink {text-decoration:underline }
	#addCategoryLink{text-decoration:underline}
</style>
<div id="bc_main_outer">
	<div id="create_opportunity">
		<div id="bc_main_outer">
			<div id="bc_main_mid">

				<div class="signupBorder">
					<div class="signupHeader">
						Welcome  <s:property value="%{user.firstName}"/>
						<div style="float:right;font-size:11px;padding-top:5px">
							<a  style="color: #FFFFFF" href="${ctx}/employee/loadEmployeeProfilesList.action">Skip These Questions For Now.</a>
						
						</div>
					</div>
					<form id="skillsForm" action="${ctx}/employee/completeAddProfile.action" method="post">
					<div class="employeeSignupInfoRequest">
						Please tell us a little bit about yourself.
					</div>
                
                    <s:hidden name="profile.id"/>
                 	<div class="employeeSignupTabRow">
						<div class="employeeSignupTab">1</div>
						<div class="employeeSignupTab">2</div> 
						<div class="employeeSignupTabSelected">3</div>
					</div>
					<div class="employeeSignupTabContent">
					
						<br/>
                   
						<div style="width:900px;height:100px">
					
							<div class="inputLabelWide" style="margin-left: 10px">Your Skills: </div>
			               
							<div class="inputBarWide"></div>
							<div class="signupEducationHeaderRow">
								<div class="category"><b>Category</b></div>
								<div class="skillName"><b>Skill Name</b></div>
								<div class="yearsExp"><b>Years Exp.</b></div>

								<div class="skillLevel"><b>Skill Level</b></div>
								<div class="notes"><b>Notes/Comments</b></div><!--
                                    <div id="sel_prof_row">
							--></div>
							<div class="signupEducationRow1" id="sel_prof_row">
								<div id="skillsId" style="color: red"></div>
							</div>
							
							<div class="signupEducationFormRow">
								<div class="category">	<input type="text" class="txt lg" name="category" id="skillscategory" /></div>
								
								
								<div class="skillName"><!-- 
								<input type="text" class="collegeNameInput" name="skill" id="skills"/>
									 -->
									 <tr>
					 	 	<td class="row" width="10%" style="width:21px;">
							 	<div style="display: none" id="textId">
							    <input type="text" class="city3" id="skillfromlist1"/>
							    </div>
							    <input type="text" id="build_acfb"/>
							    <input type="hidden" onkeypress="searchSkillList()"  id="skillfromlist1" name="skillname"/>
						 	</td>
					 	</tr>
								
								</div>
								 
								<div class="yearsExp">
									<select name="experience" id="experience" >
									
										<option value="">Select</option>
										<option value="1">1</option>

										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>

										<option value="8">8</option>
										<option value="9">9</option>
									</select>
								</div>
								<div class="skillLevel">
																		
								<s:select name="skilllevel" headerKey="1" headerValue="Select One"
						     list="{'Beginner','Intermediate','Advanced'}"
						     id="skill_level">
						 	</s:select> 
							</div>
								
								<div class="notes"><input type="text" class="txt lg" name="notes" id="notes"/></div>
							
							</div>

							<div class="signupEducationFormRow">
								<div class="collegeName">&nbsp;</div>
								<div class="degreeType">&nbsp;</div>
								<div class="classYear">&nbsp;</div>
								<div class="major">&nbsp;</div>
								<div class="minor"><img style="padding-left:130px" src="${ctx}/styles/default/images/button_addskill.png" onclick="addSkills1()";></div>
								
							</div>
						</div>
						<div style="width:900px;height:100px;margin-top: 50px">

							<div class="inputLabelWide" style="margin-left: 10px">Physical Traits: </div>
							<div class="inputBarWide"></div>
							<div class="PhysicalDescription">This section may be suitable for professions that require you to disclose details about your physical appearance.
											<br/>(e.g. actors, models)<br/><br/>
							<div class="physicalRow">
								<div class="physicalInputLabel">Height</div>
								<div class="secondColumnInput">
									<input class="physicalTextBox" type="text"  name="physicalTraits.height" id="heightId" > 
									<div class="physicalInputDesc">ft</div>

									<input class="physicalTextBox" type="text" name="physicalTraits.height" id="heightId">
									<div class="physicalInputDesc">in</div>
								</div>
								<div class="physicalInputLabel">Measurements</div>
								<input class="physicalTextBoxMedium" type="text" name="physicalTraits.measurements" id="measurementsId">
								<input class="physicalTextBoxMedium" type="text" name="physicalTraits.measurements" id="measurementsId">
								<input class="physicalTextBoxMedium" type="text" name="physicalTraits.measurements" id="measurementsId">
							</div>

							<div class="physicalRow">
								<div class="physicalInputLabel">Weight</div>
								<div class="secondColumnInput">
									<input class="physicalTextBoxMedium" type="text" name="physicalTraits.weight" id="weightId"> 
									<div class="physicalInputDesc">lbs</div>
								</div>
								<div class="physicalInputLabel">Shoe Size</div>
								<input class="physicalTextBoxMedium" type="text" name="physicalTraits.shoesize" id="shoesizeId">

							</div>
							<div class="physicalRow">
								<div class="physicalInputLabel">Build</div>
								<div class="secondColumnInput">
									<select style="margin:0px 4px;width:105px" name="physicalTraits.build" id="BuildId">
										<option>Select</option>
										<option>Thin</option>

										<option>Normal</option>
										<option>Fat</option>
										<option>Obese</option>
									</select>
								</div>
								<div class="physicalInputLabel">Hair Color</div>
								<input class="physicalTextBoxLarge" type="text" name="physicalTraits.haircolor" id="haircolorId">

								<div class="physicalInputLabel">Eye Color</div>
								<input class="physicalTextBoxLarge" type="text" name="physicalTraits.eyecolor" id="eyecolorId" >
							</div>
							<div class="physicalRow">
								<div class="physicalInputLabel"></div>
								<div class="secondColumnInput">
									<!--<input class="physicalTextBoxMedium" type="text" name="physicalTraits.breastcupsize" id="breastcupsizeId"> 
								--></div>

								<div class="physicalInputLabel">Ethnicity</div>
								<select style="float:left;margin:0px 4px;" name="physicalTraits.ethnicity" id="EthnicityId" >
									<option>Select</option>
									<option>White</option>
									<option>Black</option>
									<option>Asian</option>

									<option>Hispanic</option>
									<option>Other</option>
								</select>
								<div class="physicalInputDesc" style="width:120px;font-size:10px">If "Other", please specify:</div>
								<input class="physicalTextBoxLarge" type="text" name="physicalTraits.others" id="othersId">
							</div>
							<div class="physicalRow">

								<div class="physicalInputLabel">Additional Notes:</div>
								<textarea class="physicalNotes" name="physicalTraits.additionalnotes" id="additionalnotesId"></textarea>
							</div>
						</div>
						</div>
						
						</div>
				
					<div class="continueToSignup1">

						<div class="pageWording">Page 3 of 3</div>
						
						
						<s:submit type="image"  src="${ctx}/styles/default/images/button_signup_continue.png"/>
					
					</div>
			</form>	
				</div>
						
				<br style="clear: both;">
			</div>
		</div>
	</div>






<script type="text/javascript">					
setPercAnsweredTo(73);						
</script>
<!-- end -->