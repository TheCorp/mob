	<%@ include file="/common/taglib.jsp"%>
	<%@ taglib uri="/MOB" prefix="mob"%>

	<div id="bc_main_outer">
	<div id="bc_main_mid">

 <div id="bc_profile_outernav">
   <div class="outer_page_nav">

   <ul>
		   <li>
		  <a href="${ctx}/myGroups/groupsProfile.action?group.id=<s:property value="group.id"/>&profile.id=<s:property value="profile.id"/>">View Group Profile</a>
		   </li>
		   <li class="active">
		  <a href="${ctx}/myGroups/viewGroupMembers.action?group.id=<s:property value="group.id"/>&profile.id=<s:property value="profile.id"/>">View Group Members</a>
		   </li>
		  		  		  
       </ul>
       </div>
       </div>
</div>
</div>

<!--#include file="mobc_footer.html"-->

<br />
<div id="bc_members" style="float:left;margin-top: -50px;margin-left: 158px;width: 958px">
					<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
						<div class="bc_greytbar">
	      					<h3 class="bc_gtb_title">Group Members / Admins</h3>
	     				</div>
	     				 
	     				<div class="scroll_content">
	     				<div class="bc_scroll_section">
		      					<table width="100%" cellspacing="0" cellpadding="5">
									<tbody>
	     				<tr class="even">
									<s:iterator value="groupOwnerList" status="rowstatus">
									<td><s:property value="Profile.name"/></td>
									</s:iterator>
									</tr>
								</tbody>
								</table>
								</div>
	     					<div class="bc_scroll_section">
	     					<div class="sec_title">Pending</div>
	     					<s:if test="groupInvitationProfiles.size==0">&nbsp;&nbsp;N/A</s:if>
		      					<table width="100%" cellspacing="0" cellpadding="5">
									<tbody>
									<s:if test="groupInvitationProfiles.size!=0">
									<tr class="sec_heading" style="po">
											<td>Name</td>
											<td></td>
											<td align="right">Accept</td>
											<td width="20px" align="right">&nbsp;&nbsp;Deny</td>
										</tr>
										</s:if>
									
									<s:if test="groupInvitationProfiles.size!=0">
										<s:iterator value="groupInvitationProfiles" status="rowstatus">
									   <tr class="<s:if test="#rowstatus.odd== true">odd</s:if><s:else>even</s:else>" >
											<td><s:property value="profile.name" /></td>
													<s:if test="existGroup.profile.profileOwner.id==user.id  || groupAdmin.role.id==5 ||groupAdmin.role.id==4 ">
											<td>would like to Join this  Group</td>
											<td align="right">
											<a title="Accept" href="${ctx}/myGroups/acceptGroupJoinedProfileFromGrpMembers.action?profile.id=<s:property value="profile.id"/>&groupId=<s:property value="groupId"/>" >
												<img src="${ctx}/styles/default/images/grncheck-onwhite.jpg"/>
											</a>
											</td>
											<td align="right">
											<a title="Deny" href="${ctx}/myGroups/denyGroupJoinedProfileFromGrpMembers.action?profile.id=<s:property value="profile.id"/>&groupId=<s:property value="groupId"/>" >
												<img src="${ctx}/styles/default/images/mobc_redx.gif"/>
											</a>
											
											</td>
										</s:if>
										</tr>
										</s:iterator>
										</s:if>
										
									</tbody>
									
								</table>
	      					</div>
	      					<div class="grey_line"></div>
	      					<div class="bc_scroll_section">
	      					
	      					<div class="sec_title">Owner</div>
	      					<s:if test="groupMemberList.size==0">&nbsp;&nbsp;N/A</s:if>
	      						<table width="100%" cellspacing="0" cellpadding="5">
									<tbody>
									<s:if test="groupMemberList.size!=0">
									<tr class="sec_heading">
											<td>Name</td>
											<td></td>
											<td align="">Action</td>
											<td width="20px" align="right">Delete</td>

										</tr>
									</s:if>
									
									<s:if test="groupMemberList.size!=0">
										   <s:iterator value="groupMemberList" status="rowstatus">
										   	<s:if test="groupOwner.role.id==5">
									<tr class="<s:if test="#rowstatus.odd== true">odd</s:if><s:else>even</s:else>" >
										<td><s:property value="profile.name"/> </td>

										   	<s:if test="existGroup.profile.profileOwner.id==user.id  || groupAdmin.role.id==5 ||groupAdmin.role.id==4 ">
						                <td align="right">
											<s:if test="admin!=true">
											
											</s:if>		
											<s:else>
												<s:if test="groupAdmin.role.id==5">
												<a title="Remove Admin" href="${ctx}/myGroups/removeGroupOwnerFromGrpMembers.action?profile.id=<s:property value="profile.id"/>&groupId=<s:property value="groupId"/>" >
												Remove Owner
											   </a>
						              		
												</s:if>
												
											
											</s:else>	
													
											</td>
											
											<td align="right">
											<a title="Delete" href="${ctx}/myGroups/deleteGroupMembersFromGrpMembers.action?profile.id=<s:property value="profile.id"/>&groupId=<s:property value="groupId"/>" >
												<img src="${ctx}/styles/default/images/mobc_prof_action_btn-redx.gif">
											</a>
											</td>
											</s:if>
											
										</tr>
										</s:if>
									   </s:iterator>
									   </s:if>
									</tbody>
								</table>
	      					</div>
	      					<div class="grey_line"></div>
	      					
	      					
	      					
	      					<div class="grey_line"></div>
	      					<div class="bc_scroll_section">
	      					<div class="sec_title">Admin</div>
	      				<s:if test="groupMemberList.size==0">&nbsp;&nbsp;N/A</s:if>
	      						<table width="100%" cellspacing="0" cellpadding="5">
									<tbody>
									<s:if test="groupMemberList.size!=0">
									<tr class="sec_heading">
											<td>Name</td>
											<td align=""></td>
											<td align="">
											Action</td>
											<td width="20px" align="right">Delete</td>
										</tr>
									</s:if>
									
									
									<s:if test="groupMemberList.size!=0">
									 <s:iterator value="groupMemberList" status="rowstatus">
										   	<s:if test="groupOwner.role.id==4">
									<tr class="<s:if test="#rowstatus.odd== true">odd</s:if><s:else>even</s:else>" >
										<td><s:property value="profile.name"/> </td>
										   	<s:if test="existGroup.profile.profileOwner.id==user.id  || groupAdmin.role.id==5 ||groupAdmin.role.id==4 ">
											<td align="right">
											<s:if test="admin!=true">
											
											</s:if>		
											<s:else>
												<s:if test="groupOwner.role.id==4">
											<a title="Remove Admin" href="${ctx}/myGroups/removeGroupAdminFromGrpMembers.action?profile.id=<s:property value="profile.id"/>&groupId=<s:property value="groupId"/>" >
												Remove Admin
											</a>&nbsp;
						              	<a title="Make Owner" href="${ctx}/myGroups/makeGroupOwnerFromGrpMembers.action?profile.id=<s:property value="profile.id"/>&groupId=<s:property value="groupId"/>" >
												Make Owner
											</a>		
												</s:if>
												<s:if test="groupOwner.role.id==5">
												
																										
											</s:if>
											
											</s:else>	
													
											</td>
											<td></td>
											<td align="right">
											
											<a title="Delete" href="${ctx}/myGroups/deleteGroupMembersFromGrpMembers.action?profile.id=<s:property value="profile.id"/>&groupId=<s:property value="groupId"/>" >
												<img src="${ctx}/styles/default/images/mobc_prof_action_btn-redx.gif">
											</a>
											</td>
											</s:if>
											
										</tr>
										</s:if>
									   </s:iterator>
									   </s:if>
									  
									</tbody>
								</table>
	      					</div>
	      					<div class="grey_line"></div>
	      					
	      					
	      					
	      					<div class="grey_line"></div>
	      					<div class="bc_scroll_section">
	      					<div class="sec_title">Members</div>
	      					
	      					<s:if test="groupMemberList.size==0">&nbsp;&nbsp;N/A</s:if>
	      						<table width="100%" cellspacing="0" cellpadding="5">
									<tbody>
									<s:if test="groupMemberList.size!=0">
									<tr class="sec_heading">
											<td>Name</td>
											<td></td>
											<td align="">Action</td>
											<td width="20px" align="right">Delete</td>
										</tr>
									</s:if>
									
									<s:if test="groupMemberList.size!=0">
										 <s:iterator value="groupMemberList" status="rowstatus">
										 <s:if test="joinGroupMember==1">
										<tr class="<s:if test="#rowstatus.odd== true">odd</s:if><s:else>even</s:else>" >
											
												<td><s:property value="profile.name"/> </td>
												<td align="right">
												 <s:if test="groupAdmin.role.id==4||groupAdmin.role.id==5">
												     <a title="Make Admin" href="${ctx}/myGroups/makeGroupAdminFromGrpMembers.action?profile.id=<s:property value="profile.id"/>&groupId=<s:property value="groupId"/>" >
														Make Admin
													 </a>
												  </s:if>
												</td>
												<td></td>
												<td align="right">
												<a title="Delete" href="${ctx}/myGroups/deleteGroupMembersFromGrpMembers.action?profile.id=<s:property value="profile.id"/>&groupId=<s:property value="groupId"/>" >
												<img src="${ctx}/styles/default/images/mobc_prof_action_btn-redx.gif">
											</a>
											</td>
											</tr>
											</s:if>
										 </s:iterator>
									   </s:if>
									  
									</tbody>
								</table>
	      					</div>
	      					<div class="grey_line"></div>
	      					
	      					
	      					
							<br class="clear-both">
						</div>
					</div></div></div></div></div>
				</div>
				<br class="clear-both">





	
	<script src="<c:url value='/styles/default/js/jobSearchCriteria.js'/>"
		type="text/javascript"></script>
