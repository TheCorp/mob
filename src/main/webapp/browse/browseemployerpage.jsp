<%@ include file="/common/taglib.jsp"%>
<div id="pagecount" style="display: none"><s:property
	value="result.totalResults" /></div>
<s:if test="result.result.empty">
	Sorry, we could not find any employer matching the criteria.
</s:if>	
	
<s:iterator value="result.result" status="row">
	<li class="sky">
	<div class="col01"><a href="#"> <small> <s:if
		test="employer.minPictureFromAmazon!=null">
		<a
		href="${ctx}/search/viewingEmployerProfileFromSearch.action?employerProfile.id=<s:property value='id'/>">
		<img align="top"
			src="<s:property value="employer.minPictureFromAmazon"/>" alt="N/A" />
		</a>
	</s:if> <s:else>
		<a
		href="${ctx}/search/viewingEmployerProfileFromSearch.action?employerProfile.id=<s:property value='id'/>">		<img src="<c:url value='/styles/default/images/browse/pic01.jpg'/>"
			alt="" />
		</a>
	</s:else> </small> 
	<span>
		<a
		href="${ctx}/search/viewingEmployerProfileFromSearch.action?employerProfile.id=<s:property value='id'/>">
		<s:property value="employer.organizationName" />
		</a>
	</span></div>
	<div class="col02"><small><s:property
		value="employer.city" /></small> <small> <s:property
		value="employer.industry.name" /> </small> <span class="clear"></span></div>
	<div class="col03">
	<a
		href="${ctx}/search/viewingEmployerProfileFromSearch.action?employerProfile.id=<s:property value='id'/>">View
	Profile</a> <span class="clear"></span></div>
	</li>
</s:iterator>
