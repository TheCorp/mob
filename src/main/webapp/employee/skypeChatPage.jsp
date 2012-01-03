<%@ include file="/common/taglib.jsp"%>
<%@ taglib uri="/MOB" prefix="mob"%>
<div id="bc_main_outer">
                     
	<div id="bc_main_mid">
		<div id="your_briefcase">
			<div class="bc_box">
				<div class="bcb_header">
			    <h2>My Inbox:</h2>
			    <s:property value="inboxMessageCount"/>&nbsp;Messages,&nbsp;<s:property value="inboxMessageCount"/>&nbsp;Unread
			   <span style="float: right;"><mob:flag key="2" src="../styles/default/images/icon_help.png">
			    </mob:flag></span>
			</div>
				<div class="bcb_nav">
					<ul>

						<li>
							<a href="${ctx}/employee/Briefcase.action?profile.id=<s:property value="profile.id"/>">
							<div class="bcb_n_icon"><img src="${ctx}/styles/default/images/mobc_bcbn_icon-document.png" alt="" /></div><div class="bcb_n_link">Documents</div>
							</a>
						</li>
                        <li>
                        <a href="${ctx}/employee/employeeBreifcasePhotos.action?profile.id=<s:property value="profile.id"/>">
	                        <div class="bcb_n_icon"><img src="${ctx}/styles/default/images/mobc_bcbn_icon_photo_seleted..png" alt="" /></div><div class="bcb_n_link">Photos</div>
	                        </a>
                        </li>
                        <li>
                        <a href="${ctx}/employee/employeeBreifcaseAudio.action?profile.id=<s:property value="profile.id"/>">
	                        <div class="bcb_n_icon"><img src="${ctx}/styles/default/images/mobc_bcbn_icon-audio.png" alt="" /></div><div class="bcb_n_link">Music/Videos</div>
	                       </a>
                        </li>
                        
                        <li>
				             <a href="${ctx}/employee/employeeBreifcaseURL.action?profile.id=<s:property value="profile.id"/>">
				                <div class="bcb_n_icon"><img src="${ctx}/styles/default/images/mobc_bcbn_icon-URL.png" alt=""/></div>
				                <div class="bcb_n_link">Links</div>
				            </a>
			            </li>
                        
						<li>
							<a href="${ctx}/employee/briefcaseContacts.action?profile.id=<s:property value="profile.id"/>">
							<div class="bcb_n_icon"><img src="${ctx}/styles/default/images/mobc_bcbn_icon-contacts.png" alt="" /></div><div class="bcb_n_link">Contacts</div>
							</a>
						</li>
						<li>
							<a href="${ctx}/employee/employeeSkypeChat.action?profile.id=<s:property value="profile.id"/>">
							<div class="bcb_n_icon"><img src="${ctx}/styles/default/images/mobc_bcbn_icon-chat-selected.png" alt="" /></div><div class="bcb_n_link">Chat</div>
							</a>
						</li>
						
						
					</ul>
				</div>
				<div id="bcb_controw">
				  <div class="bcb_controw-left2">
						<div class="bc_lgrnbox"><div class="bc_lgb-content">
						  <div class="bc_lgb_title"><h1>Connect to a Friend</h1></div>
                        <div class = "bc_lgb_skype">
							<div class = "bc_lgb_profile">
							<!--<s:textfield name="profile.id"></s:textfield>
							  --><img src="${ctx}/styles/default/images/mobc_fb_placeholder.jpg" width="75" height="93" />
							</div>
                            <div class = "bc_lgb_profile2">
                                <div id="selfrnd"><h1>Select a friend</h1></div>
                                <div id="selectedfrnd" style="display:none">
                                  <h1>You have selected</h1>
                                  <h2><span id="selectedname"></span></h2>
                                </div>
                            </div>
                            <br clear="all" />

                            <a id="skypelink" href = "#"><img src="${ctx}/styles/default/images/skype-button.jpg" width="249" height="61" border="0" /></a><br><br>
                            <a  href = "http://www.skype.com/download/" target="_blank"><b>Don't have skype?</b></a>
                             
                            <br /> <br />
                            <h1>Find a Contact to Call</h1>
                            	<form id="bcb_f_searchform" action="" method="" onsubmit="return false">
							<div class="col_l"><input name="search" id="searchId" type="text" class="txt" value="type something..." onfocus="inputOnFocus(this)" /></div>
							<div class="col_r"><input type="image" onclick="searchContacts();" src="${ctx}/styles/default/images/mobc_grnsearchbtn2-up.png" /></div>
						</form>

							  </div>
						  <br />

				<br class="clear-both" />

						</div></div>
				  </div>
					<div class="bcb_controw-right2" id="bcb_controw-right2">
					<table  class='bc_bc_table' cellspacing='0'>
                       <tr>
                           <th width='11%' class='bc_tbl_pic' scope='col'>Pic</th>
                           <th width='60%' class='bc_tbl_name' scope='col'>Name</th>
                           <th width='29%' class='bc_tbl_name' scope='col'>Skype</th>
                      </tr>
                   </table>   
					
					
				
			  </div>
				<br class="clear-both" />
				<div class="bc_items_pagination" id="bcip_pagination1">
					<!-- Leave this empty unless testing for styles. It will be filled via Javascript. -->
				</div>
				<!-- 
				<div id="bcb_footer">
					<div class="bcb_f_options_cont"><a href=""><img src="${ctx}/styles/default/images/mobc_grnoptionsbtn2-up.png" alt="Options" /></a></div>

					<div class="bcb_f_form_cont">
						<form id="bcb_f_searchform" action="" method="" onsubmit="return false">
							<div class="col_l"><input name="search" type="text" class="txt" value="type something..." onfocus="inputOnFocus(this)" /></div>
							<div class="col_r"><input type="image" value="Submit" src="${ctx}/styles/default/images/mobc_grnsearchbtn2-up.png" /></div>
						</form>
					</div>
				</div>
				 -->
			</div>
		</div>

	</div>
</div>

<div id="confirm_delete" class="popup1"><div class="popup1-content">
	<div class="pu_row">
		<div class="pu_col left"><img src="${ctx}/styles/default/images/big_blue_q.png" alt="Are you sure?" /></div>
		<div class="pu_col right">
				<h4>Remove James Dean from your Contacts?</h4>
				<a href="#" onclick="return hide_pop_up('confirm_delete')">
				<img src="${ctx}/styles/default/images/grn_no_btn-up.png" alt="No" /></a>
				<a class="second_a" href="#">
				<img src="${ctx}/styles/default/images/grn_yes_btn-up.png" alt="Yes" /></a>

		</div>
		<span class="clear-both"><!-- for IE6 --></span>
	</div>
</div></div>



<script src="<c:url value='/styles/default/js/searchContactForskype.js'/>" type="text/javascript"></script>




