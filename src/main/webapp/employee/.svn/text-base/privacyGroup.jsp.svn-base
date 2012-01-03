<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<div id="bc_home">
<div id="bc_main_outer">
	<div id="bc_main_mid">

		<div class="bc_main_inner clear-both r_sel_prof">
			<div id="outerlgb"><div class="lgrey_box"><div class="lgrey_box-r"><div class="lgrey_box-b">
				<div class="red_bar"><div class="red_bar-l"><div class="red_bar-r">
					<h1>Define Privacy Groups</h1>
					<h4 class="ta-right">
					<!--<s:url id="privacy" action="privacy.action">
				    <s:param name="profile.id" value="profile.id"/>
			   	    </s:url>
					<s:a href="%{privacy}">Privacy Settings</s:a>
					-->
					<a href="${ctx}/employee/privacy.action?profile.id=<s:property value="profile.id"/>">Privacy Settings</a>
					
					</h4>
				</div></div></div>
				<div class="lgrey_simple select_profile"><div class="lgrey_simple-b"><div class="lgrey_simple-l"><div class="lgrey_simple-r"><div class="lgrey_simple-tl"><div class="lgrey_simple-tr"><div class="lgrey_simple-bl"><div class="lgrey_simple-content">
					<h2 class="prof_sub_header">Privacy Groups</h2>
					
					<form id="privacyGroupsForm">
					<s:hidden name="profile.id" id="profileId"/>
						<div class="privacy_groups_container">
							<div class="sel_prof_headers">
								<div class="sel_prof_col spc_privacygroup"><h3><b>Privacy Group</b></h3></div>
								<div class="sel_prof_col spc_accessto"><h3><b>Access To</b></h3></div>
								<div class="sel_prof_col spc_datecreated"><h3><b>Date Created</b></h3></div>
							</div>
							<div id="privacygroups">
							<s:iterator value="privacyGroupDetailsList" status="rowstatus" >
							<div class="sel_prof_row">
								<div class="sel_prof_col spc_privacygroup" style="width: 158px"><s:property value="name"/></div>
								<div class="sel_prof_col spc_accessto">
								<s:iterator value="privateItems" status="rowstatus1">
								<s:property value="name"/><s:if test="!#rowstatus1.last">,</s:if>
								</s:iterator>
								</div>
								<div class="sel_prof_col spc_datecreated"><s:date name="createdDate" format="MM-dd-yyyy"/></div>
							</div>
							</s:iterator>
							</div>
						</div>
						<div id="addPrivacyGroup">
							<h5>Add a New Group</h5>
							<span class="input_gi">
							<span class="input_gi-l">
							<span class="input_gi-r">
							<input type="text"  id="groupName" name="group_name" />
							</span>
							</span>
							</span>
							<img class="add_btn" src="${ctx}/styles/default/images/add_entry_btn-up.png" onclick="addPrivacygroup();" /><br><br>
							<h5><span style="display:none;color:red;" id="privacygroupEmpty">
					         	Please enter Privacy group name.
					        </span></h5>
							<h5><span style="display:none;color:black" id="privacygroupSuccess">
					         	Privacy group added successfully.
					        </span></h5>
					        <h5><span style="display:none;color:black" id="privacygroupFailure">
					         	Sorry, unable to add privacy group.
				         	</span></h5>
						</div>
					</form>
				</div></div></div></div></div></div></div></div>
			</div></div></div></div>
		</div>
	</div>
</div>
</div>

<script src="<c:url value='/styles/default/js/addPrivacyGroup.js'/>"	type="text/javascript"></script>




