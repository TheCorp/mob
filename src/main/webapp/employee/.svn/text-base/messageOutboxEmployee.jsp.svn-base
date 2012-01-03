<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<div id="message_system">
<div id="bc_main_outer">

	<div id="bc_main_mid">
		<div id="bc_profile_outernav"><div class="outer_page_nav centered"><ul>
		<li>
		<a href="${ctx}/employee/myInbox.action">Inbox <s:if test="unreadEmpMsgListSize!=0">(<s:property value="unreadEmpMsgListSize"/>)</s:if></a></li>
		<li class="active">
		<a href="${ctx}/employee/myOutbox.action">Outbox </a></li><li class="align-right">
		<a href="${ctx}/employee/composeMsg.action">Compose a New Message</a></li></ul></div></div>
		<div class="bc_main_inner clear-both">
			<div id="bc_profile_sec" class="r_sel_prof">
				<div class="bc_light_box select_profile"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
					<h2 class="prof_sub_header"></h2>

					<s:form id="inboxForm" name="inboxForm" method="post" action="">
						<div class="inbox_container">
						<s:if test="listEmailMessages.size!=0">
							<div class="sel_prof_headers">
								<div class="sel_prof_col spc_select"><h3><b>Select</b></h3></div>
								<div class="sel_prof_col spc_sender"><h3><b>Sent To</b></h3></div>
								<div class="sel_prof_col spc_profile"><h3><b>From Profile</b></h3></div>
								<div class="sel_prof_col spc_title"><h3><b>Title</b></h3></div>
								<div class="sel_prof_col spc_sentdate"><h3><b>Sent Date</b></h3></div>

							</div>
							</s:if>
							 <s:iterator value="listEmailMessages" status="rowstatus">
							<div class=<s:if test="#rowstatus.odd== true">sel_prof_row noshade</s:if><s:else>sel_prof_row</s:else>">
							    
								<div class="sel_prof_col spc_select">
								<input type="checkbox" name="selected_messages" value="<s:property value="id"/>"/></div>
								<div class="sel_prof_col spc_sender"><s:property value="emailTo"/>&nbsp;&nbsp;&nbsp;</div>
								<div class="sel_prof_col spc_profile">
									&nbsp;&nbsp;&nbsp;<s:property value="profileName"/>
								</div>
								<div class="sel_prof_col spc_title">&nbsp;&nbsp;&nbsp;
									<a href="${ctx}/employee/outBoxmsgReadAction.action?sentBox.id=<s:property value="id"/>">
										<s:property value="emailSubject"/>
									</a>
								</div>
								<div class="sel_prof_col spc_sentdate">&nbsp;&nbsp;&nbsp;<s:date name="emailSendDate" format="MM/dd/yyyy"/></div>
							</div>
						</s:iterator>
							
						</div>
						<br class="clear-both" /><br />
						<s:if test="listEmailMessages.size!=0">
						<div class="do_what">
							<h5>Action:</h5>
							<select name="selAction" id="optionValId" onchange="return(selOptionVal())">
							    <option value="">Please Select...</option>
								<option value="delete">Delete Selected</option>
								</select>
						</div>
						</s:if>
						<s:else>
						<div class="do_what">
					       <h5>There are no Messages in your Outbox</h5>
					   </div>
					</s:else>
					</s:form>

				</div></div></div></div></div>
			</div>

		</div>
	</div>
</div>
</div>

<!--#include file="mobc_footer.html"-->

<br />

<script src="<c:url value='/styles/default/js/deleteEmployeeSentEmailMessages.js'/>" type="text/javascript">
</script>


