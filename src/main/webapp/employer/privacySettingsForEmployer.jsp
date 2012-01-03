<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />


<div id="bc_main_outer">

	<div id="bc_main_mid">
		<div id="bc_profile_outernav"><div class="outer_page_nav centered"><ul>
		<li class="active">
		<!--
		<s:url id="privacySettings" action="privacySettingsForEmployer.action"></s:url>
		<s:a href="%{privacySettings}">Privacy</s:a>
		-->
		<a  href="${ctx}/employer/privacySettingsForEmployer.action?profile.id=<s:property value="profile.id"/>">Privacy</a>
		</li>
		<li>
		<!--
		<s:url id="privacyGroups" action="privacyGroupForEmployer.action"></s:url>
		<s:a href="%{privacyGroups}">Privacy Groups</s:a>
		-->
		<a  href="${ctx}/employer/privacyGroupForEmployer.action?profile.id=<s:property value="profile.id"/>">Privacy Groups</a>
		</li></ul></div></div>
		<div class="bc_main_inner clear-both">
			<div id="bc_profile_sec" class="r_sel_prof">
				<div class="bc_light_box select_profile"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
					<h2 class="prof_sub_header">Employer - Privacy Settings</h2>
					<p class="prof_sub_sub">Select which of your privacy groups you want to be able to see these items.</p>

					<form id="privacySettingsForm" action="addPrivacySettingsForEmployer.action">
					<s:hidden name="profile.id"/>
					<div class="row">
					<div class="col">
						<h5><s:property value="personalInfo.name"/></h5>
						
							   <div id="list" style="display: block">							
								     <ul>
								        <li style="list-style-type:none;">
								            <s:iterator value="selectedPersonalPrivacyGroupNames">
								               <s:property/><br>					               
								            </s:iterator>
								        </li>
								     </ul>
							     </div>
								<div id="editlist" style="display: none">
									<s:select name="personalPrivacyGroups"
								       list="privacyGroupList"
								       listKey="id"
								       value="selectedPersonalPrivacyGroup"
								       listValue="name" size="5" multiple="true">
								     </s:select>
							     </div>					     
							  <div id="editImage" style="display: block">
							     <a href="#" onclick="getPersonalPrivacyGroups()" >Edit<img  src="${ctx}/styles/default/images/exp_entry-edit.gif"/></a>
							  </div>
						     
					</div>
					
					<div class="col">
					   
						     <h5><s:property value="desiredWork.name"/></h5>
						     
						     <div id="desiredWorkList" style="display: block">						
							     <ul>
							        <li style="list-style-type:none;">
							        
							            <s:iterator value="selectedDesiredWorkPrivacyGroupNames">
							               <s:property/><br>				               
							            </s:iterator>				            
							        </li>
							     </ul>			     
						     </div>
					        <div id="desiredWorkEditList" style="display: none">
					
									<s:select name="desiredPrivacyGroups"
								       list="privacyGroupList"
								       listKey="id"
								       value="selectedDesiredWorkPrivacyGroup"
								       listValue="name" size="5" multiple="true">
								     </s:select>
					       </div>
					      <div id="desiredWorkEditImage" style="display: block"><a href="#" onclick="getDesiredPrivacyGroups()" >Edit<img  src="${ctx}/styles/default/images/exp_entry-edit.gif"/></a></div>   
					</div>
					<div class="col">
					
							<h5><s:property value="workExperience.name"/></h5>
							
							   <div id="workExperienceList" style="display: block">						
							     <ul>
							        <li style="list-style-type:none;">
							        
							            <s:iterator value="selectedWorkExperiencePrivacyGroupNames">
							               <s:property/><br>				               
							            </s:iterator>				            
							        </li>
							     </ul>			     
						     </div>
					        <div id="workExperienceEditList" style="display: none">
					
									<s:select name="workExperiencePrivacyGroups"
							       list="privacyGroupList"
							       listKey="id"
							       value="selectedWorkExperiencePrivacyGroup"
							       listValue="name" size="5" multiple="true">
							     </s:select>
					       </div>
					      <div id="workExperienceEditImage" style="display: block"><a href="#" onclick="getWorkExperiencePrivacyGroups()" >Edit<img src="${ctx}/styles/default/images/exp_entry-edit.gif"/></a></div>				     
							     
							     
					</div>
					<div class="col">
					
							<h5><s:property value="educationExperience.name"/></h5>
							   <div id="educationList" style="display: block">						
							     <ul>
							        <li style="list-style-type:none;">
							        
							            <s:iterator value="selectedEducationExperiencePrivacyGroupNames">
							               <s:property/><br>				               
							            </s:iterator>				            
							        </li>
							     </ul>			     
						     </div>
					        <div id="educationEditList" style="display: none">
					
									<s:select name="educationExperiencePrivacyGroups"
							       list="privacyGroupList"
							       listKey="id"
							       value="selectedEducationExperiencePrivacyGroup"
							       listValue="name" size="5" multiple="true">
							     </s:select>
					       </div>
					      <div id="educationEditImage" style="display: block"><a href="#" onclick="getEducationPrivacyGroups()" >Edit<img src="${ctx}/styles/default/images/exp_entry-edit.gif"/></a></div>				     
							     
					</div>
					<div class="col">
					
						<h5><s:property value="profilePicture.name"/></h5>
							
							   <div id="profilePictureList" style="display: block">						
							     <ul>
							        <li style="list-style-type:none;">
							        
							            <s:iterator value="selectedProfilePicturePrivacyGroupNames">
							               <s:property/><br>				               
							            </s:iterator>				            
							        </li>
							     </ul>			     
						     </div>
					        <div id="profilePictureEditList" style="display: none">
					
								<s:select name="profilePicturePrivacyGroups"
							       list="privacyGroupList"
							       listKey="id"
							       value="selectedProfilePicturePrivacyGroup"
							       listValue="name" size="5" multiple="true">
							     </s:select>
					       </div>
					      <div id="profilePictureEditImage" style="display: block"><a href="#" onclick="getProfilePicturePrivacyGroups()" >Edit<img src="${ctx}/styles/default/images/exp_entry-edit.gif"/></a></div>				     
							     
					</div>
					<div class="col">     
					
					
							<h5><s:property value="friendList.name"/></h5>
							
							      <div id="friendList" style="display: block">						
							     <ul>
							        <li style="list-style-type:none;">
							        
							            <s:iterator value="selectedFriendListPrivacyGroupNames">
							               <s:property/><br>				               
							            </s:iterator>				            
							        </li>
							     </ul>			     
						     </div>
					        <div id="friendEditList" style="display: none">
					
								<s:select name="friendListPrivacyGroups"
							       list="privacyGroupList"
							       listKey="id"
							       value="selectedFriendListPrivacyGroup"
							       listValue="name" size="5" multiple="true">
							     </s:select>
					       </div>
					      <div id="friendEditImage" style="display: block"><a href="#" onclick="getFriendPrivacyGroups()" >Edit<img src="${ctx}/styles/default/images/exp_entry-edit.gif"/></a></div>				     
							     
					</div>
					         
					</div>
					<div class="submit_btn_cont">
					<span id="submit_btn_id" style="display: none">
		    		<input type="image" src="${ctx}/styles/default/images/red_submit_btn-up.png" />
					<a  href="${ctx}/employer/privacySettingsForEmployer.action?profile.id=<s:property value="profile.id"/>">Cancel</a>
					</span>
					</div>
					</form>

					<br /><br />
				</div></div></div></div></div>
	<script src="<c:url value='/styles/default/js/privacySettings.js'/>" type="text/javascript"></script>	