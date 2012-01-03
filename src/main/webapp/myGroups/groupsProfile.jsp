
<%@ include file="/common/taglib.jsp"%>
<%@ taglib uri="/MOB" prefix="mob"%>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<style>
.closetxt
{
  margin-bottom:50px;
}
</style>
<script type="text/javascript" src="<c:url value='/styles/default/js/groups/grouppagination.js'/>"></script>
<script type="text/javascript">

    $(document).ready(function() {
       showHideGroupData();
       $("#groupdiscussionId").val("");
       
    });
</script>



<div id="bc_main_outer">
 <div id="bc_main_mid" style="padding: 0 0 300px 0">
   <div id="bc_profile_outernav">
   <div class="outer_page_nav">

   <ul>
		   <li class="active">
		  <a href="${ctx}/myGroups/groupsProfile.action?group.id=<s:property value="group.id"/>&profile.id=<s:property value="profile.id"/>">View Group Profile</a>
		   </li>
		   <!--  <li>
		  <a href="${ctx}/myGroups/viewGroupMembers.action?group.id=<s:property value="group.id"/>&profile.id=<s:property value="profile.id"/>">View Group Members</a>
		   </li> -->
		  
		  		  		  
       </ul>
       </div>
       </div>
      
  <div class="bc_main_inner clear-both">
   <div id="bc_profile_sec_VP_Group">
    <div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content_VP">
     <div id="bc_profile_pic_spot_VP" style="width:152px;">
      <div class="bc_pps_pic_VP">
       <div id="bc_profile_pic"> 
      
      <s:if test="existGroup.icon!=null">		
         <a rel="ibox" href='<s:property value="icon"/>'>
      	<img src='<s:property value="resizedPicture"/>' alt="" align="top"/>
       </a>
      			   
	
		</s:if>
		<s:else>
		<img src="${ctx}/styles/default/images/mobc_default_profile_pic.jpg" alt="" />
		</s:else>
       
       </div>
      </div>
     
     </div>
    				<div id="bc_profile_info_VP" style="float:left;margin-left:9px;width:280px;">
							<h3 id="bc_profile_name_VP"><s:property value="groupName"/></h3>
							
								<s:iterator value="groupOwnerList" status="rowstatus">
							<div class="bc_pi_details">
								<div class="bc_pi_d_line"><h3>Industry:</h3><h4><s:property value="profile.jobcategory"/></h4></div>
								<div class="bc_pi_d_line"><h3>Location:</h3><h4><s:property value="profile.profileOwner.city"/></h4></div>
								<div class="bc_pi_d_line"><h3>Group Access:</h3><h4><s:property value="title"/></h4></div>
								<div class="bc_pi_d_line"><h3>Group Owner:</h3><h4><s:property value="profile.Name"/></h4></div>
							</div>
							</s:iterator>
						</div>
						<br class="clear-both"> 
						<div class="bc_statement" style="padding-top: 10px;">
							<div id="bc_personal_statement" style="margin:0px;">Description</div>
							<p><s:property value="existGroup.description"/></p>
						</div>
						
					</div></div></div></div></div>
				</div>
				
				<div id="bc_members">
					<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
						<div class="bc_greytbar">
	      					<h3 class="bc_gtb_title_groupmembers">Group Members / Admins</h3>
	     				</div>
	     				 
	     				<div class="scroll_content">
	     				
	     					<div class="bc_scroll_section">
	     					
	     					<div class="sec_title">Pending</div>
	     					<s:if test="groupInvitationProfiles.size==0">&nbsp;&nbsp;No Members Yet</s:if>
		      					<table width="100%" cellspacing="0" cellpadding="5">
									<tbody>
									<s:if test="groupInvitationProfiles.size!=0">
									<tr class="sec_heading">
											<td>Name</td>
										
											<td align="right">Accept</td>
											<td width="60px" align="right">&nbsp;&nbsp;Deny</td>
										</tr>
										</s:if>
									
									<s:if test="groupInvitationProfiles.size!=0">
										<s:iterator value="groupInvitationProfiles" status="rowstatus">
									   <tr class="<s:if test="#rowstatus.odd== true">odd</s:if><s:else>even</s:else>" >
											<td><s:property value="profile.name" /></td>
													<s:if test="existGroup.profile.profileOwner.id==user.id  || groupAdmin.role.id==5 ||groupAdmin.role.id==4 ">
											<td>would like to Join this  Group</td>
											<td align="right">
											<a title="Accept" href="${ctx}/myGroups/acceptGroupJoinedProfile.action?profile.id=<s:property value="profile.id"/>&groupId=<s:property value="groupId"/>" >
												<img src="${ctx}/styles/default/images/grncheck-onwhite.jpg"/>
											</a>
											</td>
											<td align="right">
											<a title="Deny" href="${ctx}/myGroups/denyGroupJoinedProfile.action?profile.id=<s:property value="profile.id"/>&groupId=<s:property value="groupId"/>" >
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
	      					 <s:if test="groupMemberList.size==0 && groupOwnerList.size==0">&nbsp;&nbsp;No Members Yet</s:if>
	      					 
	      						<table width="100%" cellspacing="0" cellpadding="5">
									<tbody>
									<s:if test="groupMemberList.size!=0 || groupOwnerList.size!=0">
									<tr class="sec_heading">
											<td style="width: 300px;">Name</td>
											<td align="right" style="width: 100px">Action</td>
											<td width="50px" align="right">Delete</td>

										</tr>
									</s:if>
									
									<tr class="odd">
									<s:iterator value="groupOwnerList" status="rowstatus">
									<td><s:property value="Profile.name"/></td>
									</s:iterator>
									</tr>
									
									<s:if test="groupMemberList.size!=0">
										   <s:iterator value="groupMemberList" status="rowstatus">
										   	<s:if test="groupOwner.role.id==5">
									<tr class="<s:if test="#rowstatus.odd== true">odd</s:if><s:else>even</s:else>" >
										<td  style="width: 300px;"><s:property value="profile.name"/> </td>

										   	<s:if test="existGroup.profile.profileOwner.id==user.id  || groupAdmin.role.id==5 ||groupAdmin.role.id==4 ">
						                <td align="right"  style="width: 100px">
											<s:if test="admin!=true">
											
											</s:if>		
											<s:else>
										
												<s:if test="groupAdmin.role.id==5">
												<a title="Remove Admin" href="${ctx}/myGroups/removeGroupOwner.action?profile.id=<s:property value="profile.id"/>&groupId=<s:property value="groupId"/>" >
												Remove Owner
											   </a>
						              		
												</s:if>
												
											
											</s:else>	
													
											</td>
											<td align="right">
											<a title="Delete" href="${ctx}/myGroups/deleteGroupMembers.action?profile.id=<s:property value="profile.id"/>&groupId=<s:property value="groupId"/>" >
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
	      					
	      					
	      					<div class="bc_scroll_section">
	      						
	      					<div class="sec_title">Admin</div>
	      				   <s:if test="groupMemberList.size==0">&nbsp;&nbsp;No Members Yet</s:if>
	      					
	      						<table width="100%" cellspacing="0" cellpadding="5">
									<tbody>
									<s:if test="groupMemberList.size!=0">
									<tr class="sec_heading">
											<td style="width: 300px;">Name</td>
											
											<td align="right"  style="width: 100px">Action</td>
											<td width="50px" align="right">Delete</td>

										</tr>
									</s:if>
									
									
									<s:if test="groupMemberList.size!=0">
									 <s:iterator value="groupMemberList" status="rowstatus">
										   	<s:if test="groupOwner.role.id==4">
										   	
										   	
									<tr class="<s:if test="#rowstatus.odd== true">odd</s:if><s:else>even</s:else>" >
										<td style="width: 300px;"><s:property value="profile.name"/> </td>
										
										   	<s:if test="existGroup.profile.profileOwner.id==user.id  || groupAdmin.role.id==5 ||groupAdmin.role.id==4 ">
											<td align="right" style="width: 250px">
											<s:if test="admin!=true">
											
											</s:if>		
											<s:else>
												<s:if test="groupOwner.role.id==4">
											<a title="Remove Admin" href="${ctx}/myGroups/removeGroupAdmin.action?profile.id=<s:property value="profile.id"/>&groupId=<s:property value="groupId"/>" >
												Remove Admin
											</a>&nbsp;
											</s:if>
											<s:if test="existGroup.profile.profileOwner.id==user.id  || groupAdmin.role.id==5">
						              	<a title="Make Owner" href="${ctx}/myGroups/makeGroupOwner.action?profile.id=<s:property value="profile.id"/>&groupId=<s:property value="groupId"/>" >
												Make Owner
											</a>		
												</s:if>
												<s:if test="groupOwner.role.id==5">
												
																										
											</s:if>
											
											</s:else>	
													
											</td>
											
											<td align="right">
											<a title="Delete" href="${ctx}/myGroups/deleteGroupMembers.action?profile.id=<s:property value="profile.id"/>&groupId=<s:property value="groupId"/>" >
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
	      					
	      					<div class="bc_scroll_section">
	      					<div class="sec_title">Members</div>
	      					 <s:if test="groupMemberList.size==0">&nbsp;&nbsp;No Members Yet</s:if>
	      						<table width="100%" cellspacing="0" cellpadding="5">
									<tbody>
									<s:if test="groupMemberList.size!=0">
									<tr class="sec_heading">
											<td style="width: 300px;">Name</td>
											
											<td align="right" style="width: 100px">Action</td>
											<td width="50px" align="right">Delete</td>
										</tr>
									</s:if>
									
									<s:if test="groupMemberList.size!=0">
										 <s:iterator value="groupMemberList" status="rowstatus">
										 <s:if test="joinGroupMember==1">
										<tr class="<s:if test="#rowstatus.odd== true">odd</s:if><s:else>even</s:else>" >
											
												<td style="width: 300px;"><s:property value="profile.name"/> </td>
												
												<td align="right" style="width: 250px">
												 <s:if test="groupAdmin.role.id==4||groupAdmin.role.id==5">
												     <a title="Make Admin" href="${ctx}/myGroups/makeGroupAdmin.action?profile.id=<s:property value="profile.id"/>&groupId=<s:property value="groupId"/>" >
														Make Admin
													 </a>
												  </s:if>
												</td>
											
												<td align="right">
												 <s:if test="groupAdmin.role.id==4||groupAdmin.role.id==5">
													<a title="Delete" href="${ctx}/myGroups/deleteGroupMembers.action?profile.id=<s:property value="profile.id"/>&groupId=<s:property value="groupId"/>" >
														<img src="${ctx}/styles/default/images/mobc_prof_action_btn-redx.gif">
													</a>
													  </s:if>
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
	   			<div id="bc_discussions">
					<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
						<div class="bc_greytbar">
							<div id="bc_viewall-briefcase" class="bc_gtb_viewall">
							
								<a href="${ctx}/myGroups/listOfAllTopics.action?group.id=<s:property value="group.id"/>&profile.id=<s:property value="profile.id"/>">View All</a>
	      					</div>
	      					<h3 class="bc_gtb_title_discussions">Discussions (Displaying topics <span id="countId" class="pagelink"></span>)</h3>
	     				</div>
	     				 
	     				<div class="scroll_content">
	     					<div class="bc_scroll_section">
	     				
		      					<table width="100%" cellspacing="0" cellpadding="5">
									<tbody>
										
										<tr class="sec_heading">
											<td>Topic</td>
											<td>Author</td>
											<td>Replies</td>
										</tr>
										 <s:iterator value="groupTopicsList" status="row">
										 <s:set name="number" value="(#row.count-1)/10"/>
										<tr class="post number<s:property value="#number"/>">
											<td class="<s:if test="#row.odd== true">odd</s:if><s:else>even</s:else>">
											<a href="${ctx}/myGroups/postTopics.action?group.id=<s:property value="group.id"/>&topic.id=<s:property value="id"/>&profile.id=<s:property value="myProfileId"/>"><s:property value="topic"/>
											</a>
											</td>
											<td class="<s:if test="#row.odd== true">odd</s:if><s:else>even</s:else>"><s:property value="profile.name"/></td>
											<td class="<s:if test="#row.odd== true">odd</s:if><s:else>even</s:else>"><s:property value="discussionList.size()"/></td>
										</tr>
								  </s:iterator>
								  <tr>
								      <td></td>
								      <td></td>
								     
								      <td>
								      			<div id="paginator">	               
							                  	<span id="prev" style="cursor: pointer;" class="pagelink"> « Prev </span>
							                  	<span id="sep">|</span>  
							                  	<span id="next" style="cursor: pointer;" class="pagelink"> Next » </span>
							                  	<span id="count" class="pagelink"></span>
	        	                          </div>
								      </td>
								  </tr>
									</tbody>
								</table>
								 
	      					</div>
							<br class="clear-both">
						</div>
						
					</div></div></div></div></div>
				</div>
  <div id="bc_briefcase">
	    			<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
	     				<div class="bc_greytbar">
	      					<div id="bc_viewall-briefcase" class="bc_gtb_viewall">
		      	<authz:authorize  ifAnyGranted="ROLE_EMPLOYEE" >
					 <a href="${ctx}/employee/Briefcase.action?profile.id=<s:property value="profile.id"/>">View All</a>
				</authz:authorize>
						 <authz:authorize  ifAnyGranted="ROLE_EMPLOYER" >
					 <a href="${ctx}/employer/employerBriefcase.action?profile.id=<s:property value="profile.id"/>">View All</a>
				</authz:authorize>		
      
      </div>
      <h3 class="bc_gtb_title"><span id="bc_person_fname-brief"><s:property value="existProfile.name"/></span>'s Briefcase <span class="unbold">(<span id="bc_person_brief_info"><s:property value="itemcount"/> Items, 0 Videos, 0 Documents</span>)</span></h3>
     </div>

     <div id="bc_bc_contents">
     
      <s:set name="id" value="itemsList" scope="request"/>
    
        <display:table name="${id}" id="id" class="bc_bc_table" cellspacing="0"
                       pagesize="5" sort="list" defaultsort="1" requestURI=""
                       decorator="com.mob.util.BriefCaseItems">
                       
            <display:column title="Type" scope="col" property="image"></display:column>
            <display:column property="name" title="Title" class="bc_tbl_shad"></display:column>            
            <display:column property="createdDate" title="Added"></display:column>
            <display:column property="modifiedDate" title="Last Viewed" class="bc_tbl_shad"></display:column>           
            <display:setProperty name="paging.banner.placement" value="bottom"/>

            <display:setProperty name="paging.banner.some_items_found" value=""/>


            <display:setProperty name="paging.banner.first" value="<div class=bc_items_List_pagination>
																			Previous {0}
																			<a href={3}>Next</a>
																			</div>">
            </display:setProperty>


            <display:setProperty name="paging.banner.full" value="<div class=bc_items_List_pagination>
																			<a href={2}>Previous</a>
																			{0} <a href={3}>Next</a>
																			</div>">
            </display:setProperty>

            <display:setProperty name="paging.banner.last" value="<div class=bc_items_List_pagination>
																			
																			<a href={2}>Previous</a>
																			{0} Next
																			</div>">
            </display:setProperty>


        </display:table>
        <br class="clear-both">
    </div></div></div></div></div>
   </div>
					<br class="clear-both">
					
	  			</div>
	 		</div>
		</div>
		<script src="<c:url value='/styles/default/js/ibox.js'/>" type="text/javascript"></script>
		<script src="myContactAction1.action_files/contactInformation.js" type="text/javascript"></script>
	<script src="<c:url value='/styles/default/js/groups/validateGroups.js'/>" type="text/javascript">
</script>
	<br class="clear-both">