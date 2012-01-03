<%@ include file="/common/taglib.jsp"%>
<ul>
<s:iterator value="category" status="row">
<li>
	<s:iterator value="items" status="row">
		<s:if test="(#row.index)%4==0">
			<div class="col01">
		</s:if>
		<s:else>
			<div class="col02">
		</s:else>
			<a id="all<s:property value='value'/>" 
				title="<s:property value="categoryHeading"/>" 
				class="allcatitems" 
				href="#"><s:property value="display"/>
			</a>
		</div>
		<s:if test="(#row.index+1)%4==0 || #row.last">
			</li>
			<s:if test="!#row.last">
				<li>
			</s:if>
		</s:if>
	</s:iterator>
</s:iterator>
</ul>