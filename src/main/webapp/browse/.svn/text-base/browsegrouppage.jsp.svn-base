<%@ include file="/common/taglib.jsp"%>
<div id="pagecount" style="display: none"><s:property
	value="result.totalResults" /></div>
<s:if test="result.result.empty">
	Sorry, we could not find any group matching the criteria.
</s:if>	
<s:iterator value="result.result" status="row">
	<li class="sky">
	<div class="col01"><a href="#"> 
	<span>
	<a href="${ctx}/myGroups/viewGroupsProfile.action?group.id=<s:property value="id"/>&profile.id=<s:property value="profile.id"/>">
		<s:property
		value="name" />
	</a>
	</span></div>
	<div class="col02"><small><s:property
		value="profile.profileOwner.city" /></small> <span class="clear"></span></div>
	<div class="col03"><img
		src="${ctx}/styles/default/images/Group_Join.png" alt="Join"
		title="Join"
		onclick="return pop_up_join_group(event,'<s:property value="id"/>','<s:property value="title"/>','confirm_add1',[30,30,'negoffset_mouse']);" />
	<span class="clear"></span></div>
	</li>
</s:iterator>
