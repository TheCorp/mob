<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />


<script src="<c:url value='/styles/default/js/addUserAsContactFromSearch.js'/>" type="text/javascript"></script>


<div id="bc_main_outer">
	<div id="bc_main_mid">

		<div class="bc_main_inner clear-both r_sel_prof">
			<div id="outerlgb"><div class="lgrey_box"><div class="lgrey_box-r"><div class="lgrey_box-b">
				<div class="red_bar"><div class="red_bar-l"><div class="red_bar-r">
					<h1> Employees interested in the opportunity <s:property value="opportunity.title"/></h1>
				</div></div></div>
				<div class="lgrey_simple select_profile"><div class="lgrey_simple-b"><div class="lgrey_simple-l"><div class="lgrey_simple-r"><div class="lgrey_simple-tl"><div class="lgrey_simple-tr"><div class="lgrey_simple-bl"><div class="lgrey_simple-content">

					  <%--<s:a href="${ctx}/search/advancedEmployeeSearchFromEmployee.action">Advanced Search</s:a>--%>
					<s:if test="employeesList.size!=0">

					<div class="adv_results_container">
						<div class="sel_prof_headers">
							<div class="sel_prof_col spc_profilepic"><h3>Profile Picture</h3></div>

							<div class="sel_prof_col spc_username"><h3>ProfileName</h3></div>

							<div class="sel_prof_col spc_location"><h3>Location</h3></div>

						</div>

						<s:iterator value="employeesList" status="rowstatus">
                            <div class="<s:if test='#rowstatus.odd == true'>sel_prof_row</s:if><s:else>sel_prof_row noshade</s:else>">

                            <s:url id="viewprofile" action="../search/viewEmployeeProfileFromSearchEmployee">
                              <s:param name="employeeProfileId" value="id"/>
                            </s:url>

                                <div class="sel_prof_col spc_profilepic">
                                <s:if test="picture!=null">
                                 <img src="${ctx}/<s:property value="picture"/>" width="50" height="50" alt=<s:property value="name"/>/>
                                 </s:if>
                                 <s:else>
                                    <img src="${ctx}/styles/default/images/mobc_placeholder_thumb.jpg"  width="50" height="50" alt=<s:property value="nickName"/>/>
                                </s:else></div>
                                <div class="sel_prof_col spc_username"><s:property value="name"/></div>

                                <div class="sel_prof_col spc_location"><s:property value="profileOwner.city"/></div>

                                <div class="sel_prof_col spc_actions">
                                <s:a href="%{viewprofile}"> View Profile</s:a>
                                <s:if test="profiles.size!=0">
                                    <a href="#" onclick="return pop_up_add_contact(event,<s:property value="id"/>,'confirm_add',['center',300])"><span>Add as Contact</span></a>
                                    <a href="#">Send Message</a>
                                </s:if>
                                </div>
                            </div>
						 </s:iterator>

					</div>
                      </s:if>

					<s:if test="employeesList.size==0">No one has indicated interest in the opportunity yet.</s:if>

				</div> </div> </div> </div> </div></div></div></div>
			</div></div></div></div>
		</div>

<div id="confirm_add" class="popup1">                                           
    <div class="popup1-content">
        <div class="pu_row">
            <div class="pu_col"><img src="${ctx}/styles/default/images/mobc_default_profile_pic.jpg" alt="New Friend"/>
            </div>
            <div class="pu_col">
                <form>

                    <s:hidden id="employeeProfileId" name="contactOwner.id"/>
                     <div id="contact_details">
                    <h6>Profiles : </h6>
                    <s:select
                            list="profiles"
                            listKey="id"
                            headerKey="1"
                            headerValue="Please Select"
                            listValue="name" id="associatedProfileId" onchange="getPrivacyGroups();"/><br/>

                    <h6>Privacy Group: </h6>
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
                     	<span id="selContact">
                    		<s:a id="contactid" onclick="createContact('confirm_add');">
							Add as Contact</s:a> | <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span>
	                    <span style="display:none" id="progress">
	                    	<img src="${ctx}/styles/default/images/pleasewait.gif"/>
	                    </span>
	                    <span style="display:none" id="success">
	                    	Contact added successfully. <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span>
	                    <span style="display:none" id="failure">
	                    	Sorry, unable to add the contact. <a href="#"  onclick="return hide_pop_up('confirm_add')">Close</a>
	                    </span>
                </form>
            </div>
            <span class="clear-both"><!--  for IE6 --> </span>
        </div>
    </div>
</div>


