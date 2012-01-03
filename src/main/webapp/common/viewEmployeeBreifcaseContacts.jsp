<%@ include file="/common/taglib.jsp"%>

<div id="bc_main_outer">
	<div id="bc_main_mid">
	
<div id="your_briefcase">
<div id="bc_briefcase_contacts">
<s:hidden key="id" name="profile.id"></s:hidden>
<s:hidden key="id" name="user.id"></s:hidden>
			<div class="bc_box">
				<div class="bcb_header">
					 <h2><s:property value="employeeProfile.name"/>'s Inbox</h2>: <s:property value="inboxMessageCount"/> Messages, <s:property value="unreadEmpMsgListSize"/> Unread
				</div>
				<div class="bcb_nav">
	<ul>
         <li>
           <a href="${ctx}/search/viewBriefcaseFromSearch.action?employeeProfileId=<s:property value="employeeProfileId"/>">
            <div class="bcb_n_icon">
            	<img src="${ctx}/styles/default/images/mobc_bcbn_icon-document.png" alt="" />
            </div>
            <div class="bcb_n_link">Documents</div>
          </a>
        </li>
        <li>
	   		 <a href="${ctx}/search/viewBriefcasePhotosFromSearch.action?employeeProfileId=<s:property value="employeeProfileId"/>">     
	          <div class="bcb_n_icon">
	          	<img src="${ctx}/styles/default/images/mobc_bcbn_icon_photo_seleted..png" alt="" />
	          </div>
	          <div class="bcb_n_link">Photos</div>
	         </a>
        </li>
        <li>
	        <a href="${ctx}/search/viewBriefcaseAudioFromSearch.action?employeeProfileId=<s:property value="employeeProfileId"/>">
	           <div class="bcb_n_icon">
	           	<img src="${ctx}/styles/default/images/mobc_bcbn_icon-audio.png" alt="" />
	           </div>
	           <div class="bcb_n_link">Music/Videos</div>
	        </a>
        </li>
        
         <li>
            <a href="${ctx}/search/viewBriefcaseURLFromSearch.action?employeeProfileId=<s:property value="employeeProfileId"/>">
               <div class="bcb_n_icon">
              	<img src="${ctx}/styles/default/images/mobc_bcbn_icon-URL.png" alt=""/>
               </div>
               <div class="bcb_n_link">Links</div>
            </a>
         </li>
        
        <li>
	        <a href="${ctx}/search/viewBriefcaseContacts.action?employeeProfileId=<s:property value="employeeProfileId"/>">
	           <div class="bcb_n_icon">
	           	<img src="${ctx}/styles/default/images/mobc_bcbn_icon-contacts-selected.png" alt="" />
	           </div>
	           <div class="bcb_n_link">Contacts</div>
	       </a>
        </li>		
						
	
					
					</ul>
				</div>
				<div id="bcb_controw">

					<div class="bcb_controw-left">
						<div class="bc_lgrnbox"><div class="bc_lgb-content">
							<div class="bc_lgb_title"><h1>My Contacts</h1></div>
							<br />
							<h3>You have <s:property value="employeeProfile.noOfContacts"/> contacts.</h3>
							<br />
							<!-- 
							<h3>You have 0 pending requests.</h3>
                             -->
							<br />
							<p>Organize <s:property value="employee.firstName"/> contacts here.</p>
							<br />
							
						</div></div>

					</div>
					<div class="bcb_controw-right">
					
						<s:hidden name="hiddenIdForEdit" id="hiddenIdForEdit_id"/>
						
						
							   <s:set name="id" value="contacts" scope="request"/>                                      
	                            <display:table      name="${id}"     id="id"         class="bc_bc_table2" cellspacing="0"
	                                            pagesize="5"       sort="list" defaultsort="1" requestURI=""
	                                           decorator="com.mob.util.EmployeeContacts">
	                            <display:column property="picture"  title="Picture" class="bc_tbl_pic" headerClass="bc_tbl_pic"></display:column>
	                           	<display:column property="nickName"  title="Name" class="bc_tbl_shad" headerClass="bc_tbl_name"></display:column>  
	                           	<display:column property="contactType" title="Privacy Group" class="bc_tbl_shad" headerClass="bc_tbl_privacygroup"></display:column>
	                           	<display:column property="createdDate" title="Added" headerClass="bc_tbl_added"></display:column>	
	                           	<display:column property="modifiedDate" class="bc_tbl_shad" title="Last Action" headerClass="bc_tbl_lastaction"></display:column>                           	            
	                          
	               <display:setProperty name="basic.msg.empty_list" value="No Contacts to display!"/>           
	               
                  <display:setProperty name="paging.banner.placement" value="bottom"/> 
	               
                   <display:setProperty name="paging.banner.some_items_found" value=""/> 
 
 
                  <display:setProperty name="paging.banner.first" value="<div class=bc_items_pagination1>
																			Previous {0}
																			<a href={3}>Next</a>
																			</div>">
				  </display:setProperty>
				  <display:setProperty name="paging.banner.full" value="<div class=bc_items_pagination1>
																			<a href={2}>Previous</a>
																			{0} <a href={3}>Next</a>
																			</div>">
				  </display:setProperty>
				  
				  <display:setProperty name="paging.banner.last" value="<div class=bc_items_pagination1>
																			
																			<a href={2}>Previous</a>
																			{0} Next
																			</div>">
				  </display:setProperty>
				  
				 </display:table>
								
						
					</div>

			
				<br class="clear-both" />
				<div class="bc_items_pagination" id="bcip_pagination1">
					<!-- Leave this empty unless testing for styles. It will be filled via Javascript. -->
				</div>
				<!-- 
				<div id="bcb_footer">
					<div class="bcb_f_options_cont"><a href=""><img src="${ctx}/styles/default/images/mobc_grnoptionsbtn2-up.png" alt="Options" /></a></div>
					<div class="bcb_f_form_cont">
						<form id="bcb_f_searchform" action="" onsubmit="return false">
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
				<h4>Remove &quot;<span id="contactName"></span>&quot; from your Briefcase?</h4>

				<a href="#" onclick="return hide_pop_up('confirm_delete')"><img src="${ctx}/styles/default/images/grn_no_btn-up.png" alt="No" /></a><a class="second_a" href="#" id="delete" onclick="deleteConactDetails()">Yes</a>
		</div>
		<span class="clear-both"><!-- for IE6 --></span>
	</div>
</div></div>






<script src="<c:url value='/styles/default/js/employeeContacts.js'/>" type="text/javascript">
</script>







