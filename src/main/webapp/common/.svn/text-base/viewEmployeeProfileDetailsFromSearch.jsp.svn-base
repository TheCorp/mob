<%@ include file="/common/taglib.jsp"%>
<%@ taglib uri="/mob-tags" prefix="mob"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<style>
    .closetxt {
        margin-bottom: 50px;
    }
</style>

<!-- View employee profile details from employee search -->
<div id="bc_profile">
<div id="bc_main_outer">

	<div id="bc_main_mid">
		<div id="bc_profile_outernav"><div class="outer_page_nav">
		<ul>
        <li><!--
            <s:url id="viewProfile" action="viewEmployeeProfileFromSearchEmployee.action">
				   <s:param name="profile.id" value="employeeProfileId"/>
			</s:url>
            <s:a href="%{viewProfile}">View Profile</s:a></li>
       -->
       <a href="${ctx}/search/viewEmployeeProfileFromSearchEmployee.action?employeeProfileId=<s:property value="employeeProfileId"/>">View Profile</a>
       <s:url id="viewProfileDetails" action="viewProfileDetailsForEmployee.action">
	      <s:param name="profile.id" value="employeeProfileId"/>
	   </s:url>
      <li class="active">
      <!--
      <s:url id="viewProfileDetails" action="viewProfileDetailsForEmployeeFromSearch.action">
		   <s:param name="profile.id" value="employeeProfileId"/>
	  </s:url>
	  <s:a href="%{viewProfileDetails}">View Profile Details</s:a>
	  -->
	 <a href="${ctx}/search/viewProfileDetailsForEmployeeFromSearch.action?employeeProfileId=<s:property value="employeeProfileId"/>">View Profile Details</a>
	</li>
	     <!--
     
       <s:url id="listfeedbacks" action="listOfEmployeeFeedbacksFromSearch.action">
	      <s:param name="profile.id" value="employeeProfileId"/>
	   </s:url>
	   -->
	   <mob:privacy item="Your Personal Information" target="employeeProfileId">
       <li class="align-right">
       <!--
       <s:a href="%{listfeedbacks}">Profile Feedback:<em class="pos"><span id="positiveid"><s:property value="possitiveSize"/></span></em>
        </s:a>
       -->
       <a href="${ctx}/search/listOfEmployeeFeedbacksFromSearch.action?profile.id=<s:property value="employeeProfileId"/>">Profile Feedback:<em class="pos"><span id="positiveid"><s:property value="possitiveSize"/></span></em>
       </a>
      
       
       </li>
       </mob:privacy>
       </ul>		
		</div></div>

<div class="bc_main_inner clear-both">
<div id="bc_profile_sec">
<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
			
	<div id="bc_profile_pic_spot">
	<mob:privacy item="Profile Picture" target="employeeProfileId">
		<div class="bc_pps_pic">
			<div id="bc_profile_pic">
			  <img align="top" src="${ctx}<s:property value="employeeProfile.resizedMidPicture"/>" alt="N/A" />
			</div>
		</div>
	</mob:privacy>
	<%--<mob:blocked>--%>
	    <!--<div class="bc_pps_pic">-->
            <!--You do not have privileges to view Profile Picture.-->
        <!--</div>-->
    <%--</mob:blocked>--%>
	</div>
	<mob:privacy item="Your Personal Information" target="employeeProfileId">
	<div id="bc_profile_info">
	
		<h2 id="bc_profile_name"><s:property value="employee.firstName"/>  <s:property value="employee.lastName"/></h2>
		 <s:if test="employeeProfile.jobcategory!=''">
			 <h3 id="bc_profile_profession"> <s:property value="employeeProfile.jobcategory"/></h3>
					 </s:if><div class="bc_pi_details">

			<div class="bc_pi_d_line clear-both"><h3>Locations:</h3><h4 id="bc_profile_locations"><s:property value="employee.city"/>,<s:property value="employee.state"/></h4></div>
			</div>

	</div>
	<s:if test="profiles.size!=0">
	<div id="bc_profile_quicklinks">
	    <div class="bcp_ql" id=" ">
             <a href="#" onclick="return pop_up(event,'confirm_add',['center',300])"><img
                     src="${ctx}/styles/default/images/mobc_icon_26x26-addperson.gif"
                     alt="View Briefcase"/><span>Add <s:property value="employee.firstName"/> to my network</span></a>
         </div>

         <div class="bcp_ql" id="bcp_ql_contact"><a href="#" onclick="return pop_up_feedback(event,'feedback',['center',300])"><img
                 src="${ctx}/styles/default/images/mobc_icon_26x26-contact.gif"
                 alt="Feedback"/><span>Leave Feedback </span></a>
        </div>
		</div>
	</s:if>
	<br class="clear-both" />
</mob:privacy>
<%--<mob:blocked>--%>
	<!--You do not have privileges to view Personal Information.-->
<%--</mob:blocked>--%>

<div id="bc_profile_details">
	<mob:privacy item="Desired Work" target="employeeProfileId">				
	<div class="brief_desc">
		<div class="col"><h3>Primary Industry:</h3> <p><s:property value="employeeProfile.jobcategory"/></p></div>
		<div class="col"><h3>Desired Salary Range:</h3> <p><s:property value="employeeProfile.range"/></p></div>
		<div class="col"><h3>Available for work:</h3> <p><s:property value="employeeProfile.workTimeframe"/></p></div>
	</div>
	</mob:privacy>
	<%--<mob:blocked>--%>
	<!--You do not have privileges to view Desired Work Information.-->
	<%--</mob:blocked>--%>
	<mob:privacy item="Work Experience" target="employeeProfileId">
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
	</mob:privacy>
	<%--<mob:blocked>--%>
	<!--You do not have privileges to view Work Experience details.-->
	<%--</mob:blocked>	--%>
	<mob:privacy item="Education Experience" target="employeeProfileId">
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
	</mob:privacy>
	<%--<mob:blocked>--%>
	<!--You do not have privileges to view Education details.-->
	<%--</mob:blocked>	--%>
	<mob:privacy item="Work Experience" target="employeeProfileId">
	<div class="info_row experience">
		<h3>Skills:</h3>

		<div class="sel_prof_headers">
			<div class="sel_prof_col spc_name"><h4>Name</h4></div>
			<div class="sel_prof_col spc_experience"><h4>Experience</h4></div>
			<div class="sel_prof_col spc_skilllevel"><h4>Skill Level</h4></div>
			<div class="sel_prof_col spc_notes"><h4>Notes</h4></div>

		</div>
		<s:iterator value="userSkillsDetailsList">
		<div class="sel_prof_row">
			<div class="sel_prof_col spc_name"><s:property value="skillName"/></div>
			<div class="sel_prof_col spc_experience"><s:property value="experience"/></div>
			<div class="sel_prof_col spc_skilllevel"><s:property value="level"/></div>
			<div class="sel_prof_col spc_notes"><s:property value="notes"/></div>
		</div>
		</s:iterator>
	</div>
	</mob:privacy>
	<%--<mob:blocked>--%>
	<!--You do not have privileges to view Skills details.-->
	<%--</mob:blocked>	--%>
</div>

</div></div></div></div></div>
</div>
<br class="clear-both" />
</div>
</div>
</div>

<br class="clear-both" />

<div id="feedback" class="popup1">
    <div class="popup1-content">
        <div class="pu_row">
            <div class="pu_col"><img src="${ctx}/styles/default/images/mobc_default_profile_pic.jpg" alt="New Friend"/>
            </div>
            <div class="pu_col">
                <form>
                    <s:hidden name="employeeProfile.id" id="profileid"/>
                    <s:hidden name="employee.id" id="profileownerid"/>
                    
                    <div id="feedback_details">
                    <h4><s:property value="employee.firstName"/></h4><br/>
                    <h6>Leave Feedback</h6><br/>
                    <font size="1" face="arial, helvetica, sans-serif"> ( You may enter up to 250 characters. )<br>
                        <textarea id="textareaId" name=message cols=28 rows=4
                                  onKeyDown="textCounter(this.form.message,this.form.remLen,250);"
                                  onKeyUp="textCounter(this.form.message,this.form.remLen,250);"></textarea>
                        <br/>
                        <input readonly type="hidden" id="remLenid" name=remLen size=3 maxlength=3 value="250"/><span
                            id="spanid">250</span>&nbsp;characters left</font>
                            
                     </div> 
               		   <span id="selFeedback">
	                   		<a id="feedbackDetails" onclick="storeEmployeeFeedback('feedback');">
							Leave Feedback</a> | <a href="#"  onclick="return hiding_pop_up('feedback')">Close</a>
	                    </span>
	                    <span style="display:none" id="feedbackProgress">
	                    	<img src="${ctx}/styles/default/images/pleasewait.gif"/>
	                    </span>
	                    <span style="display:none" id="feedbackSuccess">
	                    	Feedback added successfully. <a href="#"  onclick="return hiding_pop_up('feedback')">Close</a>
	                    </span>
	                    <span style="display:none" id="feedbackFailure">
	                    	Sorry, unable to add your feedback. <a href="#"  onclick="return hiding_pop_up('feedback')">Close</a>
	                    </span>                       
                </form>
            </div>
            <span class="clear-both"><!-- for IE6 --></span>
        </div>
    </div>
</div>

<div id="confirm_add" class="popup1">
    <div class="popup1-content">
        <div class="pu_row">
            <div class="pu_col"><img src="${ctx}/styles/default/images/mobc_default_profile_pic.jpg" alt="New Friend"/>
            </div>
            <div class="pu_col">
                <form>
                    <s:hidden id="employeeProfileId" name="employeeProfileId"/>
                    <div id="contact_details">
                    <h6>Profiles : </h6>
                    <s:select
                            list="profiles"
                            listKey="id"
                            headerKey="1"
                            headerValue="Please Select"
                            listValue="name" id="associatedProfileId" onchange="getPrivacyGroups();"/><br/>
                  
                    <h6>Privacy Group: </h6>
                    <div id="contactTypeDiv">
                    <s:select
                            list="contactTypesList"
                            listKey="name"
                            headerKey="1"
                            headerValue="Please Select"
                            listValue="name" name="contactType" id="selContactId"/>
                     </div>
                      </div>  <br/>
               		   <span id="selContact">
	                   		<a id="contactid" onclick="createContact('confirm_add');">
							Add as Contact</a> | <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span>
	                    <span style="display:none" id="progress">
	                    	<img src="${ctx}/styles/default/images/pleasewait.gif"/>
	                    </span>
	                    <span style="display:none" id="success">
	                    	Contact added successfully. <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span>
	                    <span style="display:none" id="failure">
	                    	Sorry, unable to add the contact. <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span>  
	                     <h5> <span style="display:none" id="contactExist">
	                    	You are already connected to this profile<a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span></h5>              
                </form>
            </div>
            <span class="clear-both"><!--  for IE6 --> </span>
        </div>
    </div>
</div>


<br class="clear-both"/>
</div>


<script src="<c:url value='/styles/default/js/viewingEmployeeProfileFromEmployeeSearch.js'/>" type="text/javascript"></script>



