<%@ include file="/common/taglib.jsp"%>
<s:iterator value="category" status="row">
  <div class="row">
    <h4><s:property value="categoryHeading"/></h4>
    <ul>
    	<s:iterator value="items">
      	<li><span id="<s:property value='value'/>" 
      		title="<s:property value="categoryHeading"/>" class="catitems"><s:property value="display"/></span>
      		<s:if test="count>0">
      		<span class="countvals">&nbsp;(<s:property value="count"/>)</span>
      		</s:if>
      	</li>
      </s:iterator>
      <li class="none"><a id="btn<s:property value='categoryHeading'/>" href="#" class="btn">SEE ALL</a></li>
    </ul>
  </div>
</s:iterator>
