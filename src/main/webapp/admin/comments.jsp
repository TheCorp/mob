<%@ include file="/common/taglib.jsp"%>

<span id="commentsId" class="comments">{"commentslist":[<s:iterator value="flaggedInformationList" status="row">{<s:if test="user!=null">"id":"<s:property value="user.id"/>"</s:if><s:elseif test="profile!=null">"id":"<s:property value="profile.id"/>"</s:elseif><s:else>"id":"<s:property value="item.id"/>"</s:else>,"comments":[<s:iterator value="comments" status="rowstatus">{<s:if test="user!=null">"comment":"<s:property/>"</s:if><s:elseif test="profile!=null">"comment":"<s:property/>"</s:elseif><s:else>"comment":"<s:property/>"</s:else>}<s:if test="!#rowstatus.last">,</s:if></s:iterator>],"catogoryTypes":[<s:iterator value="flaggedCategoryType" status="rowstatus">{<s:if test="user!=null">"flagType":"<s:property/>"</s:if><s:elseif test="profile!=null">"flagType":"<s:property/>"</s:elseif><s:else>"flagType":"<s:property/>"</s:else>}<s:if test="!#rowstatus.last">,</s:if></s:iterator>]}<s:if test="!#row.last">,</s:if></s:iterator>]}</span>