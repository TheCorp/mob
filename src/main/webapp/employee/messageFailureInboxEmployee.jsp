<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<div id="message_system">
<div id="bc_main_outer">
	<div id="bc_main_mid">
		<div id="bc_profile_outernav"><div class="outer_page_nav centered"><ul><li class="active">
		<a href="${ctx}/employee/myInbox.action">Inbox<s:if test="unreadEmpMsgListSize!=0">(<s:property value="unreadEmpMsgListSize"/>)</s:if></a></li><li>
		<a href="${ctx}/employee/myOutbox.action">Outbox</a></li><li class="align-right">
		<a href="${ctx}/employee/composeMsg.action">Compose a New Message</a></li></ul></div></div>
		<div class="bc_main_inner clear-both">
			<div id="bc_profile_sec" class="r_sel_prof">
                    <div class="exp_entry" id="mail_sentnotification_id" align="center"><p>
                    <font color="green"> message has been not sent.</font></p>
                    </div>
				<div class="bc_light_box select_profile"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
				 <s:if test="cntUnreadMsgList.size!=0">
					<h2 class="prof_sub_header">Inbox &nbsp; <s:property value="unreadEmpMsgListSize"/> <em class="faded">Unread Messages</em></h2>
                     </s:if>
                    
					<s:form id="inboxForm" name="inboxForm" method="post" action="">
						<div class="inbox_container">
						     <s:if test="listInboxEmailMessages.size!=0">
							<div class="sel_prof_headers">
								<div class="sel_prof_col spc_select"><h3>Select</h3></div>
								<div class="sel_prof_col spc_sender"><h3>Sender</h3></div>
								<div class="sel_prof_col spc_profile"><h3>Profile</h3></div>
								<div class="sel_prof_col spc_title"><h3>Title</h3></div>
								<div class="sel_prof_col spc_sentdate"><h3>Sent Date</h3></div>
                              
							</div>
							</s:if>
							  <s:iterator value="listInboxEmailMessages"  status="rowstatus" >
							  <div id="unreadDivId<s:property value="id"/>" class=<s:if test="#rowstatus.odd== true">sel_prof_row noshade</s:if><s:else>sel_prof_row</s:else>" style="display:none;" >
							    <s:url id="viewMsg" action="msgReadAction">
								<s:param name="inbox.id" value="id"/>
								</s:url>
								<div class="sel_prof_col spc_select">
								<input type="checkbox" name="selected_messages"  value="<s:property value="id"/>" /></div>
								<div class="sel_prof_col spc_sender">&nbsp;&nbsp;&nbsp;<s:a href="%{viewMsg}">
								<s:property value="sentboxOwner.displayName"/></s:a></div>
								<div class="sel_prof_col spc_profile">&nbsp;&nbsp;&nbsp;<s:property value="profileOwner.name"/></div>
								<div class="sel_prof_col spc_title">&nbsp;&nbsp;&nbsp;<s:property value="subject"/></div>
								<div class="sel_prof_col spc_sentdate">&nbsp;&nbsp;&nbsp;<s:date name="receivedDate" format="MM/dd/yyyy"/>
								</div>
							</div>
							
							 <div id="msgesDivId<s:property value="id"/>" class=<s:if test="#rowstatus.odd== true">sel_prof_row noshade</s:if><s:else>sel_prof_row</s:else>" style="display:block;">
								<div class="sel_prof_col spc_select">
								<input type="checkbox" name="selected_messages"  value="<s:property value="id"/>" id="chkProid"/></div>
								<s:if test="readUnreadMsgId==0">
								<div class="sel_prof_col spc_sender">&nbsp;&nbsp;&nbsp;<s:a href="%{viewMsg}"><s:property value="sentboxOwner.displayName"/></s:a></div>
								<div class="sel_prof_col spc_profile">&nbsp;&nbsp;&nbsp;<s:property value="profileOwner.name"/></div>
								<div class="sel_prof_col spc_title">&nbsp;&nbsp;&nbsp;<s:property value="subject"/></div>
								<div class="sel_prof_col spc_sentdate">&nbsp;&nbsp;&nbsp;<s:date name="receivedDate" format="MM/dd/yyyy"/>
								</div>
								</s:if>
						        <s:else>
								<div class="sel_prof_col spc_sender"><h3><s:a href="%{viewMsg}"><s:property value="sentboxOwner.displayName"/></s:a></h3></div>
								<div class="sel_prof_col spc_profile"><s:property value="profileOwner.name"/></div>
								<div class="sel_prof_col spc_title"><h3><s:property value="subject"/></h3></div>
								<div class="sel_prof_col spc_sentdate"><h3><s:date name="receivedDate" format="MM/dd/yyyy"/></h3>
							  </div>
							  </s:else>
							  </div>	
						  
							</s:iterator>
						</div>
						<br class="clear-both" /><br />
						  <s:if test="listInboxEmailMessages.size!=0">
						<div class="do_what" >

							<h5>Action:</h5>
							<select name="selAction" id="optionId" onchange="return(selctMsgOption());">
							    <option value="">Please Select...</option>
								<option value="delete">Delete Selected</option>
								<option value="unread">Mark as Unread</option>
							</select>
						</div>
						</s:if>
						<s:else>
                      <div class="do_what">
                      <h5>There is no Messages in your Inbox</h5>
                      <br class="clear-both" />
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

<script src="<c:url value='/styles/default/js/deleteEmployeeReceivedEmailMessages.js'/>" type="text/javascript">
</script>



