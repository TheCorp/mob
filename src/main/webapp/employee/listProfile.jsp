<%@ include file="/common/taglib.jsp"%>

<div id="select_profile_to_edit">
<div id="bc_main_outer">
<!--<s:hidden key="id" name="profile.id"
	id="profileid"></s:hidden> <s:hidden name="user.id" value="%{user.id}" />
-->
<div id="bc_main_mid">

<div class="bc_main_inner clear-both">
<div id="outerlgb">
<div class="lgrey_box">
<div class="lgrey_box-r">
<div class="lgrey_box-b">
<div class="red_bar">

<h1>Edit Profiles For <s:property value="user.firstName" />,</h1>
<h4 class="ta-left"><span style="color: White">(<s:property value="user.email"/>)</span></h4>
<!--<h4 class="ta-right"><s:a href="${ctx}/employee/loadEmployeeAccount.action"></s:a></h4>
--></div>
<div class="lgrey_simple select_profile">
<div class="lgrey_simple-b">
<div class="lgrey_simple-l">
<div class="lgrey_simple-r">
<div class="lgrey_simple-tl">
<div class="lgrey_simple-tr">
<div class="lgrey_simple-bl">
<div class="lgrey_simple-content">
<h2>Your Profiles</h2>

<s:iterator value="profiles">

	<div class="sel_prof_row">
	<s:url id="view" action="myContactAction1">
		<s:param name="profile.id" value="id" />
	</s:url>
	<s:url id="makeDefault" action="makeAsDefaultProfile">
		<s:param name="newDefaultProfile.id" value="id" />
	</s:url>

	<div class="sel_prof_col spc_name" style="margin-top:-6px;">
	<p>
	<!--
	<s:a href="%{view}"><s:property value="name" />	</s:a>
	-->
	<a href="${ctx}/employee/myContactAction1.action?profile.id=<s:property value="id"/>"><s:property value="name" /></a>
	</p>&nbsp;
     <s:if test="status=='default'">(Default Profile)</s:if>
	 <s:else>
	 
	 <!--
	 <s:a href="%{makeDefault}">(Make Default)</s:a>
	 -->
	 <a href="${ctx}/employee/makeAsDefaultProfile.action?newDefaultProfile.id=<s:property value="id"/>">(Make Default)</a>
	 </s:else>
	 <br>
	<br>
		
	</div>

	<div class="sel_prof_col spc_views">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="viewCount" />&nbsp;Profile Views</div>
	<div class="sel_prof_col spc_items"><s:property value="itemCount" />&nbsp;Items in Briefcase</div>
	<div class="sel_prof_col spc_messages"><s:property value="inboxMessageCount" />&nbsp;Messages</div>
	<div class="sel_prof_col spc_notes">
		<s:if test="industry.name!=''">
		<s:property value="industry.name"/>
		</s:if>
	</div>
	<!--
	<s:url id="update" action="loadEmpProfileAction">
		<s:param name="profile.id" value="id"/>
	</s:url>
	<s:url id="delete" action="deleteEmployeeProfile">
		<s:param name="profile.id" value="id" />
	</s:url>
	
	-->
	<div class="sel_prof_col spc_actions1">
	<!--
	 <s:a href="%{update}">
	 <img src="${ctx}/styles/default/images/exp_entry-edit.gif" alt="Edit" onclick="getExperienceDetails()"/>
	 </s:a>
	 -->

	 <a href="${ctx}/employee/loadEmpProfileAction.action?profile.id=<s:property value="id"/>">
	 <img src="${ctx}/styles/default/images/exp_entry-edit.gif" title="Edit" alt="Edit" onclick="getExperienceDetails()"/>
	 </a>
	 <s:if test="status=='default'">
	 <a href="#" onclick="return popup_delete_defaultProfile(event,<s:property value='id'/>,'confirm_add',['center',300])"><img src="${ctx}/styles/default/images/mobc_redx.gif" title="Remove" alt="Remove" /></a>
	 </s:if>
	<s:else>
	<!--
	<s:a href="%{delete}">
	<img src="${ctx}/styles/default/images/mobc_redx.gif" alt="Remove" />
	</s:a>
	-->
	 <a href="${ctx}/employee/deleteEmployeeProfile.action?profile.id=<s:property value="id"/>">
	 <img src="${ctx}/styles/default/images/mobc_redx.gif" title="Remove" alt="Remove" />
	 </a>	
	</s:else>
	</div>
	</div>
</s:iterator>
<div id="add_profile"><s:a
	href="${ctx}/employee/addEmployeeProfile.action">
	<img src="${ctx}/styles/default/images/add_another_profile.png"
		alt="Add another profile" />
</s:a></div>

</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

<div id="confirm_add" class="popup1">
    <div class="popup1-content">
        <div class="pu_row">
            <div class="pu_col"><img src="${ctx}/styles/default/images/mobc_default_profile_pic.jpg" alt="New Friend"/>
            </div>
            <div class="pu_col">
                <form id="defaultProfileForm" action="deleteEmployeeProfile.action" method="post">
                	<s:hidden name="profile.id" id="defaultProfileId"/>
                	<s:if test ="nonDefaulProfiles.size()!=0">
                    <div id="contact_details">
                   <h6> Please select a profile as default profile 
                    before deleting your default profile.</h6><br/>
                    <h6><span style="display:none" id="pleaseSelectId">
	                   	<font color="red">Please select profile!</font><br/> 
	                 </span>
	                 </h6><br/> 
                    <h6>Profiles : </h6>
                    <s:select list="nonDefaulProfiles" 
                            listKey="id"
                            headerKey="1" headerValue="Please Select"
                            listValue="name" id="newDefaultProfileId" onchange="chkSelProfile()"/><br/>
                       <br/>
               		   <span id="selContact">
	                   		<s:a id="contactid" onclick="return setAsDefaultProfile('confirm_add');">
							Change as default profile</s:a> | <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span>
	                    </div>
	                    <span style="display:none" id="progress">
	                    	<img src="${ctx}/styles/default/images/pleasewait.gif"/>
	                    </span>
	                    <h6><span style="display:none" id="success">Default profile has changed.<br/><br/>
	                    	<a href="#"  onclick="deleteOldDefaultProfile()">Delete Profile</a>|
	                    	<a href="#"  onclick="getProfilesList()">Close</a>
	                    </span></h6>
	                    <h6><span style="display:none" id="changeprofile">Please select another profile as default profile.<br/>
	                    	<s:a id="changeprofileid" onclick="return setAsDefaultProfile('confirm_add');">
							Change as default profile</s:a> | <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span></h6>
	                  <h6><span style="display:none" id="failure">
	                    	Sorry, unable to set this profile as default profile.<br/> <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span> </h6>     
	                     </s:if> 
	                  <h5>  
	                   <s:else><span id="listEmpty">Sorry, there are no other profiles to choose from list as default profile.
	                     <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a> </span> </s:else>  </h5>      
                </form>
            </div>
            
            <span class="clear-both"><!--  for IE6 --> </span>
        </div>
    </div>
</div>

<script src="<c:url value='/styles/default/js/setDefaultProfileAsAnotherProfile.js'/>" type="text/javascript"></script>


