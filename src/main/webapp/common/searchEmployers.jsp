<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="<c:url value='/styles/default/js/addUserAsContactFromSearch.js'/>" type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/sendMessageToContactsFromSearch.js'/>" type="text/javascript"></script>


<div id="bc_main_outer">
	<div id="bc_main_mid">

		<div class="bc_main_inner clear-both r_sel_prof">
			<div id="outerlgb"><div class="lgrey_box"><div class="lgrey_box-r"><div class="lgrey_box-b">
				<div class="red_bar"><div class="red_bar-l"><div class="red_bar-r">
					<h1>Employer Search</h1>
				</div></div></div>
				<div class="lgrey_simple select_profile"><div class="lgrey_simple-b"><div class="lgrey_simple-l"><div class="lgrey_simple-r"><div class="lgrey_simple-tl"><div class="lgrey_simple-tr"><div class="lgrey_simple-bl"><div class="lgrey_simple-content">
					<a href="${ctx}/search/advancedEmployerSearch.action">Advanced Search</a>
					<s:if test="employerSearchList1.size!=0">
					
					<h2 class="prof_sub_header">Current Search Results</h2>
					<div class="adv_results_container">
						<div class="sel_prof_headers">
							<div class="sel_prof_col spc_profilepic"><h3>Profile Picture</h3></div>

							<div class="sel_prof_col spc_username"><h3>ProfileName</h3></div>
							<div class="sel_prof_col spc_location"><h3>Location</h3></div>
						</div>
						
						<s:iterator value="employerSearchList1" status="rowstatus">
						<div class="<s:if test="#rowstatus.odd == true">sel_prof_row</s:if><s:else>sel_prof_row noshade</s:else>">
						
						<!--<s:url id="viewprofile" action="viewingEmployerProfileFromSearch">
							<s:param name="employerProfile.id" value="id"/>
					    </s:url>
						
							--><div class="sel_prof_col spc_profilepic">
						<s:if test="picture!=null"><!--
							 <img src="${ctx}/<s:property value="resizedMinPicture"/>"  alt="N/A"/>
							      -->
							      <img src='<s:property value="resizedMinPicture"/>' alt="N/A"/>
							 </s:if>
							 <s:else>
							<img src="${ctx}/styles/default/images/mobc_placeholder_thumb.jpg"  width="50" height="50" alt="N/A"/>
							</s:else></div>
							<div class="sel_prof_col spc_username"><s:property value="organizationName"/></div>
							<div class="sel_prof_col spc_location"><s:property value="location"/></div>

							<div class="sel_prof_col spc_actions">
							<!--<s:a href="%{viewprofile}"> View Profile</s:a>
							-->
							<a href="${ctx}/search/viewingEmployerProfileFromSearch.action?employerProfile.id=<s:property value="id"/>">View Profile</a>
							<s:if test="profiles.size!=0">
							<a href="#" onclick="return pop_up_add_contact(event,<s:property value="id"/>,'confirm_add',[30,30,'negoffset_mouse'])"><span>Add as Contact</span></a>
							<a href="#" onclick="return pop_up_send_message(event,<s:property value="id"/>,'<s:property value="name"/>','confirm_add1',[30,30,'negoffset_mouse'])"><span>Send Message</span></a>
							</s:if>
							</div>
						   </div>
						 </s:iterator>
						 
					</div>
					</s:if>
					
					<s:if test="employerSearchList1.size==0">No Results Found</s:if>
					
				</div> </div> </div> </div> </div></div></div></div>
			</div></div></div></div>
		</div>
	</div>

</div>
<div id="confirm_add" class="popup1" style="position: absolute">
    <div class="popup1-content">
        <div class="pu_row">
            <div class="pu_col"><img src="${ctx}/styles/default/images/mobc_default_profile_pic.jpg" alt="New Friend"/>
            </div>
            <div class="pu_col">
                <form>
                
                    <s:hidden id="employeeProfileId" name="contactOwner.id"/>
                    <div id="contact_details">
                    <h5> <span style="display:none" id="selectProfile">
                      <font color="red">Please select a profile!</font></span></h5>
                    <h5>Profiles :</h5>
                   <h5> <s:select
                            list="profiles"
                            listKey="id"
                            headerKey=""
                            headerValue="Please Select"
                            listValue="name" id="associatedProfileId" onchange="getPrivacyGroups();"/>
                        </h5><br/>  
                     <h5> <span style="display:none" id="selectPrivacyGrp">
                     <font color="red" >Please select privacy group!</font>
	                </span></h5>
                    <h5>Privacy Group: </h5>
                    <div id="contactTypeDiv">
                    <s:select
                            list="contactTypesList"
                            listKey="name"
                            headerKey="1"
                            headerValue="Please Select"
                            listValue="name" name="contactType" id="selContactId"/>
                     </div>
                     </div>
                     <br/>
               		   <h5><span id="selContact">
	                   		<a style="cursor: pointer;" id="contactid" onclick="createContact('confirm_add');">
							Add as Contact</a> | <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                   </span></h5>
	                    <h5><span style="display:none" id="progress">
	                    	<img src="${ctx}/styles/default/images/pleasewait.gif"/>
	                    </span></h5>
	                    <h5><span style="display:none" id="success">
	                    	Contact added successfully. <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span></h5>
	                    <h5><span style="display:none" id="failure">
	                    	Sorry, unable to add the contact. <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span> </h5>
	                   <h5><span style="display:none" id="contactExist">
	                    	You are already connected to this profile<a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span></h5>
	                             
                </form>
            </div>
            <span class="clear-both"><!--  for IE6 --> </span>
        </div>
    </div>
</div>

<div id="confirm_add1" class="popup1" style="position: absolute">
		<div class="popup1-content">
		<div class="pu_row">
		<div class="pu_col"><img
			src="${ctx}/styles/default/images/mobc_default_profile_pic.jpg"
			alt="New Friend" /></div>
	<div class="pu_col">
		<form><s:hidden id="contactProfileId" name="contactOwner.id" />
			<div id="contact_msg_details">
			 <h5> <span style="display:none" id="failureMsg">
                <font color="red"><span id="displyFailureMsg"></span></font>
              </span></h5>
			<h5>Send Message:</h5><br/>
			<h5>To:</h5>
			<input type="text" name="profileName" id="profileNameId"
				readonly="readonly"><br />
			<h5>From:</h5>
			<s:select list="profiles" listKey="id" headerKey=""
				headerValue="Please Select" listValue="name"
				id="associatedProfileMsgId"/><br />
			<h5>Subject:</h5>
			<input type="text" name="subject" id="subjectId"><br />
			<h5>Message:</h5>
			<textarea rows="5" cols="5" name="message" id="messageId" class="" style="width: 150px;"></textarea><br />
			</div>
			<br />
			<h5><span id="selMsgContact"> <a style="cursor: pointer;" id="contactid" onclick="return sendMessageToContacts();">
				Ok</a> | <a href="#" onclick="return hide_pop_up1('confirm_add1')">Cancel</a>
			</span> </h5>
			<h5><span style="display: none" id="msgProgress"> <img
				src="${ctx}/styles/default/images/pleasewait.gif" />
		    </span></h5>
		     <h5><span style="display: none" id="msgSuccess"> Your Message has been sent
			successfully. <a href="#" onclick="return hide_pop_up1('confirm_add1')">Close</a>
			</span></h5>
			 <h5><span style="display: none" id="msgFailure"> Sorry, unable to	send message!
			  <a href="#" onclick="return hide_pop_up1('confirm_add1')">Close</a>
			</span></h5>
	 </form>
	</div>
 <span class="clear-both"><!--  for IE6 --> </span></div>
</div>
		
</div>



