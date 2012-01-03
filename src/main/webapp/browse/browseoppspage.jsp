<%@ include file="/common/taglib.jsp"%>
<div id="pagecount" style="display: none"><s:property
	value="result.totalResults" /></div>
<s:if test="result.result.empty">
	Sorry, we could not find any opportunity matching the criteria.
</s:if>	
<s:iterator value="result.result" status="row">
	<li class="sky">
	<div class="col01">
	<span>
		<a href="${ctx}/search/viewOpportunityFromSearch.action?opportunityid=<s:property value="id"/>">
		<s:property value="title" />
		</a>
	</span></div>
	<div class="col02"><small><s:property value="description" /></small>
	<span class="clear"></span></div>
	<div class="col03"><a
		href="${ctx}/search/viewOpportunityFromSearch.action?opportunityid=<s:property value='id'/>">View</a>
	<span class="clear"></span></div>
	</li>
</s:iterator>
