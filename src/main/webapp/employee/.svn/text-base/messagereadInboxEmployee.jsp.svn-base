<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<div id="compose_message"><!-- change this for each page for active nav styles - this way the navbar code stays consistent without script, i.e. you can SSI #bc_navbar -->
<div id="bc_main_outer">
 <s:hidden name="inbox.id" value="%{inbox.id}"/>
 
	<div id="bc_main_mid">
		<div id="bc_profile_outernav"><div class="outer_page_nav centered"><ul><li>
		<a href="${ctx}/employee/myInbox.action">Inbox <s:if test="unreadEmpMsgListSize">(<s:property value="unreadEmpMsgListSize"/>)</s:if></a></li><li>
		<a href="${ctx}/employee/myOutbox.action">Outbox</a></li><li class="align-right active">
		<a href="${ctx}/employee/composeMsg.action">Compose a New Message</a></li></ul></div></div>
		<div class="bc_main_inner clear-both">
			<div id="bc_profile_sec" class="r_sel_prof">
				<div class="bc_light_box select_profile">
				<div class="bc_lb-tr">
				<div class="bc_lb-bl">
				<div class="bc_lb-br">
				<div class="bc_lb-content">
					<h2 class="prof_sub_header"><s:property value="inbox.subject"/></h2>
                    <h3 class ="messageRead">Sender: <strong><s:property value="inbox.associatedOwnerProfile.name"/></strong><br />
                    <s:date name="inbox.receivedDate" format="MM/dd/yyyy h:mm a"/></h3>
					<hr align="center" size="1" noshade />
				  <div class="row2">			
                       <s:property value="inbox.message" /> 
                   <br clear="all" />
						</div>
						<div class="row"></div>
					<hr align="center" size="1" noshade />
                    <div style = "width:300px; float: left;">
                    <s:a href="${ctx}/employee/myInbox.action">
                    <img src="${ctx}/styles/default/images/msg_inbox.gif" width="130" height="33" /></s:a>
                   
                    <input type="hidden" name="inbox.id" value="<s:property value="inbox.id"/>" id="inboxSendId">
                     <input type="hidden" name="inboxOwnerId" value="<s:property value="inbox.inboxOwner"/>" id="ownerId">
                   <s:a href=" " id="composeReadMsgs"> <img src="${ctx}/styles/default/images/msg_reply.gif" width="131" height="33" onclick="sendReadMsgReply();"/></s:a>
                    </div>
                    
                    <div style = "float: left; text-align:right; width: 500px; font-size: 10px;">
                    <input type="hidden" name="inbox.id" value="<s:property value="inbox.id"/>" id="inBoxId">
                    <s:a href =" " id="deleteReadMsgs"> <img src="${ctx}/styles/default/images/msg_delete.gif" width="131" height="33" onclick="deleteRecdReadMsgs();"/></s:a>
                    </div>
                    <br /><br />
				</div></div></div></div></div>
			</div>

		</div>
	</div>
</div>
</div>


<!--#include file="mobc_footer.html"-->

<br />



<script src="<c:url value='/styles/default/js/deleteEmployeeReceivedEmailMessages.js'/>" type="text/javascript">
</script>
<script src="<c:url value='/styles/default/js/sendEmpReplyMessageToContacts.js'/>" type="text/javascript"></script>



