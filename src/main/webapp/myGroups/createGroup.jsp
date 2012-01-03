
<%@ include file="/common/taglib.jsp"%>
<%@ taglib uri="/MOB" prefix="mob"%>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<style>
.closetxt
{
  margin-bottom:50px;
}
</style>




<div id="bc_main_outer">
 <div id="bc_main_mid" style="padding: 0 0 300px 0">
   <div id="bc_profile_outernav">
   <div class="outer_page_nav">
   
   <ul>
		   <li class="active">
		  
		   <a href=""/>View Group Profile</a>
		   </li>
		   <li>
		   <a href="">View Group Members</a>
		   </li>
		   
		   <li class="active">
		  
		   <a href="${ctx}/myGroups/createUserGroupAction.action">Create Group</a>
		   
		   </li>
		   
		     <li class="active">
		  
		   <a href="${ctx}/myGroups/groupInbox.action">Group Inbox</a>
		   
		   </li>
		  
       </ul>
       </div>
       </div>
      
  <div class="bc_main_inner clear-both">
   <div id="bc_profile_sec_VP">
    <div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content_VP">
     <div id="bc_profile_pic_spot_VP">
      <div class="bc_pps_pic_VP">
       <div id="bc_profile_pic"> 
      
       <a rel="ibox" href='${ctx}/<s:property value="profile.picture"/>'>
       <img src="${ctx}/styles/default/images/mobc_default_profile_pic.jpg" alt="N/A" width="75" height="75" align="top" >
       </a>
       </div>
      </div>
     
     </div>
    				<div id="bc_profile_info_VP">
							<h3 id="bc_profile_name">San Diego Drummers Association</h3>
							<div class="bc_pi_details">
								<div class="bc_pi_d_line"><h3>Industry:</h3><h4>Music</h4></div>
								<div class="bc_pi_d_line"><h3>Location:</h3><h4><s:property value="user.city"/>, <s:property value="user.state"/></h4></div>
								<div class="bc_pi_d_line"><h3>Group Access:</h3><h4>Public</h4></div>
								<div class="bc_pi_d_line"><h3>Group Owner:</h3><h4><s:property value="user.firstName"/>  <s:property value="user.lastName"/></h4></div>
							</div>
						</div>
						<div class="bc_statement">
							<div id="bc_personal_statement">Description</div>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in nisi mi, blandit congue tortor. Sed lorem nulla, dignissim sit amet tristique id, congue sed urna.</p>
							<br>
							<p>Suspendisse eu neque eu lacus molestie rhoncus non sed magna. Suspendisse rhoncus, nunc sed mattis vehicula, nibh dui placerat lectus, et accumsan nunc orci sed lectus. Nullam purus purus, bibendum quis ullamcorper a, consequat et tellus. Aliquam mollis ultrices ligula sit amet dictum. Fusce dignissim placerat pretium. Integer commodo massa vel metus suscipit elementum.</p>
							
						</div>
					</div></div></div></div></div>
				</div>
				<div id="bc_members">
					<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
						<div class="bc_greytbar">
	      					<h3 class="bc_gtb_title">Group Members / Admins</h3>
	     				</div>
	     				<div class="scroll_content">
	     					<div class="bc_scroll_section">
	      						<div class="sec_title">Admins</div>
		      					<table width="100%" cellspacing="0" cellpadding="5">
									<tbody>
										<tr class="sec_heading">
											<td>Name</td>
											<td align="right">Action</td>
											<td width="20px" align="right">Delete</td>
										</tr>
										<tr class="odd">
											<td>Jason Joseph</td>
											<td align="right">Remove Admin</td>
											<td align="right"><img src="${ctx}/styles/default/images/mobc_prof_action_btn-redx.gif"></td>
										</tr>
										<tr class="even">
											<td>Louvette Fowler</td>
											<td align="right">Remove Admin</td>
											<td align="right"><img src="${ctx}/styles/default/images/mobc_prof_action_btn-redx.gif"></td>
										</tr>
										<tr class="odd">
											<td>Faye Xu</td>
											<td align="right">Remove Admin</td>
											<td align="right"><img src="${ctx}/styles/default/images/mobc_prof_action_btn-redx.gif"></td>
										</tr>
										<tr class="even">
											<td>Lebron James</td>
											<td align="right">Remove Admin</td>
											<td align="right"><img src="${ctx}/styles/default/images/mobc_prof_action_btn-redx.gif"></td>
										</tr>
									</tbody>
								</table>
	      					</div>
	      					<div class="grey_line"></div>
	      					<div class="bc_scroll_section">
	      						<div class="sec_title">Members</div>
	      						<table width="100%" cellspacing="0" cellpadding="5">
									<tbody>
										<tr class="sec_heading">
											<td>Name</td>
											<td align="right">Action</td>
											<td width="20px" align="right">Delete</td>
										</tr>
										<tr class="odd">
											<td>Brad Pitt</td>
											<td align="right">Make Admin</td>
											<td align="right"><img src="${ctx}/styles/default/images/mobc_prof_action_btn-redx.gif"></td>
										</tr>
										<tr class="even">
											<td>Danney Carey</td>
											<td align="right">Make Admin</td>
											<td align="right"><img src="${ctx}/styles/default/images/mobc_prof_action_btn-redx.gif"></td>
										</tr>
										<tr class="odd">
											<td>Lars Ulrich</td>
											<td align="right">Make Admin</td>
											<td align="right"><img src="${ctx}/styles/default/images/mobc_prof_action_btn-redx.gif"></td>
										</tr>
										<tr class="even">
											<td>George Clooney</td>
											<td align="right">Make Admin</td>
											<td align="right"><img src="${ctx}/styles/default/images/mobc_prof_action_btn-redx.gif"></td>
										</tr>
										<tr class="odd">
											<td>Brad Pitt</td>
											<td align="right">Make Admin</td>
											<td align="right"><img src="${ctx}/styles/default/images/mobc_prof_action_btn-redx.gif"></td>
										</tr>
										<tr class="even">
											<td>Danney Carey</td>
											<td align="right">Make Admin</td>
											<td align="right"><img src="${ctx}/styles/default/images/mobc_prof_action_btn-redx.gif"></td>
										</tr>
										<tr class="odd">
											<td>Lars Ulrich</td>
											<td align="right">Make Admin</td>
											<td align="right"><img src="${ctx}/styles/default/images/mobc_prof_action_btn-redx.gif"></td>
										</tr>
										<tr class="even">
											<td>George Clooney</td>
											<td align="right">Make Admin</td>
											<td align="right"><img src="${ctx}/styles/default/images/mobc_prof_action_btn-redx.gif"></td>
										</tr>
									</tbody>
								</table>
	      					</div>
							<br class="clear-both">
						</div>
					</div></div></div></div></div>
				</div>
				<br class="clear-both">
	   			<div id="bc_discussions">
					<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
						<div class="bc_greytbar">
							<div id="bc_viewall-briefcase" class="bc_gtb_viewall">
								<a href="http://www.myownbriefcase.com:8080/beta/myGroups/Briefcase.action?profile.id=4">View All</a>
	      					</div>
	      					<h3 class="bc_gtb_title">Discussions (Displaying topics 1-12 out of 25)</h3>
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
										<tr class="odd">
											<td>Lorem ipsum dolor sit amet, consectetur adipiscing elit</td>
											<td>Jason Joseph</td>
											<td>1</td>
										</tr>
										<tr class="even">
											<td>Maecenas in nisi mi, blandit congue</td>
											<td>Faye Xu</td>
											<td>4</td>
										</tr>
										<tr class="odd">
											<td>Sed lorem nulla, dignissim</td>
											<td>Louvette Fowler</td>
											<td>6</td>
										</tr>
										<tr class="even">
											<td>Sit amet tristique id, congue sed urna.</td>
											<td>Kobe Bryant</td>
											<td>2</td>
										</tr>
										<tr class="odd">
											<td>Lorem ipsum dolor sit amet, consectetur adipiscing elit</td>
											<td>Jason Joseph</td>
											<td>1</td>
										</tr>
										<tr class="even">
											<td>Suspendisse eu neque eu lacus molestie</td>
											<td>Lars Ulrich</td>
											<td>109</td>
										</tr>
										<tr class="odd">
											<td>Lorem ipsum dolor sit amet, consectetur adipiscing elit</td>
											<td>Jason Joseph</td>
											<td>1</td>
										</tr>
										<tr class="even">
											<td>Maecenas in nisi mi, blandit congue</td>
											<td>Faye Xu</td>
											<td>4</td>
										</tr>
										<tr class="odd">
											<td>Sed lorem nulla, dignissim</td>
											<td>Louvette Fowler</td>
											<td>6</td>
										</tr>
										<tr class="even">
											<td>Sit amet tristique id, congue sed urna.</td>
											<td>Kobe Bryant</td>
											<td>2</td>
										</tr>
										<tr class="odd">
											<td>Lorem ipsum dolor sit amet, consectetur adipiscing elit</td>
											<td>Jason Joseph</td>
											<td>1</td>
										</tr>
										<tr class="even">
											<td>Suspendisse eu neque eu lacus molestie</td>
											<td>Lars Ulrich</td>
											<td>109</td>
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
								<!--<a href="/beta/myGroups/Briefcase.action?profile.id=4">View All</a>-->
								<a href="http://www.myownbriefcase.com:8080/beta/myGroups/Briefcase.action?profile.id=4">View All</a>
	      					</div>
	      					<h3 class="bc_gtb_title"><span id="bc_person_fname-brief"><s:property value="profile.name"/><span>'s Briefcase 
	      					<span class="unbold">(<span id="bc_person_brief_info"><s:property value="itemcount"/> Items, 0 Videos, 0 Documents</span>)</span></h3>
	     				</div>
	     				<div id="bc_bc_contents">
							<table id="id" class="bc_bc_table" cellspacing="0">
								<thead>
									<tr>
									<th class="sorted order1">Type</th>
									<th>Title</th>
									<th>Added</th>
									<th>Last Viewed</th></tr>
								</thead>
								<tbody>
									<tr class="odd">
									<td scope="col"><div class="bc_tbl_profpic"><div class="bc_info_btn"></div><a rel="ibox" href="http://www.youtube.com/watch?v=94J_oSwggFI&amp;feature=channel"><img src="myContactAction1.action_files/mobc_briefcase_icon-video.png" alt="" onclick="updateCount()"></a></div></td>
									<td class="bc_tbl_shad"><div id="name11" style="display: block;">Dunk</div><div id="name111" style="display: none;"><input id="txtname11" name="nickName" value="Dunk" type="text"></div></td>
									<td>2009-11-09</td>
									<td class="bc_tbl_shad">2009-11-09</td></tr>
									<tr class="even">
									<td scope="col"><div class="bc_tbl_profpic"><div class="bc_info_btn"></div><a rel="ibox" href="https://s3.amazonaws.com/mob_audio/chubby-bunny-jason_4_1257819155878.jpg?AWSAccessKeyId=0W86ZDYG5F0JN9RN8JR2&amp;Expires=1257906945&amp;Signature=arplpUpP69Sol3aoZBbwSx86Row%3D"><img src="${ctx}/styles/default/images/mobc_placeholder_thumb.jpg" alt="" onclick="updateCount()"></a></div></td>
									<td class="bc_tbl_shad"><div id="name9" style="display: block;">Profile</div><div id="name19" style="display: none;"><input id="txtname9" name="nickName" value="Profile" type="text"></div></td>
									<td>2009-11-09</td>
									<td class="bc_tbl_shad">2009-11-09</td></tr>
									<tr class="odd">
									<td scope="col"><div class="bc_tbl_profpic"><div class="bc_info_btn"></div><a rel="ibox" href="https://s3.amazonaws.com/mob_audio/JasonResume-102107_4_1257819122460.pdf?AWSAccessKeyId=0W86ZDYG5F0JN9RN8JR2&amp;Expires=1257906945&amp;Signature=NpwmClkOtUKSf%2FD5OPTuMiarFvA%3D"><img src="${ctx}/styles/default/images/mobc_briefcase_icon-doc.png" alt="" onclick="updateCount()"></a></div></td>
									<td class="bc_tbl_shad"><div id="name8" style="display: block;">Resume-101009</div><div id="name18" style="display: none;"><input id="txtname8" name="nickName" value="Resume-101009" type="text"></div></td>
									<td>2009-11-09</td>
									<td class="bc_tbl_shad">2009-11-09</td></tr>
									<tr class="even">
									<td scope="col"><div class="bc_tbl_profpic"><div class="bc_info_btn"></div><a rel="ibox" href="https://s3.amazonaws.com/mob_audio/suitshot_4_1257819181604.jpg?AWSAccessKeyId=0W86ZDYG5F0JN9RN8JR2&amp;Expires=1257906945&amp;Signature=yzpkJnH%2Bumv9lbeh4mCveAZQvyU%3D"><img src="${ctx}/styles/default/images/mobc_placeholder_thumb.jpg" alt="" onclick="updateCount()"></a></div></td>
									<td class="bc_tbl_shad"><div id="name10" style="display: block;">Suit</div><div id="name110" style="display: none;"><input id="txtname10" name="nickName" value="Suit" type="text"></div></td>
									<td>2009-11-09</td>
									<td class="bc_tbl_shad">2009-11-09</td></tr>
								</tbody>
							</table>
	        				<span class="clear-both"></span>
	    				</div>
	    			</div></div></div></div></div>
					<br class="clear-both">
	  			</div>
	 		</div>
		</div>
		<script src="<c:url value='/styles/default/js/ibox.js'/>" type="text/javascript"></script>
		<script src="<c:url value='/styles/default/js/contactInformation.js'/>" type="text/javascript"></script>
	</div>
	
	<br class="clear-both">