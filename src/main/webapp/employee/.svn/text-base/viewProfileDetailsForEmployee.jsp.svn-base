<%@ include file="/common/taglib.jsp"%>
<%@ taglib uri="/MOB" prefix="mob"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<div id="bc_profile">
<div id="bc_main_outer">

	<div id="bc_main_mid">
		<div id="bc_profile_outernav"><div class="outer_page_nav">
		<ul>
       
        <li>
         <!--
         <s:url id="viewProfile" action="myContactAction1.action">
	      <s:param name="profile.id" value="profile.id"/>
	    </s:url>
        <s:a href="%{viewProfile}">View Profile</s:a>
         -->
         <a href="${ctx}/employee/myContactAction1.action?profile.id=<s:property value="profile.id"/>">View Profile</a>
        </li>
       
      <li class="active">
      <!--
       <s:url id="viewProfileDetails" action="viewProfileDetailsForEmployee.action">
	      <s:param name="profile.id" value="profile.id"/>
	   </s:url>
      <s:a href="%{viewProfileDetails}">View Profile Details</s:a>
       -->
       <a href="${ctx}/employee/viewProfileDetailsForEmployee.action?profile.id=<s:property value="profile.id"/>">View Profile Details</a>
      </li>
       <li>
       <!--<s:url id="editProfileDetails" action="loadProfileDetailsForEmployee.action">
	   <s:param name="profile.id" value="profile.id"/>
   	   </s:url>
       <s:a href="%{editProfileDetails}">Edit my Profile</s:a>
          -->
          <!--  <a href="${ctx}/employee/loadProfileDetailsForEmployee.action?profile.id=<s:property value="profile.id"/>">Edit my Profile</a> -->
      
        <a href="${ctx}/employee/loadEmpProfileAction.action?profile.id=<s:property value="profile.id"/>">Edit my Profile</a>
       </li>
       <li class="align-right"><!--
       <s:url id="privacy" action="privacy.action">
	   <s:param name="profile.id" value="profile.id"/>
   	   </s:url>
   	   <s:a href="%{privacy}">Privacy Settings</s:a>
   	    -->
   	    <a href="${ctx}/employee/privacy.action?profile.id=<s:property value="profile.id"/>">Privacy Settings</a>
   	   </li>
      
       <!--<s:url id="listfeedbacks" action="listOfEmployeeFeedbacks.action">
	      <s:param name="profile.id" value="profile.id"/>
	   </s:url>
       --><li class="align-right">
       <a href="${ctx}/employee/listOfEmployeeFeedbacks.action?profile.id=<s:property value="profile.id"/>">Profile Feedback:<span id="positiveid"><s:property value="possitiveSize"/></span></a>
       
       </li>
       <li class="align-right help">
		         <mob:flag key="1" src="../styles/default/images/icon_help.png">
                 </mob:flag>
		</li>
       
       </ul>		
		
		
		</div></div>

		<div class="bc_main_inner clear-both">
			<div id="bc_profile_sec">
				<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
					<div id="bc_profile_pic_spot">
						<div class="bc_pps_pic">
							<div id="bc_profile_pic">
							<s:if test="profile.picture!=null">
							<img align="top" src="<s:property value="resizedMidImage"/>" alt="N/A"/>
							</s:if>
							<s:else>
							<img src="${ctx}/styles/default/images/mobc_default_profile_pic.jpg" alt=""  width="150" height="100" />
							</s:else>
							</div>
						</div>
						
					</div>
					<div id="bc_profile_info">
						<h2 id="bc_profile_name"><s:property value="user.firstName"/>  <s:property value="user.lastName"/></h2>
						 <s:if test="profile.jobcategory!=''">
	 					 <h3 id="bc_profile_profession"> <s:property value="profile.jobcategory"/></h3>
	   					 </s:if><div class="bc_pi_details">

							<div class="bc_pi_d_line clear-both"><h3>Locations:</h3><h4 id="bc_profile_locations"><s:property value="user.city"/>,<s:property value="user.state"/></h4></div>
							</div>

					</div>
					<br class="clear-both" />

					<div id="bc_profile_details">
						<div class="brief_desc">
							<div class="col"><h3>Primary Industry:</h3> <p><s:property value="profile.industry.name"/></p></div>
							<div class="col"><h3>Desired Salary Range:</h3> <p><s:property value="profile.range"/></p></div>
							<div class="col"><h3>Available for work:</h3> <p><s:property value="profile.workTimeframe"/></p></div>

						</div>
						<div class="info_row work_experience">
							<h3>Work Experience:</h3>
							
							<div class="sel_prof_headers">		
							
								<div class="sel_prof_col spc_name"><h4>Job Name</h4></div>
								<div class="sel_prof_col spc_title"><h4>Title</h4></div>
								<div class="sel_prof_col spc_date"><h4>Date Range</h4></div>

							</div>
							 <s:iterator value="workExperienceList">
							 <div class="sel_prof_row">
									<div class="sel_prof_col spc_name"><s:property value="employerName"/> </div>
									<div class="sel_prof_col spc_title"><s:property value="description"/></div>
									<div class="sel_prof_col spc_date"><s:date name="workStart" format="MM/dd/yyyy"/> - <s:date name="workEnd" format="MM/dd/yyyy"/></div>
							 </div>
							</s:iterator>
							
						</div>
						<div class="info_row education">
							<h3>Education:</h3>
							<div class="sel_prof_headers">

								<div class="sel_prof_col spc_name"><h4>Name</h4></div>
								<div class="sel_prof_col spc_degree"><h4>Degree</h4></div>
								<div class="sel_prof_col spc_attended"><h4>Attended</h4></div>
								<div class="sel_prof_col spc_concentration"><h4>Major/Concentration</h4></div>
								<div class="sel_prof_col spc_gpa"><h4>GPA</h4></div>
								<div class="sel_prof_col spc_notes"><h4>Notes</h4></div>

							</div>
							 <s:iterator value="educationList">
							<div class="sel_prof_row">
								<div class="sel_prof_col spc_name"><s:property value="schoolName"/></div>
								<div class="sel_prof_col spc_degree"><s:property value="degree"/></div>
								<div class="sel_prof_col spc_attended"><s:date name="courseStart" format="MM/dd/yyyy"/> - <s:date name="courseEnd" format="MM/dd/yyyy"/></div>
								<div class="sel_prof_col spc_concentration"><s:property value="concentration"/></div>

								<div class="sel_prof_col spc_gpa"><s:property value="gpa"/></div>
								<div class="sel_prof_col spc_notes"><s:property value="honors"/></div>
							</div>
							</s:iterator>
							
						</div>
						<div class="info_row experience">
							<h3>Skills:</h3>

							<div class="sel_prof_headers">
								<div class="sel_prof_col spc_name" ><h4>Category</h4></div>
								<div class="sel_prof_col spc_name" ><h4>Name</h4></div>
								<div class="sel_prof_col spc_experience"><h4>Experience</h4></div>
								<div class="sel_prof_col spc_skilllevel"><h4>Skill Level</h4></div>
								<div class="sel_prof_col spc_notes"><h4>Notes</h4></div>

							</div>
							<s:iterator value="userSkillsDetailsList">
							<div class="sel_prof_row">
								<div class="sel_prof_col spc_name"><s:property value="category.name"/></div>
								<div class="sel_prof_col spc_name"><s:property value="skillName"/></div>
								<div class="sel_prof_col spc_experience"><s:property value="experience"/></div>
								<div class="sel_prof_col spc_skilllevel"><s:property value="level"/></div>
								<div class="sel_prof_col spc_notes"><s:property value="notes"/></div>
							</div>
							</s:iterator>
						</div>
					</div>

				</div></div></div></div></div>
			</div>

			<br class="clear-both" />
		</div>
	</div>
</div>


