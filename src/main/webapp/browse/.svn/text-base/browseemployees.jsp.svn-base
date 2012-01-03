<%@ include file="/common/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/styles/default/css/browse/browse.css" />
<script src="${ctx}/styles/default/js/addUserAsContactFromSearch.js" type="text/javascript"></script>
<script src="${ctx}/styles/default/js/sendMessageToContactsFromSearch.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/styles/default/js/jquery.livequery.min.js">
</script>
<script type="text/javascript" src="${ctx}/styles/default/js/browse/browse.js">
</script>

 <div id="bc_main_outer">
  <div id="bc_main_mid">
   <div id="body_container">
   <h2>Employee Search</h2>
    <div class="browsecontent">
      <div class="sub_links">
        <ul id="crumbcontainer">
          <li><a href="#"><span><small>All</small></span></a></li>
          <s:if test="keyword != null">
          <li>
          	<a href="#"><span><small><s:property value="keyword"/></small>
          	<img alt="" src="${ctx}/styles/default/images/browse/close.gif" title="Education Level"  id="keyclosecrumb">
          	</span></a>
         </li>
         </s:if>
        </ul>
      </div>
      <div id="left_content">
        <h3>FILTER BY CATEGORY</h3>
		<s:include value="categories.jsp"/>
      </div>

	  <div id="browse_right_content">
        <div class="head_sec">
          <s:include value="keyword.jsp"/>
          <div class="right_box">
			<s:include value="pagination.jsp"/>
          </div>
        </div>
        <div class="list_section">
          <ul>
            <li class="none">
              <div class="name">Name</div>
              <div class="details">Details</div>
            </li>
			<div id="page">
				<s:include value="browseemployeepage.jsp"/>
			</div>
          </ul>
        </div>
      </div>
    
	<div>
	<div class="popup" id="popup" style="display: none;">
	</div>
		  </div>
		  </div>
</div>
		<div id="searchtype" style="display: none">Employee</div>
</div>
</div>
</div>
<br class="clear-both"/>


<div id="confirm_add" class="popup1" style="position:absolute;">
    <div class="popup1-content">
        <div class="pu_row">
            <div class="pu_col">
				<img src="${ctx}/styles/default/images/mobc_default_profile_pic.jpg" alt="New Friend"/>
            </div>
            <div class="pu_col">
                <form>
                    <div id="contact_details">
		               <s:hidden id="employeeProfileId" value="profile.id" name="contactOwner.id"/>
     
							<h5> 
							<span style="display:none" id="selectProfile">
								  <font color="red">Please select a profile!</font>
			                </span>
							</h5>
		                    <h5>Profiles : </h5>
				           <h5> 
						   <s:select
								list="profiles"
								listKey="id"
								headerKey=""
								headerValue="Please Select"
								listValue="name" id="associatedProfileId" onchange="getPrivacyGroups();">
								</s:select>
							</h5>
                           <br/>
				           <h5> 
							<span style="display:none" id="selectPrivacyGrp">
									   <font color="red">Please select privacy group!</font>
							</span>
							</h5>
		                    <h5>Privacy Group: </h5>
				            <div id="contactTypeDiv">
								   <h5> <s:select
								list="contactTypesList"
								listKey="name"
								headerKey=""
								headerValue="Please Select"
								listValue="name" name="contactType" id="selContactId" >
								</s:select></h5>
	                     </div>
                    </div>
                    <br/>
					<div>
                     <h5>
						<span id="selContact">
                    		<a  style="cursor: pointer;" id="contactid" onclick="createContact('confirm_add');" title="Add as Contact">
							Add as Contact</a> | <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span></h5>
	                    <h5> 
						<span style="display:none" id="progress">
	                    	<img src="${ctx}/styles/default/images/pleasewait.gif"/>
	                    </span></h5>
	                    <h5>
						<span style="display:none" id="success">
	                    	Contact added successfully. <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span></h5>
	                    <h5><span style="display:none" id="failure">
	                    	Sorry, unable to add the contact. <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span></h5>
	                    
	                    <h5> 
						<span style="display:none" id="contactExist">
	                    	You are already connected to this profile<a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span></h5>
						</div>
						</form>
            </div>
            <span class="clear-both"><!--  for IE6 --> </span>
        </div>
    </div>
    </div>

 <div id="confirm_add1" class="popup1" style="position:absolute;">
    <div class="popup1-content">
        <div class="pu_row">
            <div class="pu_col"><img src="${ctx}/styles/default/images/mobc_default_profile_pic.jpg" alt="New Friend"/>
            </div>
            <div class="pu_col">
                <form>
                
                    <s:hidden id="contactProfileId" value="profile.id" name="contactOwner.id"/>
                     <div id="contact_msg_details">
                      <h5> <span style="display:none" id="failureMsg">
                       <font color="red"><span id="displyFailureMsg"></span></font>
	                    </span></h5>
                    <h5>Send Message: </h5><br/>
                    <h5>To:</h5>
                    <input type="text" name="profileName" id="profileNameId" readonly="readonly"><br/>
                     <h5>From:</h5>
                     <s:select
                            list="profiles"
                            listKey="id"
                            headerKey=""
                            headerValue="Please Select"
                            listValue="name" id="associatedProfileMsgId" /><br/>
                  
                 <h5>Subject:</h5>  <input type="text" name="subject" id="subjectId"><br/>
                  <h5>Message:</h5> <textarea rows="2" cols=""  name="message" id="messageId" class="" style="width: 150px;"></textarea><br/>
                     </div>
                     <br/>
                     	<h5><span id="selMsgContact">
                    		<a style="cursor: pointer;" id="contactid" onclick="return sendMessageToContacts();" title="Ok">
							Ok</a> | <a href="#"  onclick="return hide_pop_up1('confirm_add1')">Cancel</a>
	                    </span></h5>
	                    <h5><span style="display:none" id="msgProgress">
	                    	<img src="${ctx}/styles/default/images/pleasewait.gif"/>
	                    </span></h5>
	                   <h5> <span style="display:none" id="msgSuccess">
	                    	Your Message has been sent successfully. <a href="#"  onclick="return hide_pop_up1('confirm_add1')">Close</a>
	                    </span></h5>
	                   <h5> <span style="display:none" id="msgFailure">
	                    	Sorry, unable to send message! <a href="#"  onclick="return hide_pop_up1('confirm_add1')">Close</a>
	                    </span></h5>
                </form>
            </div>
            <span class="clear-both"><!--  for IE6 --> </span>
        </div>
    </div>  

</div>



