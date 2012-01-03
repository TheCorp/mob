<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<div id="compose_message"><!-- change this for each page for active nav styles - this way the navbar code stays consistent without script, i.e. you can SSI #bc_navbar -->
<div id="bc_main_outer">
 <s:hidden name="sentBox.id" value="%{sentBox.id}"/>
	<div id="bc_main_mid">
		<div id="bc_profile_outernav"><div class="outer_page_nav centered"><ul><li class="active">
		<a href="${ctx}/employer/employerInbox.action">Inbox <s:if test="unreadMsgListSize!=0">(<s:property value="unreadMsgListSize"/>)</s:if></a></li><li>
		<a href="${ctx}/employer/employerOutBox.action">Outbox</a></li><li class="align-right">
		<a href="${ctx}/employer/composeEmployerMsg.action">Compose a New Message</a></li></ul></div></div>
		<div class="bc_main_inner clear-both">
			<div id="bc_profile_sec" class="r_sel_prof">
				<div class="bc_light_box select_profile">
				<div class="bc_lb-tr">
				<div class="bc_lb-bl">
				<div class="bc_lb-br">
				<div class="bc_lb-content">
					<h2 class="prof_sub_header"><s:property value="sentBox.emailSubject"/></h2>
                    <h3 class ="messageRead">Sent To: <strong><s:property value="sentBox.profileName"/></strong><br />
                    <s:date name="sentBox.emailSendDate" format="MM/dd/yyyy h:mm a"/></h3>
					<hr align="center" size="1" noshade />
				  <div class="row2">			
                       <s:property value="sentBox.emailContent" /> 
                   <br clear="all" />
						</div>
						<div class="row"></div>
					<hr align="center" size="1" noshade />
                    <div style = "width:300px; float: left;">
                    <s:a href="${ctx}/employer/employerInbox.action">
                    <img src="${ctx}/styles/default/images/msg_inbox.gif" width="130" height="33" /></s:a>
                    <input type="hidden" name="sentBox.id" value="<s:property value="sentBox.id"/>" id="sentBoxEmprReplyId">
                    </div>
                    <div style = "float: left; text-align:right; width: 500px; font-size: 10px;">
                    <input type="hidden" name="sentBox.id" value="<s:property value="sentBox.id"/>" id="sentBoxRecdId">
                    <s:a href =" " id="deleteSentReadMsgs" onclick="deleteEmprSentReadMsgs()">Delete</s:a>
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



<script src="<c:url value='/styles/default/js/deleteEmprSentEmailMessages.js'/>" type="text/javascript">
</script>


