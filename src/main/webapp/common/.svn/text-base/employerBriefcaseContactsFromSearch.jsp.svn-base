<%@ include file="/common/taglib.jsp"%>

<div id="bc_main_outer">
	<div id="bc_main_mid">
	
<div id="your_briefcase">
<div id="bc_briefcase_contacts">
<s:hidden key="id" name="profile.id"></s:hidden>
<s:hidden key="id" name="user.id"></s:hidden>
			<div class="bc_box">
				<div class="bcb_header">
					<h2><s:property value="employer.organizationName"/>'s Briefcase</h2>&nbsp;(<s:property value="itemcount"/> Items: <s:property value="documentsCount"/> Documents, <s:property value="photossCount"/> Photos, <s:property value="audioVedioCount"/> Videos) <h2><s:property value="employer.organizationName"/>'s Inbox</h2>: <s:property value="inboxMessageCount"/> Messages,<s:property value="unreadEmpMsgListSize"/> Unread
				</div>
				<div class="bcb_nav">
					<ul>
						<li>
						<s:url id="viewEmployerBriefcase" action="viewEmployerBriefcaseFromSearch.action">
	      				<s:param name="employer.id" value="employer.id"/>
	    				</s:url>
						<s:a href="%{viewEmployerBriefcase}"><div class="bcb_n_icon"><img src="${ctx}/styles/default/images/mobc_bcbn_icon-document.png" alt="" /></div><div class="bcb_n_link">Documents</div></s:a>
						</li>
						
						<li>
                        <s:url id="viewEmployerphotos" action="viewEmployerBriefcasePhotosFromSearch.action">
	      				<s:param name="employer.id" value="employer.id"/>
	    				</s:url>
                        <s:a href="%{viewEmployerphotos}"><div class="bcb_n_icon"><img src="${ctx}/styles/default/images/mobc_bcbn_icon_photo_seleted..png" alt="" /></div><div class="bcb_n_link">Photos</div></s:a>
                        </li>
                        
                        <li>
                        <s:url id="viewEmployerAudio" action="viewEmployerBriefcaseAudioFromSearch.action">
	      				<s:param name="employer.id" value="employer.id"/>
	    				</s:url>
                        <s:a href="%{viewEmployerAudio}"><div class="bcb_n_icon"><img src="${ctx}/styles/default/images/mobc_bcbn_icon-audio.png" alt="" /></div><div class="bcb_n_link">Music/Videos</div></s:a>
                        </li>
                        
                         <li>
				          <s:url id="viewEmployerURls" action="viewEmployerBriefcaseURLFromSearch.action">
				          <s:param name="employer.id" value="employer.id"/>
					  	  </s:url>
				          <s:a href="%{viewEmployerURls}">
				            <div class="bcb_n_icon">
				             	<img src="${ctx}/styles/default/images/mobc_bcbn_icon-URL.png" alt=""/>
				             </div>
				             <div class="bcb_n_link">Links</div>
				          </s:a>
				         </li>
                        
                        <li>
                        <s:url id="employercontacts" action="viewEmployerContactsFromSearch.action">
						<s:param name="employer.id" value="employer.id"/>
						</s:url>
                        <s:a href="%{employercontacts}"><div class="bcb_n_icon"><img src="${ctx}/styles/default/images/mobc_bcbn_icon-contacts-selected.png" alt="" /></div><div class="bcb_n_link">Contacts</div></s:a>
                        </li>
						</ul>
				</div>
				<div id="bcb_controw">

					<div class="bcb_controw-left">
						<div class="bc_lgrnbox"><div class="bc_lgb-content">
							<div class="bc_lgb_title"><h1>My Contacts</h1></div>
							<br />
							<h3>You have <s:property value="contactsCount"/> contacts.</h3>
							<br />
							<h3>You have 0 pending requests.</h3>

							<br />
							<p>Organize <s:property value="employer.organizationName"/> contacts here.</p>
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
	                          
	               
                  <display:setProperty name="paging.banner.placement" value="bottom"/> 
	               
                   <display:setProperty name="paging.banner.some_items_found" value=""/> 
 
 
                  <display:setProperty name="paging.banner.first" value="<div class=bc_items_pagination>
																			Previous {0}
																			<a href={3}>Next</a>
																			</div>">
				  </display:setProperty>
				  <display:setProperty name="paging.banner.full" value="<div class=bc_items_pagination>
																			<a href={2}>Previous</a>
																			{0} <a href={3}>Next</a>
																			</div>">
				  </display:setProperty>
				  
				  <display:setProperty name="paging.banner.last" value="<div class=bc_items_pagination>
																			
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
				<div id="bcb_footer">
					<div class="bcb_f_options_cont"><a href=""><img src="${ctx}/styles/default/images/mobc_grnoptionsbtn2-up.png" alt="Options" /></a></div>
					<div class="bcb_f_form_cont">
						<form id="bcb_f_searchform" action="" onsubmit="return false">
							<div class="col_l"><input name="search" type="text" class="txt" value="type something..." onfocus="inputOnFocus(this)" /></div>
							<div class="col_r"><input type="image" value="Submit" src="${ctx}/styles/default/images/mobc_grnsearchbtn2-up.png" /></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>





