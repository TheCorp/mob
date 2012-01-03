<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<div id="compose_message"><!-- change this for each page for active nav styles - this way the navbar code stays consistent without script, i.e. you can SSI #bc_navbar -->
<div id="bc_main_outer">

	<div id="bc_main_mid">
	<s:hidden name="user.id" value="%{user.id}"/>
		<div id="bc_profile_outernav"><div class="outer_page_nav centered"><ul><li>
		<a href="${ctx}/employer/employerInbox.action">Inbox <s:if test="unreadMsgListSize!=0">(<s:property value="unreadMsgListSize"/>)</s:if></a></li><li>
		<a href="${ctx}/employer/employerOutBox.action">Outbox</a></li><li class="align-right-active">
		<a href="${ctx}/employer/composeEmployerMsg.action">Compose a New Message</a></li></ul></div></div>
		<div class="bc_main_inner clear-both">
			<div id="bc_profile_sec" class="r_sel_prof">
				<div class="bc_light_box select_profile"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
					<h2 class="prof_sub_header">Compose a New Message</h2>
					<s:form id="composeMessageForm" method="post" action="">
					 <s:hidden name="user.id" value="%{user.id}"/>
						<div class="row">
							<div class="col">
								<h5>To:</h5>
								<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r">
								<input type="hidden" name="sentBox.emailFrom" value=<s:property value="user.email"/> />
								 <input type="text" name="emprEmailTo" id="emprToAddress" class="txt" value="<s:property value="sentBox.emailTo"/>" />
								</span></span></span>
							</div>
							<div class="add_cont">
								<input type="image" value="Add" src="${ctx}/styles/default/images/add_entry_btn-up.png" />
							</div>

						</div>
						<div class="row">
							<h5>Subject:</h5>
							<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r">
							<input type="text" name="emprEmailSubject" class="txt"  value="RE:<s:property value="sentBox.emailSubject"/>" />
							</span></span></span>
						</div>
						<div class="row message_cont">
							<h5>Message:</h5>
                             <textarea name="emprEmailContent" cols="80" rows="8" class="big_message">
                             <s:property value="sentBox.emailContent" /> 
                             </textarea>
							<div class="send_btn_cont">
							
						    <img  src="${ctx}/styles/default/images/red_send_btn-up.png"  onclick="return(validateEmployerMsgs())"/>
						    <s:url id="cancelEmprMsg" action="employerInbox"></s:url>
							<s:a href="%{cancelEmprMsg}">Cancel</s:a></div>
						</div>
					</s:form>
					<br /><br />
				</div></div></div></div></div>
			</div>

		</div>
	</div>

</div>
</div>

<!--#include file="mobc_footer.html"-->

<br />


<script src="<c:url value='/styles/default/js/validateEmplrEmailMsgs.js'/>" type="text/javascript">
</script>


