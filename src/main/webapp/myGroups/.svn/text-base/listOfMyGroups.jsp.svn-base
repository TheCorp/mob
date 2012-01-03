<%@ include file="/common/taglib.jsp"%>
<style>  
.cust tr.odd {background-color:"#FFFFFF";}   
.cust tr.even {background-color:#CCCCCC;}   
</style>  

<div id="bc_main_outer">
	<div id="bc_main_mid">

		<div class="bc_main_inner clear-both r_sel_prof ">
			<div id="outerlgb"><div class="lgrey_box"><div class="lgrey_box-r"><div class="lgrey_box-b">
				<div class="red_bar"><div class="red_bar-l"><div class="red_bar-r">
					<h1>MyOwnBriefcase - My Groups</h1>
				</div></div></div>
				<div class="lgrey_simple select_profile"><div class="lgrey_simple-b"><div class="lgrey_simple-l"><div class="lgrey_simple-r"><div class="lgrey_simple-tl"><div class="lgrey_simple-tr"><div class="lgrey_simple-bl"><div class="lgrey_simple-content">
					<h2>Your Groups</h2>
					
					
					<s:if test="listOfMyGroups.size==0 &&listOfMyJoinedGroups.size==0 "><h6><br/><br/>No results found</h6></s:if>
				
				  <form id="advanced_search" name="form1" method="post" action="" >
				  <s:if test="listOfMyGroups.size=0 && listOfMyJoinedGroups==0">No results found</s:if>
				  <s:if test="listOfMyGroups.size!=0 || listOfMyJoinedGroups.size!=0 ">
					<div class="sel_prof_headers">
						<div class="sel_prof_col spc_jname" style="width: 275px"><h3><b>Group Name</b></h3></div>
						<div class="sel_prof_col spc_ptitle"><h3><b>Group Type</b></h3></div>
						<div class="sel_prof_col spc_empbooked"><h3><b>Group Owner</b></h3></div>
						<div class="sel_prof_col spc_empall"><h3><b>Created Date</b></h3></div>

					</div>
					</s:if>
					
				<s:if test="listOfMyGroups.size!=0">
					<s:iterator value="listOfMyGroups" status="rowstatus">

					<div class="<s:if test="#rowstatus.odd == true">sel_prof_row</s:if><s:else>sel_prof_row noshade</s:else>">
						<div class="sel_prof_col spc_name"  style="width: 300px">
						<a href="${ctx}/myGroups/groupsProfile.action?group.id=<s:property value="id"/>&profile.id=<s:property value="profile.id"/>">
					          <s:property value="name" />
					      </a></div>
						<div class="sel_prof_col spc_views" style="width: 200px"><s:property value="title"/></div>
						<div class="sel_prof_col spc_items" style="width: 170px"><s:property value="profile.name" /></div>
						<div class="sel_prof_col spc_messages"  style="width: 150px"><s:date name="createdDate" format="MM-dd-yyyy" /></div>

						<div class="sel_prof_col spc_actions" style="margin-left: -4px">
						
						<a	href="${ctx}/myGroups/loadGroupDetails.action?group.id=<s:property value="id"/>">
					        <img src="${ctx}/styles/default/images/exp_entry-edit.gif" title="Edit" alt="Edit" />
					    </a> 
					    <a href="${ctx}/myGroups/deleteGroupDetails.action?group.id=<s:property value="id"/>">
					       <img src="${ctx}/styles/default/images/mobc_redx.gif" title="Remove"  alt="Remove" />
					    </a>
						</div>
					</div>
					
					</s:iterator>
					</s:if>
					
					
					<!--Added  for  list  of  joined  gRoups  -->
					
					<s:if test="listOfMyJoinedGroups.size!=0">
					<s:iterator value="listOfMyJoinedGroups" status="rowstatus">
					<div class="<s:if test="#rowstatus.odd == true">sel_prof_row</s:if><s:else>sel_prof_row noshade</s:else>">
						<div class="sel_prof_col spc_name"  style="width: 300px">
						<a href="${ctx}/myGroups/groupsProfile.action?group.id=<s:property value="group.id"/>&profile.id=<s:property value="profile.id"/>">
					          <s:property value="group.name" />
					      </a></div>
						<div class="sel_prof_col spc_views" style="width: 200px"><s:property value="group.title"/></div>
						<div class="sel_prof_col spc_items" style="width: 170px"><s:property value="group.profile.name" /></div>
						<div class="sel_prof_col spc_messages"  style="width: 150px"><s:date name="group.createdDate" format="MM-dd-yyyy"  /></div>

						<div class="sel_prof_col spc_actions" style="margin-left: -4px">
						
						<s:if test="groupOwner.role.id==4">
						<a	href="${ctx}/myGroups/loadGroupDetails.action?group.id=<s:property value="group.id"/>">
					        <img src="${ctx}/styles/default/images/exp_entry-edit.gif" title="Edit" alt="Edit" />
					    </a> 
					   </s:if>
					   	<s:if test="groupOwner.role.id==5">
					   	<a	href="${ctx}/myGroups/loadGroupDetails.action?group.id=<s:property value="group.id"/>">
					        <img src="${ctx}/styles/default/images/exp_entry-edit.gif" title="Edit" alt="Edit" />
					    </a> 
					    <a href="${ctx}/myGroups/deleteGroupDetails.action?group.id=<s:property value="group.id"/>">
					       <img src="${ctx}/styles/default/images/mobc_redx.gif" title="Remove" alt="Remove" />
					    </a>
					     </s:if>
						</div>
					</div>
					
					</s:iterator>
					</s:if>
					
					<div id="add_profile" align="right">
						<s:a href="${ctx}/myGroups/createUserGroupAction.action">
					 		<img alt="Add another Group" src="${ctx}/styles/default/images/Add another Group.png" />
						</s:a>
					</div>
					
					</form>
					<br class="clear-both" />
				</div></div></div></div></div></div></div></div>
			</div></div></div></div>
		</div>
	</div>
</div>



<br class="clear-both" /><!--#include file="mobc_footer.html"-->

<br />

<script src="<c:url value='/styles/default/js/jobSearchCriteria.js'/>" type="text/javascript"></script>
