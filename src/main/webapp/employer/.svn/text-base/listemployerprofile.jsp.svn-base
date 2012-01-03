<%@ include file="/common/taglib.jsp"%>

<div id="bc_main_outer">
	<div id="bc_main_mid">
	 	<div id="bc_profile_outernav">
		<div class="outer_page_nav">
		<ul><li><a href="${ctx}/employer/listopportunities.action">Company Profile</a></li>
		<li class="active"><a href="${ctx}/employer/listopportunities.action">Edit Company Profile</a></li>		
		</ul></div></div>

		<div class="bc_main_inner clear-both">
			<div id="bc_emplr_profile_pic_spot">
				<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
					<div id="bc_profile_pic_spot-c">
						<div class="bc_pps_pic">
							<div id="bc_emplr_profile_pic_spot">
							<!-- Open the profile image  -->
							 <a rel="ibox" href='${ctx}/<s:property value="employer.picture"/>'>
								 <img align="top" src="${ctx}<s:property value="employer.resizedMidPicture"/>" alt="N/A" align="top" />
								 
								 
							</div>
						</div>
						<div class="bc_pps_caption">
       
      
						
						<span style="display:block;margin-top: 7%;margin-left: 35%;font-size: 12px;color:#7d7d7d" id="editImageId" class="edit_r">
 
						<a href="javascript:void(0);" id="editImageId" onclick="editImage('editImageId');">
						 			
						
						<img src="${ctx}/styles/default/images/exp_entry-edit.gif" alt="Edit"/>Edit</a>
						</span>
						
						 </div>
					</div>
					<div id="bc_profile_info">

						<h2 id="bc_profile_name-c"><s:property value="employer.organizationName"/></h2>
						
						
						<div class="bc_pi_details" id="orgInfoId1">
						<s:property value="employer.orgInfo" />
						</div>
                      
                       <div class="address_entry" id="orgInfoId2" style="display:none;">
						         <s:textfield  name="employer.orgInfo" id="orgInfoTextId" />
						    </div>
						
						<div id="orgInfoImgId1" style=" font-size: 12px;color: #7d7d7d;">
						<a href="javascript:void(0);" id="cultureEditId" onclick="editOrgInfo();">
						<img src="${ctx}/styles/default/images/exp_entry-edit.gif" alt="Edit"/>Edit</a>
						</div>
						 <div class="acc_dec_r" style="display:none;" id="orgInfoImgId2">
							 <a href="javascript:void(0);" onclick="return(updateOrgInfoEmplr('orgInfoImgId2'));">
							 <img src="${ctx}/styles/default/images/grncheck-onwhite.jpg" alt="Accept" />Accept</a>&nbsp;&nbsp;
							 <a href="javascript:void(0);" onclick="cancelOrgInfo('orgInfoImgId2');">
							 <img src="${ctx}/styles/default/images/exp_entry-remove.gif" alt="Cancel" />Cancel</a>
					     </div>
					</div>
					<div id="bc_profile_cmoreinfo">
						<h3>Culture</h3>
						
						  
						    <div id="cultureId1">
						         <s:property value="employer.culture" />
						    </div>
						    <div class="address_entry" id="cultureId2" style="display:none;">
						         <s:textfield  name="employer.culture" id="cultureTextId" />
						    </div>
						
						<div id="cultureImgId1" style=" font-size: 12px;color: #7d7d7d;">
						<a href="javascript:void(0);" id="cultureEditId" onclick="editCulture();">
						<img src="${ctx}/styles/default/images/exp_entry-edit.gif" alt="Edit"/>Edit</a>
						</div>
						 <div class="acc_dec_r" style="display:none;" id="cultureImgId2">
							 <a href="javascript:void(0);" onclick="return(updateCultureEmplr('cultureImgId2'));">
							 <img src="${ctx}/styles/default/images/grncheck-onwhite.jpg" alt="Accept" />Accept</a>&nbsp;&nbsp;
							 <a href="javascript:void(0);" onclick="cancelCulture('cultureImgId2');">
							 <img src="${ctx}/styles/default/images/exp_entry-remove.gif" alt="Cancel" />Cancel</a>
					     </div>
                        <h3>Other Information</h3>
                         <div id="additionalInfoId1"> 
						<p style="font-size: 15px"><s:property value="employer.additionalInfo" /></p>
						</div>
						<div class="address_entry" id="additionalInfoId2" style="display:none;">
						     <s:textfield  name="employer.additionalInfo" id="additionalInfoTextId" />
						</div>
						<div id="additionalInfoImgId1" style=" font-size: 12px;">
						<a href="javascript:void(0);" id="cultureEditId" onclick="editAdditionalInfo();">
						<img src="${ctx}/styles/default/images/exp_entry-edit.gif" alt="Edit"/>Edit</a>
						</div>
						 <div class="acc_dec_r" style="display:none;" id="additionalInfoImgId2">
							 <a href="javascript:void(0);" onclick="return(updateAdditionalInfoEmplr('additionalInfoImgId2'));">
							 <img src="${ctx}/styles/default/images/grncheck-onwhite.jpg" alt="Accept" />Accept</a>&nbsp;&nbsp;
							 <a href="javascript:void(0);" onclick="cancelAdditionalInfo('cultureImgId2');">
							 <img src="${ctx}/styles/default/images/exp_entry-remove.gif" alt="Cancel" />Cancel</a>
					     </div>
						
						</div>
					<br class="clear-both" />
				</div></div></div></div></div>
			</div>
			<div id="bc_editprof">
				<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">

					<div class="bc_greytbar_lg">
						<h3 class="bc_gtb_title">Edit Account</h3>
					</div>
					<form id="editEmpForm" name="editEmpForm"  method="post">
					 <s:hidden name="profile.id" value="%{profile.id}"/>
						<div class="frow">
							 <span style="display:none;margin-left: 150px;color: red" id="success1">
	                    	<h5>Not a Valid Email Address</h5>
	                       </span>	
	                      <span style="display:none;margin-left: 150px;color: red" id="success2">
	                    	<h5>Please Enter Email Address</h5>
	                      </span>	
	                      <span style="display:none;margin-left: 150px;color: red" id="emilLength">
	                    	<h5>Should have less than 45 characters</h5>
	                      </span>					
							<div class="f-lt">
							    
								<h5>Email</h5>
							</div>

							<div class="f-rt">
							<div id="address">
						     <div class="address_entry" id="emailId" style="display:block;">
							 <s:property value="employer.email" id="emprEmailId" />
						     </div>
							 <div class="address_entry" id="emailId1" style="display:none;">
							 <s:textfield  name="employer.email" id="emprEmailId" />
							 </div>	
							 <div class="edit_r" id="emprEditImgId">
							 <a href="javascript:void(0);" id="emprEmaileditId" onclick="editAccount('emprEmaileditId');"><img src="${ctx}/styles/default/images/exp_entry-edit.gif" alt="Edit"/>Edit</a>
							 </div>
							 <div class="acc_dec_r" style="display:none;" id="emilAcceptId">
							 <a href="javascript:void(0);" onclick="return(updateEmailAccountEmplr('emilAcceptId'));">
							 <img src="${ctx}/styles/default/images/grncheck-onwhite.jpg" alt="Accept" />Accept</a>&nbsp;&nbsp;
							 <a href="javascript:void(0);" onclick="cancelEmployerAccnt('emilAcceptId');">
							 <img src="${ctx}/styles/default/images/exp_entry-remove.gif" alt="Cancel" />Cancel</a>
							 </div>
								
							</div>
						</div>
						<br style="clear: both" />
						<br>
						<div class="frow">
						      <span style="display:none;margin-left: 150px;color: red" id="addressLength">
	                    	<h5>Should have less than 45 characters</h5>
	                      </span>	
							<div class="f-lt">
                               
								<h5>Address</h5>
							</div>
							<div class="f-rt">
								<div id="address">
									<div class="address_entry" id="data" style="display:block;">
									<s:property value="employer.address" id="addPropId" />&nbsp;<s:property value="employer.city"/>
									</div>
									<div class="address_entry" id="data1" style="display:none;">
									<s:textfield  name="employer.address" id="addressId" />&nbsp;<s:textfield name="employer.city" id="cityId"/>
									</div>	
									
									<div class="edit_r" id="editBtnId">
									<a href="javascript:void(0);" id="edit" onclick="editAccount('edit');"><img src="${ctx}/styles/default/images/exp_entry-edit.gif" alt="Edit"/>Edit</a>
									</div>
									<div class="acc_dec_r" style="display:none;" id="acceptId">
									<a href="javascript:void(0);" onclick="updateAccountEmployer('acceptId');"><img src="${ctx}/styles/default/images/grncheck-onwhite.jpg" alt="Accept" />Accept</a>&nbsp;&nbsp;
									<a href="javascript:void(0);" onclick="cancelEmployerAccnt('acceptId');"><img src="${ctx}/styles/default/images/exp_entry-remove.gif" alt="Cancel" />Cancel</a>
									</div>
									<br style="clear: both;"  />
									<div class="address_entry" id="data11" style="display:block;" >
									 <s:property value="employer.state"/> &nbsp;<s:property value="employer.zipcode"/>
									</div>
									<div class="address_entry" id="data12" style="display:none;">
									<s:textfield  name="employer.state" id="stateId" />&nbsp;<s:textfield name="employer.zipcode" id="zipCodeId"/>
									</div>
									<div class="acc_dec_r" style="display:none;" id="acceptId1"><a href="javascript:void(0);"  onclick="updateAccountEmployer('acceptId1');"><img src="${ctx}/styles/default/images/grncheck-onwhite.jpg" alt="Accept" />Accept</a>&nbsp;&nbsp;
									<a href="javascript:void(0);" onclick="cancelEmployerAccnt('acceptId1');"><img src="${ctx}/styles/default/images/exp_entry-remove.gif" alt="Cancel" />Cancel</a>
									</div>
									<div class="edit_r" id="editBtnId1">
									<a href="javascript:void(0);" id="edit1" onclick="editAccount('edit1');"><img src="${ctx}/styles/default/images/exp_entry-edit.gif" alt="Edit"/>Edit</a>
									</div>

								</div>
							</div>
						</div>	
								
						<h4 class="changepass">Change Current Password</h4>
						<div class="frow">
						<span id="newPassId" style="display: none;margin-left: 150px;color: red"><h5>Please Enter New Password</h5></span>
						<span id="verifyNewPassId" style="display: none;margin-left: 150px;color: red"><h5>Please Enter Verify New Password</h5></span>
						<span id="oldPassId" style="display: none;margin-left: 150px;color: red"><h5>Please Enter Old Password</h5></span>
						<span id="wrongPassId" style="display: none;margin-left: 150px;color: red"><h5>You Have Entered Wrong Verify Password</h5></span>
						<span id="wrongOldPassId" style="display: none;margin-left: 150px;color: red"><h5>Wrong Old Password</h5></span>
							<div class="f-lt">
								<h6>New</h6>
							</div>
							
							<div class="f-rt">
									<span class="input_gi">
										 <span class="input_gi-l">
											 <span class="input_gi-r">
											      <input type="password" class="txt" name="new" id="new_password"/>
											</span>
											
										</span>
									</span>
							</div>
							
						</div>
						<div class="frow">
						
							<div class="f-lt">
								<h6>Verify New</h6>
							</div>

							<div class="f-rt">
								<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r">
								<input type="password" class="txt" name="verify_new" id="verify_new_password"/>
								</span></span></span>
							</div>
						</div>
						<div class="frow">
						
							<div class="f-lt">
								<h6>Enter Old Password</h6>
							</div>
							<div class="f-rt">
								<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r">
								<input type="password" class="txt" name="old"  id="old_password"/>
								</span></span></span>
							</div>
						</div>
						
						<div class="frow">
							<div class="f-lt">&nbsp;</div>
							<div class="f-rt">
							<a href="javascript:void(0);"  onclick="return(chageEmplrPassword())"> <img src="${ctx}/styles/default/images/mobc_changepass_btn-up.png"/></a>
							</div>

						</div>
						</div>
						
				</form>
					<br style="clear:both" />
				</div></div></div></div></div>
			</div>
			<div id="bc_subprof">
			<div class="bc_light_box">
			<div class="bc_lb-tr">
			<div class="bc_lb-bl">
			<div class="bc_lb-br">
			<div class="bc_lb-content">
			
					<div class="bc_greytbar_lg">
						<h4 class="bc_gtb_title rt"><a href="${ctx}/employer/employerProfile.action">Create New Profile</a></h4><h3 class="bc_gtb_title">Profiles</h3>
					</div>
					
				<s:iterator value="profilelist">
				
				<div class="bc_sp_entry">
						<div class="delete_r">
						           <!--
						            <s:url id="delete" action="deleteProfile">
									<s:param name="profile.id" value="id"/>
									</s:url>
							       -->
							       <s:if test="status=='default'">
									 <a href="#" onclick="return popup_delete_defaultProfile(event,<s:property value='id'/>,'confirm_add',['center',300])"><img src="${ctx}/styles/default/images/mobc_redx.gif" alt="Remove" />Delete</a>
									 </s:if>
						   	         <s:else>
						   	         <a href="${ctx}/employer/deleteProfile.action?profile.id=<s:property value="id"/>">
						   	         <img src="${ctx}/styles/default/images/exp_entry-remove.gif" alt="Delete"/>Delete</a>
						   	         </s:else>
							
						</div>
						      <!--
                              <s:url id="makeDefault" action="makeEmployerProfileAsDefaultProfile">
								<s:param name="newDefaultProfile.id" value="id" />
							  </s:url>
							  
							  <s:url id="viewProfile" action="loademployerprofile">
								<s:param name="profile.id" value="id" />
							  </s:url>
						      -->
						<h5>
						<!--
						<s:a href="%{viewProfile}"><s:property value="name"/></s:a>
						-->
						<a href="${ctx}/employer/loademployerprofile.action?profile.id=<s:property value="id"/>"><s:property value="name"/></a>
						&nbsp;																		
							 <s:if test="status=='default'">(Default Profile)</s:if>
							 <s:else>
							 
							 <!--
							 <s:a href="%{makeDefault}">(Make Default)</s:a>
							 -->
					   <a href="${ctx}/employer/makeEmployerProfileAsDefaultProfile.action?newDefaultProfile.id=<s:property value="id"/>">(Make Default)</a>
							 </s:else>
						</h5>
						<div class="edit_r">
						<!--
						 <s:url id="editProfile" action="setUpForInsertOrUpdate">
							<s:param name="profile.id" value="id"/>
						 </s:url>
						-->
						<a href="${ctx}/employer/setUpForInsertOrUpdate.action?profile.id=<s:property value="id"/>">
								<img src="${ctx}/styles/default/images/exp_entry-edit.gif" alt="Edit" />Edit</a>
						</div>
						<p style="font-size: 15px;"><s:property value="biography"/></p>
			    </div>
			   </s:iterator>
					</div>
					
					<br style="clear:both" />
				
				</div></div></div></div></div>
				
			<br class="clear-both" />
			
		</div>
	</div>
</div>


    





<br class="clear-both" />

<div id="confirm_delete2" class="popup1">
    <div class="popup1-content">
        <div class="pu_row">
          
	            <div class="pu_col right">   
		            <span style="display:none" id="success">                    
		             <h6>Email Already Exist Please Try Again.<a href="#" onclick="return hide_pop_up('confirm_delete2')">Close</a></h6>
		             </span>
		             
		             <span style="display:none" id="updateSuccess">                    
		             <h6>Updated Data Sucessfully.<a href="#" onclick="return hide_pop_up('confirm_delete2')">Close</a></h6>
		             </span>
		             <span style="display:none" id="failure">
			           Sorry, Unable to Update Data. <a href="#"  onclick="return hide_pop_up('confirm_delete2')">Close</a>
			        </span>
			        <span style="display:none" id="reLoginId">
			         <h6>Password Has Been Changed.Please Re-Login<a href="#"  onclick="return hide_pop_up('confirm_delete2')">Close</a></h6>
			        </span>
		            <span class="clear-both"><!-- for IE6 --></span>
	             </div>
      </div>
</div>
</div>
<div id="confirm_delete3" class="popup1">
    <div class="popup1-content">
        <div class="pu_row">
          
	            <div class="pu_col right">   
		            <form  name="editFormId" method="post" enctype="multipart/form-data" action="editImageForEmployer.action">
					  <p style="margin-right:100px;font-size: 15px;">Upload a new photo</p>
					      <span style="color: red;" id="emprPicId"></span>				  							
                          <s:file name="upload" cssClass="txt xlg" id="uploadpic"/><br/><br/>                         
						   <a href="javascript:void(0);" onclick="return(editImageForEmployer());">
							 <img src="${ctx}/styles/default/images/grncheck-onwhite.jpg" alt="Accept" />Accept</a>							 
							 <a  href="javascript:void(0);" onclick="cancelEditImage();">
							 <img src="${ctx}/styles/default/images/exp_entry-remove.gif" alt="Cancel" />Cancel</a>
							
					
						 </form>
		            
		            <span class="clear-both"><!-- for IE6 --></span>
	             </div>
      </div>
</div>
</div>

<div id="confirm_add" class="popup1">
    <div class="popup1-content">
        <div class="pu_row">
            <div class="pu_col"><img src="${ctx}/styles/default/images/mobc_default_profile_pic.jpg" alt="New Friend"/>
            </div>
            <div class="pu_col">
                <form id="defaultProfileForm" action="deleteProfile.action" method="post">
                	<s:hidden name="profile.id" id="defaultProfileId"/>
                    <div id="contact_details">
                   <h6> Please select a profile as default profile <br/>
                    before deleting your default profile.</h6>
                    <h6>Profiles : </h6>
                    <s:select list="nonDefaultEmployerProfiles" 
                            listKey="id"
                            headerKey="1" headerValue="Please Select"
                            listValue="name" id="newDefaultProfileId"/><br/>
                       <br/>
               		   <span id="selContact">
	                   		<a id="contactid" onclick="setAsDefaultProfile('confirm_add');">
							Change as default profile</a> | <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span>
	                    </div>
	                    <span style="display:none" id="progress">
	                    	<img src="${ctx}/styles/default/images/pleasewait.gif"/>
	                    </span>
	                    <h6><span style="display:none" id="success">Default profile has changed.<br/><br/>
	                    	<a href="#"  onclick="deleteOldDefaultProfile()">Delete Profile</a>|
	                    	<a href="#"  onclick="getProfilesList()">Close</a>
	                    </span></h6>
	                    <h6><span style="display:none" id="changeprofile">Please select another profile as default profile.<br/>
	                    	<a id="changeprofileid" onclick="setAsDefaultProfile('confirm_add');">
							Change as default profile</a> | <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span></h6>
	                  <h6><span style="display:none" id="failure">
	                    	Sorry, unable to set this profile as default profile.<br/> <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span> </h6>               
                </form>
            </div>
            <span class="clear-both"><!--  for IE6 --> </span>
        </div>
    </div>
<script src="<c:url value='/styles/default/js/ibox.js'/>" type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/editEmployerAccount.js'/>" type="text/javascript"></script>

