<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<div id="compose_message"><!-- change this for each page for active nav styles - this way the navbar code stays consistent without script, i.e. you can SSI #bc_navbar -->
<div id="bc_main_outer">

	<div id="bc_main_mid">
	<s:hidden name="user.id" value="%{user.id}"/>
		<div id="bc_profile_outernav"><div class="outer_page_nav centered"><ul><li>
		<a href="${ctx}/employee/myInbox.action">Inbox<s:if test="unreadEmpMsgListSize">(<s:property value="unreadEmpMsgListSize"/>)</s:if></a></li><li>
		<a href="${ctx}/employee/myOutbox.action">Outbox</a></li></ul></div></div>
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
								<input type="hidden" name="emailFrom" value=<s:property value="user.email"/> />
								<!--<input type="text" name="emailTo"  id="emailToId" value="<s:property value="sentBox.emailTo"/>" class="txt"/>
								--></span></span></span>
							</div>
							
							<div id="resultDivId" style="border:1px solid black;height:20px;width:150px;">
							 <label id="removeId<s:property value="sentBox.id"/>">
							  <s:property value="sentBox.emailTo"/><img src="../styles/default/images/exp_entry-remove.gif" onclick="return(removeContact('<s:property value="sentBox.id"/>'))" />
							  </label>
						     </div>
							<div class="add_cont">
								<a href="#" onclick="return pop_up(event,<s:property value="user.id"/>,'confirm_add',['center',300])"><span><img src="${ctx}/styles/default/images/add_entry_btn-up.png" /></span></a>
							</div>

						</div>
						<div class="row">
							<h5>Subject:</h5>
							<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r">
							<input type="text" name="emailSubject" id="emailSubId" value="RE:<s:property value="sentBox.emailSubject"/>"  class="txt"/>
							</span></span></span>
						</div>
						<div class="row message_cont" align="left">
							<h5>Message:</h5>
                            <textarea name="emailContent" cols="80" rows="8" id="emailMsgId" class="big_message">
                             <s:property value="sentBox.emailContent" /> 
                            </textarea>
							<div class="send_btn_cont">
							
						    <img  src="${ctx}/styles/default/images/red_send_btn-up.png" onclick="return(validateEmpMsgs())"/>
						    <s:url id="cancelMsg" action="myInbox"></s:url>
							<s:a href="%{cancelMsg}">Cancel</s:a></div>
						</div>
					</s:form>
					<br /><br />
				</div></div></div></div></div>
			</div>

		</div>
	</div>

</div>

<div id="confirm_add" class="popup1">
<div class="popup1-content">
 <div class="pu_row">
  <div class="pu_col">
   <form name="ckhForm">
    <s:if test="contactList.size()!=0">
    <h6>Contact List: </h6><br>
    
    <div class="bcb_controw-right" >
  	<h6>Showing <s:property value="contactListSize"/> of <s:property value="contactListSize"/> connections</h6>
    <input type="checkbox" name="checkAll"  id="chkAllId"  onclick="chkAllValues();"/> 
    <table class="bc_bc_table2" cellspacing="0" style="border-style:solid;" border="2" cellpadding="2">
    	 <s:iterator value="contactList">
    	 <tr>
    	 
		<td>
		<input type="checkbox" name="checkbox"  value="<s:property value="nickName"/>" id="chkProid<s:property value="id"/>"  onclick="chkValue('<s:property value="id"/>');"/>
		<s:property value="nickName"/>
		</td>
		</tr>
		</s:iterator>
	</table>
	 <div id="listSelId" style="border:2px solid black;height:200px;width:150px;position:relative;left:440px;top:8px;display:block;">
   </div>
    <div id="listSelId1" style="border:2px solid black;height:200px;width:150px;position:relative;left:440px;top:2px;display:none;">
    </div>
    </div>
    <s:url id="cancelAddRecipients" action="composeMsg"></s:url>
   <s:a href=" #" cssStyle="position:relative;left:120px;top:2px" id="" onclick="return(AddValuesToEmailTo());">Finished</s:a> | <s:a href="%{cancelAddRecipients}">Cancel</s:a>
     <br/>
    </s:if>
    <s:else>
    <h6>There is no contacts in your contact List |<a href="#" onclick="return hide_pop_up1('confirm_add')">Close</a></h6>
    </s:else>
   </form>
  </div>
  <span class="clear-both"><!-- for IE6 --></span> 
 </div>
 
 </div>
</div>


</div>

<!--#include file="mobc_footer.html"-->

<br />

<script src="<c:url value='/styles/default/js/validateEmployeeEmailMsgs.js'/>" type="text/javascript">
</script>
<script src="<c:url value='/styles/default/js/addEmpMsgingContacts.js'/>" type="text/javascript"></script>
