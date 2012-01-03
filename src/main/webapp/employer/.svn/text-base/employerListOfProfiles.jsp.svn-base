<%@ include file="/common/taglib.jsp"%>


<div id="select_profile_to_edit">
<div id="bc_main_outer">
<div id="bc_main_mid">

<div class="bc_main_inner clear-both">
<div id="outerlgb">
<div class="lgrey_box">
<div class="lgrey_box-r">
<div class="lgrey_box-b">
<div class="red_bar">

<h1>Edit Profiles For <s:property value="user.organizationName" />,</h1>
<h4 class="ta-left">(<s:property value="user.email"/>)</h4>
<h4 class="ta-right"><s:a href="${ctx}/employer/listopportunities.action">Edit Account</s:a></h4>
</div>
<div class="lgrey_simple select_profile">
<div class="lgrey_simple-b">
<div class="lgrey_simple-l">
<div class="lgrey_simple-r">
<div class="lgrey_simple-tl">
<div class="lgrey_simple-tr">
<div class="lgrey_simple-bl">
<div class="lgrey_simple-content">
<h2>Your Profiles</h2>


<s:iterator value="profilelist">
	<div class="sel_prof_row">
	<s:url id="view" action="loademployerprofile"><s:param name="profile.id" value="id" /></s:url>
	<div class="sel_prof_col spc_name"><s:a href="%{view}"><s:property value="name" /><br><br></s:a></div>
	<div class="sel_prof_col spc_views"><s:property value="viewCount" />Profile Views</div>
	<div class="sel_prof_col spc_items"><s:property value="itemcount" />Items in Briefcase</div>
	<div class="sel_prof_col spc_messages"><s:property value="inboxMessageCount" /> Messages</div>
	<div class="sel_prof_col spc_notes">
	<s:if test="jobcategory!=''">
	<s:property value="jobcategory"/>
	</s:if>
	</div>
	<s:url id="update" action="setUpForInsertOrUpdate">
		<s:param name="profile.id" value="id"/>
	</s:url>
	<s:url id="delete" action="deleteProfile">
		<s:param name="profile.id" value="id" />
	</s:url> 
	<div class="sel_prof_col spc_actions">
	 <s:a href="%{update}"><img src="${ctx}/styles/default/images/exp_entry-edit.gif" alt="Edit"/></s:a>
	 <s:a href="%{delete}"><img src="${ctx}/styles/default/images/mobc_redx.gif" alt="Remove" /></s:a>
	</div>
	</div>
</s:iterator>

<div id="add_profile">
<s:a href="${ctx}/employer/employerProfile.action">
	<img src="${ctx}/styles/default/images/add_another_profile.png" alt="Add another profile" />
</s:a>
</div>
<div id="save_profile_changes">
 <!--    <img	src="${ctx}/styles/default/images/save_profile_changes.png" alt="Save" /> -->
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
</div>

<script type="text/javascript" src="<c:url value='/styles/default/js/autosuggest.js'/>"></script>
