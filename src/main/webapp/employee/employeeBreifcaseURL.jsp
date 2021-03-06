<%@ include file="/common/taglib.jsp"%>
<%@ taglib uri="/MOB" prefix="mob"%>

<div id="bc_briefcase_briefcase">
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
	                        <div class="bcb_n_icon">
	                        
	                        <img src="${ctx}/styles/default/images/mobc_bcbn_icon-audio.png" alt="" /></div><div class="bcb_n_link">Music/Videos</div>
	                       </a>
                        </li>
                        
                         <li>
				             <a href="${ctx}/employee/employeeBreifcaseURL.action?profile.id=<s:property value="profile.id"/>">
				                <div class="bcb_n_icon"><img src="${ctx}/styles/default/images/mobc_bcbn_icon-URL-selected.png" alt=""/></div>
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
							<div class="bcb_n_icon">
							<img src="${ctx}/styles/default/images/mobc_bcbn_icon-chat.png" alt="" /></div><div class="bcb_n_link">Chat</div>
							</a>
						</li>
						
						
					</ul>
				</div>
				<div id="bcb_controw">

					<div class="bcb_controw-left">
						<div class="bc_lgrnbox"><div class="bc_lgb-content">
							<div class="bc_lgb_title"><h1>MyBriefcase</h1></div>
							<br />
							<!--<h3>You have <s:property value="itemcount"/> items.</h3>
							<br />
							-->
							 <h3>You have <span id="viewCountId"><s:property value="briefCase.briefcaseViewCount"/></span>&nbsp;views.</h3>

							<br />
							<p>Organize your briefcase items here.</p>
							<br />
							<p>Add, remove, and edit your items.</p>
							<br />
							<p><a href="">Help!</a></p>
							<br />

							<form onsubmit="return false">
							<input type="image" value="Add a New Item" src="${ctx}/styles/default/images/red_add_new_btn-up.png" onclick="bc_pop_up(event,'add_item',['center',300,'absolute']);hideEditableFields()" />
						</form>
						</div></div>
					</div>
					
					<div id="testid"><div class="test"></div></div>
					<s:hidden name="profile.id" id="briefcaseProfileId"/>
					<s:hidden name="hiddenIdForEdit" id="hiddenIdForEdit_id"/>					
					<s:set name="id" value="uRLListFromBriefcase" scope="request"/>
					<div class="bcb_controw-right">                                    
	                 <display:table  name="${id}"     id="id"  class="bc_bc_table2" cellspacing="0"
	                                 pagesize="5"     sort="list" defaultsort="1" requestURI="" 
	                                 decorator="com.mob.util.EmployeeBriefcaseURL">
	                <display:column title="Type" scope="col" property="image"></display:column>
	               
	               <display:column property="name" title="Title" class="bc_tbl_shad"></display:column>  
	               <display:column property="privacySetting" title="Privacy" class="bc_tbl_shad"></display:column>	
	               <display:column property="createdDate"  title="Added"></display:column>                           	            
	               <display:column property="modifiedDate" title="Last Viewed" class="bc_tbl_shad"></display:column>
	               <display:column property="links" title=""></display:column>
	               
	                <display:setProperty name="basic.msg.empty_list" value="Add URLs to share with your contacts!"/>
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
				<div class="bc_items_pagination1">
					<!-- Leave this empty unless testing for styles. It will be filled via Javascript. -->
				</div>
				
			</div>
		</div>
	</div>
</div>


<div id="confirm_delete" class="popup1"><div class="popup1-content">
	<div class="pu_row">
		<div class="pu_col left"><img src="${ctx}/styles/default/images/big_blue_q.png" alt="Are you sure?" /></div>
		<div class="pu_col right">
				<h4>Remove &quot;<span id="briefcaseName"></span>&quot; from your Briefcase?</h4>

				<a href="#" onclick="return hide_pop_up('confirm_delete')">
				<img src="${ctx}/styles/default/images/grn_no_btn-up.png" alt="No" /></a>
				<a class="second_a" href="#" id="delete" onclick="deleteBriefcaseURL()">
				<img src="${ctx}/styles/default/images/grn_yes_btn-up.png" alt="Yes" /></a>
		</div>
		<span class="clear-both"><!-- for IE6 --></span>
	</div>
</div></div>





<div id="add_item" class="popup1"><div class="popup1-content">
	<div class="pu_row">
	 <span style="display:none;margin-top: 30px;color: red" id="nameId">                    
         </span>
         <span style="display:none;margin-top:30px;color: red" id="nameId1">                    
             <h5>should have less than 45 characters</h5>
         </span>
         <span style="display:none;margin-top:30px;color: red" id="privacyId">                    
             <h5>Please select privacy setting.</h5>
         </span>
         <span style="display:none;margin-top:30px;color: red" id="fileId">                    
             <h5>Please upload a file.</h5>
         </span>
         <span style="display:none;margin-top:30px;color: red" id="validDocumentId">                    
             <h5>Sorry,This is not a valid document type</h5>
         </span>
         <span style="display:none;margin-top:30px;color: red" id="categoryTypeId">                    
             <h5>Please select category</h5>
         </span>
          <span style="display:none;margin-top:30px;color: red" id="urlId">                    
             <h5>Please provide video url</h5>
         </span>
		<form action="${ctx}/employee/addEmployeeBreifcaseURL.action" method="post"  enctype="multipart/form-data">
		<s:hidden name="profile.id"/>
			<h4>Name</h4>
			<input type="text" name="name" id="name"  class="inp_txt"/>
			<h4>URL</h4>
			<input type="text" name="Url" id="nameURL"  class="inp_txt"/>
			<div class=""><h6>Ex: http://www.myOwnBriefcase.com</h6></div>
			<div class="pu_row">
			<div class="pu_col left">

			<h4>Privacy Setting</h4>
			<s:select name="privacySetting" headerKey="1" 
				list="contactTypesList" listKey="name" listValue="name" id="privacySettingId">
			</s:select></div>
			
			

</div>
			
			<div class="submit_btn"><input type="image" src="${ctx}/styles/default/images/grn_add_item_btn-up.png" onclick="return addBriefcaseURL()"/></div>
			<div class="ftos">By adding a URL you certify that you have the right to distribute this content and that it does not violate the Terms of Service.</div>
		</form>


		<a class="close_link" href="#" onclick="return hide_pop_up('add_item')">Close</a>
	</div>

	</div>
</div>
</div>

<div id="confirm_delete2" class="popup1" style="width:280px;">
    <div class="popup1-content">
        <div class="pu_row">
          
            <div class="pu_col right">   
            <span style="display:none" id="success">                    
             <h6>Updated data sucessfully.<a href="#" onclick="return hide_pop_up('confirm_delete2')">Close</a></h6>
             </span>
              <span style="display:none" id="validateTitleName">                    
             <span id="failureMsg"></span> <a href="#" onclick="return hide_pop_up('confirm_delete2')">Close</a>
             </span> 
             <span style="display:none" id="failure">
	          Sorry,Unable to update data. <a href="#"  onclick="return hide_pop_up('confirm_delete2')">Close</a>
	        </span>
            <span class="clear-both"><!-- for IE6 --></span>
        </div>
    </div>
</div>





<script type="text/javascript" src="<c:url value='/styles/default/js/employeeBriefcase.js'/>"></script>



