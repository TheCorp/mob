<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script type="text/javascript" src="<c:url value='/styles/default/js/editskills.js'/>"></script>
<script type="text/javascript" src="<c:url value='/styles/default/js/autosuggest.js'/>"></script>
<script src="<c:url value='/styles/default/js/jquery.editEmplr.bgiframe.min.js'/>" type="text/javascript"></script>


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
					<div class="signupHeader" style="padding:5px 0px 15px 13px;">
						<span style="float: left; width: 778px;">Welcome <s:property value="%{user.firstName}" />!</span>
						<span style="font-size: 11px;float:right;width: 317px;margin-top:-22px;">
						<img  style="float: left; margin-left:-25px;" src="${ctx}/styles/default/images/lock-icon.png"  >
						  <a style="color: #FFFFFF" href="${ctx}/employee/privacy.action?profile.id=<s:property value="profile.id"/>">Privacy Settings</a>
						  </span>
						<span style="font-size: 11px;">
							<a style="color: #FFFFFF" href="${ctx}/employee/loadEmployeeProfilesList.action"><u>Skip these questions for now</u></a>
						</span>
					</div>
					<div class="employeeSignupInfoRequest">
						Please tell us a little bit about yourself.
					</div>
   <form id="skillsForm" action="completeEditProfile.action" method="post">
		 <s:hidden id="profileid" name="profile.id"/>
		 <s:hidden name="user.id"/>
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
								<div class="notes"><b>Notes/Comments</b></div>

							</div>
							
								
					      <div id="sel_prof_row">
					      	<div id="editskillsId"></div>
							<s:iterator value="userSkillsDetailsList">
							<div class="signupEducationRow" id="skillsdiv<s:property value='id'/>">
								<input type="hidden" id="id<s:property value='id'/>" name="id" value=<s:property value="id"/> >
								<input type="hidden" id="categoryname<s:property value="id"/>" name="categoryName" value=<s:property value="category.name"/> >
								<input type="hidden" id="categoryname<s:property value="id"/>" name="categoryId" value=<s:property value="category.id"/> >
								<input type="hidden" id="skillname<s:property value="id"/>" name="skillName" value=<s:property value="skillName"/> >
								<input type="hidden" id="experience<s:property value="id"/>" name="experience" value=<s:property value="experience"/> >
								<input type="hidden" id="level<s:property value="id"/>" name="level" value=<s:property value="level"/> >
								<input type="hidden" id="notes<s:property value="id"/>" name="notes" value=<s:property value="notes"/> >
					
								<div class="category" id="category_div<s:property value="id"/>">&nbsp;<s:property value="category.name"/> </div>
								<div class="skillName" id="skillname_div<s:property value="id"/>"><s:property value="skillName"/></div>
								<div class="yearsExp" id="experience_div<s:property value="id"/>"><s:property value="experience"/> </div>
								<div class="skillLevel" id="level_div<s:property value="id"/>"><s:property value="level"/> </div>
								<div class="notes" id="notes_div<s:property value="id"/>"><s:property value="notes"/>&nbsp;</div>			

								<img class = "workExperienceIcon" src="${ctx}/styles/default/images/mobc_redx.gif" alt="Remove" onclick="deleteSkills('<s:property value='id'/>')"/>
								
							</div>
							</s:iterator>
							<div id="deleteskills"></div>
					      </div>
							<div class="signupEducationFormRow">
								<div class="category">
								  <input type="text" class="collegeNameInput" name="category" id="skillscategory"/>
				
								</div>
								<div class="skillName">
				             	<tr>
					 	 	<td class="row" width="10%" style="width:21px;">
							 	<div style="display: none" id="textId">
							    <input type="text" class="city3" id="skillfromlist1"/>
							    </div><!--
							    <input type="hidden" id="build_acfb"/>
							    <input type="hidden" id="skillfromlist1" name="skillname"/>
						 	--></td>
					 	</tr>
					 	<!--
								
								
								 <input type="text" class="collegeNameInput" name="skill" id="skills"/>
								--></div>
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
															
									
			              		 <s:select name="skilllevel"
                                 headerKey="1" headerValue="Select"
                                 list="{'Beginner','Intermediate','Expert','Mastered It!'}"
                                 id="skill_level">
                                   </s:select> 
									
									
									
								</div>
								
								<div class="notes">
								 <input type="text" class="majorInput" name="notes" id="notes"/>
								</div>
							</div>

							<div class="signupEducationFormRow">
								<div class="collegeName">&nbsp;e.g. Music, Technology</div>
								<div class="degreeType">&nbsp;</div>
								<div class="classYear">&nbsp;</div>
								<div class="major">&nbsp;</div>
								<div class="minor"> <img  src="${ctx}/styles/default/images/button_addskill.png" id="addbtn_skills" style="padding-left:130px" onclick="addSkills()"/></div>
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
									
									<input class="physicalTextBox" id="heighttest" name="height" value=<s:property value="heightFt"/> >
									<div class="physicalInputDesc">ft</div>

									<input class="physicalTextBox" id="heighttest" name="height" value=<s:property value="heightIn"/>>
									<div class="physicalInputDesc">in</div>
								</div>
								<div class="physicalInputLabel">Measurements</div>
								
								<input class="physicalTextBoxMedium" id="measurementstext" name="measurements" value=<s:property value="measurements1"/> >
								<input class="physicalTextBoxMedium" id="measurementstext" name="measurements" value=<s:property value="measurements2"/> >
								<input class="physicalTextBoxMedium" id="measurementstext" name="measurements" value=<s:property value="measurements3"/> >
							</div>

							<div class="physicalRow">
								<div class="physicalInputLabel">Weight</div>
								<div class="secondColumnInput">
									<input class="physicalTextBoxMedium" id="weighttext" name="weight" value=<s:property value="physicalTraits.weight"/> >
									<div class="physicalInputDesc">lbs</div>
								</div>
								<div class="physicalInputLabel">Shoe Size</div>
	                            <input class="physicalTextBoxMedium" id="shoesizetext" name="shoesize" value=<s:property value="physicalTraits.shoesize"/> >
							</div>
							<div class="physicalRow">
								<div class="physicalInputLabel">Build</div>
								<div class="secondColumnInput">
									<!--<select style="margin:0px 4px;">
										<option>Select</option>
										<option>Thin</option>
										<option>Normal</option>
										<option>Fat</option>
										<option>Obese</option>
									</select>
								-->
							<s:select name="build"
                                 headerKey="1" headerValue="Select"
                                 list="{'Thin','Normal','Fat','Obese'}"
                                 id="buildtext">
                                 
                                   </s:select> 	
								
								</div>
								
								<div class="physicalInputLabel">Hair Color</div>
							
                                     <input class="physicalTextBoxLarge" id="haircolortext" name="haircolor" value=<s:property value="physicalTraits.haircolor"/> >
								<div class="physicalInputLabel">Eye Color</div>
								 <input class="physicalTextBoxLarge" id="eyecolortext" name="eyecolor" value=<s:property value="physicalTraits.eyecolor"/> >
							</div>
							<div class="physicalRow">
								<div class="physicalInputLabel"></div>
								<div class="secondColumnInput">
								
								</div>

								<div class="physicalInputLabel">Ethnicity</div>
								
									<s:select name="ethnicity" cssStyle="float:left;margin:0px 4px;"
                                 headerKey="1" headerValue="Select"
                                 list="{'White','Black','Asian','Hispanic','Other'}"
                                 >
                                 </s:select> 	
								
								<!--<select style="float:left;margin:0px 4px;" name="ethnicity">
									<option>Select</option>
									<option>White</option>
									<option>Black</option>
									<option>Asian</option>

									<option>Hispanic</option>
									<option>Other</option>
								</select>
								--><div class="physicalInputDesc" style="width:120px;font-size:10px">If "Other", please specify:</div>
								 <input class="physicalTextBoxLarge" id="otherstext" name="others" value=<s:property value="physicalTraits.others"/> >
							</div>
							<div class="physicalRow">

								<div class="physicalInputLabel">Additional Notes:</div>
						         <textarea class="physicalNotes" name="additionalnotes" id="additionalnotestext"><s:property value="physicalTraits.additionalnotes"/></textarea>
							</div>
						</div>
					
						</div>
					</div>
					<div class="continueToSignup1">

						<div class="pageWording">Page 3 of 3</div>
						<s:submit type="image" value="Finish" src="${ctx}/styles/default/images/button_signup_continue.png"/>
						
					</div>
					</form>
				</div>
					
				<br style="clear: both;">
			</div>
		</div>
	</div>


<br class="clear-both" />







