	<%@ include file="/common/taglib.jsp"%>
	
	
	
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
	
	<h1>Group Search</h1>
	<h4 class="ta-left"></h4>
	
	</div>
	<div class="lgrey_simple select_profile">
	<div class="lgrey_simple-b">
	<div class="lgrey_simple-l">
	<div class="lgrey_simple-r">
	<div class="lgrey_simple-tl">
	<div class="lgrey_simple-tr">
	<div class="lgrey_simple-bl">
	<div class="lgrey_simple-content">
	
	<div class="adv_results_container">
	
	<s:if test="listOfMyOwnGroups.size!=0">
	<span  id="successMsgId" style="display:none;color: green;font-size:12px;text-align:center">you  have  successfully joined group</span>
	<h2 class="prof_sub_header">Current Group Results</h2>
					
						<div class="sel_prof_headers">
							<div class="sel_prof_col spc_groupname"><h3>Group Name</h3></div>
							<div class="sel_prof_col spc_groupname"><h3>Group Type</h3></div>
							<div class="sel_prof_col spc_groupname"><h3>Group Owner</h3></div>
							<div class="sel_prof_col spc_groupname"><h3>Created Date</h3></div>
						</div>
	</div>
	
	<s:iterator value="listOfMyOwnGroups">
	<form  id="joinGroupForm" action="" >
		<div class="sel_prof_row">
		
			<div class="sel_prof_col spc_name">
				&nbsp;&nbsp;&nbsp;&nbsp;
				
				<a href="${ctx}/employee/groupsProfile.action?group.id=<s:property value="id"/>">
				<s:property value="name" /></a>
			</div>
			
			<div class="sel_prof_col spc_views">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<s:property value="title" />
			</div>
			
				<div class="sel_prof_col spc_views">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<s:property value="groupUser.firstName"/>
			</div>
			
			
			<div class="sel_prof_col spc_items">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
				<s:date name="createdDate" format="dd MM yyyy"/>
			</div>
			<div class="sel_prof_col spc_name"></div>
			<div class="sel_prof_col spc_name"></div>
			<div class="sel_prof_col group_joinaction">
				 <!--<img src="${ctx}/styles/default/images/Group_Join.png" alt="Join" title="Join" onclick="joinGroup('<s:property value="id" />');"/>
				 
				 -->
				<img src="/MyOwnBriefcase/styles/default/images/mobc_redx.gif" alt="Join" title="Join" onclick="return pop_up_join_group(event,<s:property value="id"/>,'<s:property value="name"/>','confirm_add1',['center',350]);"/>
				 
			</div>
		</div>
		</form>	
</s:iterator>
</s:if>
	<div id="add_profile"><s:a
		href="${ctx}/employee/createUserGroupAction.action">
	    <img alt="Add another Group" src="/MyOwnBriefcase/styles/default/images/Add another Group.png"/>
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

	

	<span class="clear-both"><!--  for IE6 --> </span>
	
	
	<script
		src="<c:url value='/styles/default/js/groups/joinGroups.js'/>"
		type="text/javascript"></script>
	
	
	
	
	
