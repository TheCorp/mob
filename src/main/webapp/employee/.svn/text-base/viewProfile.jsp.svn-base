<%@ include file="/common/taglib.jsp"%>
<%@ taglib uri="/mob-tags" prefix="mob" %>
<div id="bc_main_outer">
<div id="bc_main_mid">
<u><s:label value="Profile Details"/></u><br>
<br>
<s:hidden key="id" name="education.id">
    <s:param name="value"> 
    <s:iterator value="profile.education">
    <s:property value="id"/>    
    </s:iterator>
    </s:param>     
    </s:hidden>
<mob:privacy item="Your Personal Information" target="profile.id">
<s:label value="Profile Name:"/> &nbsp;&nbsp;
<s:property value="profile.nickName" /><br>
<br>
<s:label value="Occupation:"/>
<s:property value="profile.occupation" /> <br>
<br>
<s:label value="daysavailable:"/> &nbsp;&nbsp;
<s:property value="profile.daysavailable" /><br>
<br>
<s:label value="hoursavailable:"/> &nbsp;&nbsp;
<s:property value="profile.hoursavailable" /><br>
<br>
<s:label value="workTimeframe:"/> &nbsp;&nbsp;
<s:property value="profile.workTimeframe" /><br>
<br>
<s:label value="skills:"/> &nbsp;&nbsp;
<s:property value=" profile.skills" /><br>
<br>
<s:label value="location:"/> &nbsp;&nbsp;
<s:property value="profile.location" /><br>
<br>
<s:label value="phoneNumber:"/> &nbsp;&nbsp;
<s:property value=" profile.phoneNumber" /><br>
<br>
</mob:privacy>

<s:url id="update" action="loadEmployeeProfileDetails">
	<s:param name="profile.id">
		<s:property value="profile.id" />
	</s:param>
</s:url> 
<s:a href="%{update}">Edit</s:a>
<br>
<br>

<mob:privacy item="Education Experience" target="profile.id">
<u><s:label value="Education Details"></s:label></u><br>


<s:iterator value="profile.education"><br>

	<s:label value="degree:"/> &nbsp;&nbsp;
	<s:property value="degree" />
	<br>
	<br>
	<s:label value="institutionName:"/> &nbsp;&nbsp;
	<s:property value="institutionName" />
	<br>
	<br>
</s:iterator> 
<s:hidden name="education.id">
    <s:param name="value"> 
    <s:iterator value="profile.education">
    <s:property value="id"/>    
    </s:iterator>
    </s:param>     
    </s:hidden>

<br>
<s:url id="update" action="loadEmployeeEducationDetails">
	<s:param name="profile.id">
		<s:property value="profile.id" />
	</s:param>
</s:url> 
<s:a href="%{update}">Edit</s:a>

 
<s:url id="deleteEducation" action="deleteEmployeeEducationDetails">
	<s:param name="education.id">
	<s:iterator value="profile.education">
	<s:property value="id"/>    
    </s:iterator>
    </s:param> 
</s:url> 
<s:a href="%{deleteEducation}">Delete</s:a>
<br>
<s:url id="addeducation" value="addNewEducationDetails.action">
</s:url>
<s:div theme="ajax" href="%{addeducation}"/>
 
<br>
</mob:privacy>


<u><s:label value="Experience Details"/></u><br>
<s:iterator value="profile.experience"><br>

	<s:label value="employerName:"/> &nbsp;&nbsp;
	<s:property value="employerName" />
	<br>
	<br>
	<s:label value="jobType:"/> &nbsp;&nbsp;
	<s:property value="jobType" />
	<br>
	<br>
	<s:label value="description:"/> &nbsp;&nbsp;
	<s:property value="description" />
	<br>
	<br>
</s:iterator> 
<s:hidden name="experience.id">
    <s:param name="value"> 
    <s:iterator value="profile.experience">
    <s:property value="id"/>    
    </s:iterator>
    </s:param>     
    </s:hidden>
<s:url id="update" action="loadEmployeeExperienceDetails">
	<s:param name="profile.id">
		<s:property value="profile.id" />
	</s:param>
</s:url> 
<s:a href="%{update}">Edit</s:a> 

<s:url id="deleteExperience" action="deleteEmployeeExperienceDetails">
	<s:param name="experience.id">
	<s:iterator value="profile.experience">
	<s:property value="id"/>    
    </s:iterator>
    </s:param> 
</s:url> 
<s:a href="%{deleteExperience}">Delete</s:a>
<br><br>
<s:url id="delete"
	action="deleteEmployeeProfile">
	<s:param name="profile.id">
		<s:property value="profile.id" />
	</s:param>
</s:url> 
<s:a href="%{delete}">Delete Profile</s:a></div>

<!--Added for Total no. of contacts Functionality By Jyoti and Chandrika 29 Aug   -->

<s:url id="addAsContact" action="addEmployeeContact">

	<s:param name="profile.id">
		<s:property value="profile.id" />
	</s:param>

</s:url> <s:a href="%{addAsContact}">Add as Contact</s:a> 

<s:url id="noOfContacts" action="viewTotalnoOfContacts">
	<s:hidden key="id" name="user.id" />
	<s:param name="user.id">
		<s:property value="user.id" />
	</s:param>
</s:url> <s:a href="%{noOfContacts}">No. Of Contacts</s:a>

<!--End of for Total no. of contacts Functionality By Jyoti and Chandrika 29 Aug   -->
</div>
