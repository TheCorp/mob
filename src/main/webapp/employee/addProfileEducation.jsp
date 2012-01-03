<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="<c:url value='/styles/default/css/calendar-win2k-cold-2.css'/>" />
<script src="<c:url value='/styles/default/js/calendar.js'/>"	type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/addProfileEducation.js'/>" type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/employee.js'/>" type="text/javascript"></script>
<div id="bc_main_outer">
	<div id="create_opportunity">
		<div id="bc_main_outer">
			<div id="bc_main_mid">
				<div class="signupBorder">
					<div class="signupHeader">
						Welcome <s:property value="%{user.firstName}"/>
						<div style="float:right;font-size:11px;padding-top:5px">
						<a style="color: #FFFFFF" href="${ctx}/employee/loadEmployeeProfilesList.action">Skip These Questions For Now.</a>
						</div>
					</div>
					<form id="employeeSignUpForm" action="${ctx}/employee/addProfileEducation.action"  method="post" enctype="multipart/form-data">		
					<div class="employeeSignupInfoRequest">
						Please tell us a little bit about yourself.
					</div>
					<div class="employeeSignupTabRow">
						<div class="employeeSignupTab">1</div>
						<div class="employeeSignupTabSelected">2</div> 
						<div class="employeeSignupTab">3</div>
					</div>
					<div class="employeeSignupTabContent">	
						<br/>
						<div style="width:900px;height:170px;overflow:auto">
							<div class="inputLabelWide" style="margin-left: 10px">Schools Attended: </div>
							<s:hidden name="profile.id"/>
							<div class="inputBarWide"></div>
							
							<div class="signupEducationHeaderRow">
								<div class="collegeName"><b>College/University</b></div>
								<div class="degreeType"><b>Degree</b></div>
								<div class="classYear"><b>Class Year</b></div>
								<div class="major"><b>Major(s)</b></div>
								<div class="minor"><b>Minor(s)</b></div>
								<div class="GPA"><b>GPA</b></div>
							</div>
							<div class="buttons" id="your_education">
								<div id="validateEducationId"></div>
							</div>
							<div class="signupEducationFormRow">
								<div class="collegeName">
									<input type="text" class="collegeNameInput" name="schoolNames" id="schoolName_txtbox"/>
								</div>
								<div class="degreeType">
							     	<select  name="degrees" id="degree_txtbox">
										<option value="B.A.">B.A.</option>
										<option value="B.S.">B.S.</option>
										<option value="M.S.">M.S.</option>
										<option value="M.B.A.">M.B.A.</option>
									</select>
								</div>
								<div class="classYear" >
									<select name="year" id="year_txtbox">
										<option value="2009">2009</option>
										<option value="2008">2008</option>
										<option value="2007">2007</option>
										<option value="2006">2006</option>
										<option value="2005">2005</option>
										<option value="2004">2004</option>
										<option value="2003">2003</option>
										<option value="2002">2002</option>
										<option value="2001">2001</option>
										<option value="2000">2000</option>
										<option value="1999">1999</option>
										<option value="1998">1998</option>
										<option value="1997">1997</option>
										<option value="1996">1996</option>
										<option value="1995">1995</option>
										<option value="1994">1994</option>
										<option value="1993">1993</option>
										<option value="1992">1992</option>
										<option value="1991">1991</option>
										<option value="1990">1990</option>
										<option value="1989">1989</option>
										<option value="1988">1988</option>
										<option value="1987">1987</option>
										<option value="1986">1986</option>
										<option value="1985">1985</option>
										<option value="1984">1984</option>
										<option value="1983">1983</option>
										<option value="1982">1982</option>
										<option value="1981">1981</option>
										<option value="1980">1980</option>
										<option value="1979">1979</option>
										<option value="1978">1978</option>
										<option value="1977">1977</option>
										<option value="1976">1976</option>
										<option value="1975">1975</option>
										<option value="1974">1974</option>
										<option value="1973">1973</option>
										<option value="1972">1972</option>
										<option value="1971">1971</option>
										<option value="1970">1970</option>
										<option value="1969">1969</option>
										<option value="1968">1968</option>
										<option value="1967">1967</option>
										<option value="1966">1966</option>
										<option value="1965">1965</option>
										<option value="1964">1964</option>
										<option value="1963">1963</option>
										<option value="1962">1962</option>
										<option value="1961">1961</option>
										<option value="1960">1960</option>
										<option value="1959">1959</option>
										<option value="1958">1958</option>
										<option value="1957">1957</option>
										<option value="1956">1956</option>
										<option value="1955">1955</option>
										<option value="1954">1954</option>
										<option value="1953">1953</option>
										<option value="1952">1952</option>
										<option value="1951">1951</option>
										<option value="1950">1950</option>
										<option value="1949">1949</option>
										<option value="1948">1948</option>
										<option value="1947">1947</option>
										<option value="1946">1946</option>
										<option value="1945">1945</option>
										<option value="1944">1944</option>
										<option value="1943">1943</option>
										<option value="1942">1942</option>
										<option value="1941">1941</option>
										<option value="1940">1940</option>
										<option value="1939">1939</option>
										<option value="1938">1938</option>
										<option value="1937">1937</option>
										<option value="1936">1936</option>
										<option value="1935">1935</option>
										<option value="1934">1934</option>
										<option value="1933">1933</option>
										<option value="1932">1932</option>
										<option value="1931">1931</option>
										<option value="1930">1930</option>
										<option value="1929">1929</option>
										<option value="1928">1928</option>
										<option value="1927">1927</option>
										<option value="1926">1926</option>
										<option value="1925">1925</option>
										<option value="1924">1924</option>
										<option value="1923">1923</option>
										<option value="1922">1922</option>
										<option value="1921">1921</option>
										<option value="1920">1920</option>
									</select>
								</div>
								<div class="major"><input class="majorInput" type="text" name="gpas" id="major_txtbox"></div>
                                <div class="minor"><input class="majorInput" type="text" name="gpas" id="minor_txtbox"></div>
								<div class="GPA"><input class="gpaInput" type="text" name="gpas" id="gpa_txtbox"></div>
							</div>
							<div class="signupEducationFormRow">
								<div class="collegeName">&nbsp;</div>
								<div class="degreeType">&nbsp;</div>
								<div class="classYear">&nbsp;</div>
								<div class="major">e.g. Physics, English, Business</div>
								<div class="minor">&nbsp;</div>
								<div class="GPA">
								   <img id="add_btn1" src="${ctx}/styles/default/images/button_addschool.png" onclick="return addEducationDetails2();" />
								</div>
							</div>
						</div>
						<div class="employeeSignupContentLeftTab2">
							<div class="inputLabelWide">Honors/Achievements: </div>
							<div class="inputBarNarrow"></div>
							<textarea style="height: 100px; width: 420px;" name="achievements" id="achievements"></textarea>  
							<br/><br/>
							<div class="inputLabelWide">Your Industry: </div>
							<div class="inputBarNarrowest"></div>
							<div class="industry">
							<s:select name="industryName"
								cssStyle="width:28%;"
								list="industryList"
								listKey="id"
								id="industry"
								headerKey="0"
								headerValue="Please select industry"
								listValue="name" size="5"
								value="0">
							</s:select>
						    </div>
						</div>		
						<div class="employeeSignupContentRightTab2">
							<div class="inputLabelWide">Additional Training: </div>
							<div class="inputBarNarrower"></div>
							<div style="display:none;color: red; clear: both;" id="traingId"></div>
							<div  id="add_training_row_id"></div>
							<div class="additionalTrainingRow"></div>
							<input type="text" class="signupTrainingInput" name="training" id="training_textbox" />
							<img  class="add_btn" onclick="addTrainingDetails1()" src="${ctx}/styles/default/images/button_addjob.png" />
						</div>						
					</div>
					<div class="continueToSignup1">
						<div class="pageWording">Page 2 of 3</div>
						<input type="image" value="Submit" src="${ctx}/styles/default/images/button_signup_continue.png"/>
					</div>
					</form>
				</div>
			</div>
			<br style="clear: both;">
		</div>
		





