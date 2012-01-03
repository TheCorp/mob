<%@ include file="/common/taglib.jsp"%>
<div id="pagecount" style="display:none"><s:property value="result.totalResults"/></div>
<s:if test="result.result.empty">
	Sorry, we could not find any employee matching the criteria.
</s:if>	
<s:iterator value="result.result" status="row">
	<li class="sky">
	<div class="col01"><a href="#"> <small> 
	<s:if
		test="minPictureFromAmazon!=null">
    <a href="${ctx}/search/viewEmployeeProfileFromSearchEmployee.action?employeeProfileId=<s:property value="id"/>">
		<img align="top" src="<s:property value="minPictureFromAmazon"/>"
			alt="N/A" />
	</a>
	</s:if> 
	<s:else>
    <a href="${ctx}/search/viewEmployeeProfileFromSearchEmployee.action?employeeProfileId=<s:property value="id"/>">
		<img src="<c:url value='/styles/default/images/browse/pic01.jpg'/>"
			alt="" />
	</a>
	</s:else> 
	</small> 
	<span>
    <a href="${ctx}/search/viewEmployeeProfileFromSearchEmployee.action?employeeProfileId=<s:property value="id"/>">
		<s:property value="name" />
	</a>
	</span></div>
	<div class="col02"><small><s:property
		value="profileOwner.city" /></small> <small> <s:iterator
		value="education" status="row">
		<s:property value="degree" />
		<s:if test="!row.last">,</s:if>
	</s:iterator> </small> <small> <s:iterator value="userSkills" status="row">
		<s:property value="skillName" />
		<s:if test="!row.last">,</s:if>
	</s:iterator> </small> <span class="clear"></span></div>
	
	<div class="col03"><a href="#" onclick="return pop_up_add_contact(event,<s:property value="id"/>,'confirm_add',[30,30,'negoffset_mouse'])" class="icon01">Add as Contact</a>
	<a href="#" onclick="return pop_up_send_message(event,<s:property value="id"/>,'<s:property value="name"/>','confirm_add1',[30,30,'negoffset_mouse'])" class="icon02">Send Message</a> <span class="clear"></span>
	</div>
	</li>
</s:iterator>