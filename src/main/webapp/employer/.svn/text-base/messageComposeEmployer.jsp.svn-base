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
				<s:if test="contactListSize==0"><h5>Your contacts list empty, please add contacts  by  search</h5>
					</s:if>
					<s:else>
					<h2 class="prof_sub_header">Compose a New Message</h2>
					<div id="msg_sent_notification" align="right"></div>
					<s:form id="composeMessageForm" method="post" action="sendEmprEmailAction.action">
					 <s:hidden name="user.id" value="%{user.id}"/>
					 
					 
					 	 <table  width="100%">
					 	 
					 	  <tr>
						 	<td class="row">
						 	
							 	<div class="row">
									<h5>From:<span style="display:none;margin-left:5px;color:red;font-size:12px;" id="fromAddressId"></span></h5>				
								</div>	
						 	</td>
						 </tr>
						  <tr>
						 	<td class="row" width="100%">
							 	<div class="row">
							 		<s:select list="profiles" listKey="id" cssStyle="width: 600px;height: 25px;border:1px solid #9C9A9C;margin-left:-870px;"
				                  headerKey="" headerValue="- - - Please select a profile - - -" listValue="name"
				                  name="profile.id" id="profileListId"  />
							 	</div>
						 	</td>
						 </tr>
					 	 
					 	<tr>
						 	<td class="row">
						 		<div class="col">
								<h5>To:
								<span style="display:none;margin-left:5px;color:red;font-size:12px;" id="messageId">
									Please Enter Contact Name</span></h5>
								<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r">
								<input type="hidden" name="sentBox.emailFrom" value=<s:property value="user.email"/> />
							   
								</span></span></span>
								</div>
						 	</td>
					 	</tr>
					 	<tr>
						 	<td class="row" width="100%">
							 	<div style="display: none" id="textId">
							    <input type="text" class="city3" id="contactIds" name="contacts"/>
							    </div>
						 	</td>
					 	</tr>
					 	
					 	
					 	 <tr>
						 	<td class="row">
							 	<div class="row">
									<h5>Subject:</h5>				
								</div>	
						 	</td>
						 </tr>
						 
						 <tr>
						 	<td class="row" width="100%">
							 	<div class="row">
							 	
							    <input type="text" name="emprEmailSubject"  id="emprEmailSubjectId" style="width: 69%;height: 25px;border: 1px solid #9C9A9C;"/>
							  
							 		
							 	</div>
						 	</td>
						 </tr>
						 
						 
						 <tr>
						 	<td class="row message_cont">
						 	<div class="row message_cont">
								<h5>Message:</h5>
							</div>
						 	</td>
						 </tr>
						 
						 <tr>
						 	<td class="row">
						 	<div class="row message_cont">
	                            <textarea name="emprEmailContent" cols="80" rows="8" class="big_message" id="emprEmailContentId"></textarea>
	                         </div>
						 	</td>
						 </tr>
						 
						 
					 </table><div class="row message_cont">
							<br/>
							<div class="send_btn_cont" align="center" style="margin-top: 10px;cursor: pointer;">
							<a>
						    <img  src="${ctx}/styles/default/images/red_send_btn-up.png" id="show_value2"  class="btncrud"  onclick="return(sendEmprMsgToContacts())"/>
						    </a>
						    <div style="margin-top: -30px;margin-left:190px">
						   
							<a href="${ctx}/employer/employerInbox.action">Cancel</a>
							</div>
							</div>
						</div>
					</s:form>
					</s:else>
					<br /><br />
					
				</div></div></div></div></div>
			</div>

		</div>
	</div>

</div>


</div>



<!--#include file="mobc_footer.html"-->

<br />






<script src="<c:url value='/styles/default/js/jquery.mail_compose.js'/>" type="text/javascript"></script>

<script src="<c:url value='/styles/default/js/sendEmployerMessageToContacts.js'/>" type="text/javascript"></script>

