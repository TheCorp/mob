	<%@ include file="/common/taglib.jsp"%>
	
	<div id="bc_main_outer">
	<div id="bc_main_mid">

		<div class="bc_main_inner clear-both r_sel_prof">
			<div id="outerlgb"><div class="lgrey_box"><div class="lgrey_box-r"><div class="lgrey_box-b">
				<div class="red_bar"><div class="red_bar-l"><div class="red_bar-r">
					<h1>Group Search</h1>
				</div></div></div>
				<div class="lgrey_simple select_profile"><div class="lgrey_simple-b"><div class="lgrey_simple-l"><div class="lgrey_simple-r"><div class="lgrey_simple-tl"><div class="lgrey_simple-tr"><div class="lgrey_simple-bl"><div class="lgrey_simple-content">
					<h2>Current Group Results</h2>

					<div class="sel_prof_headers">
						<div class="sel_prof_col spc_jname" style="width: 275px"><h3><b>Group Name</b></h3></div>
						<div class="sel_prof_col spc_ptitle"><h3><b>Group Type</b></h3></div>
						<div class="sel_prof_col spc_empbooked"><h3><b>Group Owner</b></h3></div>
						<div class="sel_prof_col spc_empall"><h3><b>Created Date</b></h3></div>

					</div>
					<s:iterator value="ListOfgroups" status="rowstatus">
					<form  id="joinGroupForm" action="" >
					<div class="<s:if test="#rowstatus.odd == true">sel_prof_row</s:if><s:else>sel_prof_row noshade</s:else>">
						<div class="sel_prof_col spc_jname" style="width: 275px"><s:property value="name" /></div>
						<div class="sel_prof_col spc_empinted">&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="title"/></div>
						<div class="sel_prof_col spc_empbooked">
							&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;
							<s:property value="profile.name"/>
						</div>
						
						<div class="sel_prof_col spc_empall">
							&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;
							<s:date name="createdDate" format="dd MMM yyyy"/>
							</div>
							
						<div class="sel_prof_col spc_actions" style="background-color:#F2F2F2;
							margin-left:20px;width:110px;"  >
						 <s:if test="profile.profileOwner.id!=user.id&&groupMember!=1&&groupPrivateMember!=1">
						 <img src="${ctx}/styles/default/images/Group_Join.png" alt="Join" title="Join" onclick="return pop_up_join_group(event,'<s:property value="id"/>','<s:property value="title"/>','confirm_add1',[30,30,'negoffset_mouse']);"/>
						 </s:if>
						 
						  <s:if test="groupMember==1">
						   <font color="green" size="2px"><h5>Group Member</h5></font>
						  </s:if>
						   <s:elseif test="groupPrivateMember==1">
						   <font color="green" size="2px"><h5>Request Pending</h5></font>
						  </s:elseif>
						    <s:if test="profile.profileOwner.id==user.id">
						 <font style="color: green;" size="2px"><h5>Group Owner</h5></font>
						 </s:if>
						
						</div>
					</div>
					</form>
					</s:iterator>
					
					
					
				</div></div></div></div></div></div></div></div>

			</div></div></div></div>
		</div>
	</div>
</div>



   	
	<div id="confirm_add1" class="popup1" style="position:absolute;">
    	<div class="popup1-content">
        <div class="pu_row">
        
           <s:if test="profilList.size!=0">
             <div class="pu_col" id="imageId">
            	 <img src="${ctx}/styles/default/images/mobc_default_profile_pic.jpg" alt="New Friend"/>
            </div>
            </s:if>
            <div class="pu_col" style="width:175px" id="goupViewId">
                <form action="" id="joinGrpForm" method="GET">
                <s:if test="profilList.size!=0">
                
               		    <input type="hidden"  name="group.id" id="groupId">
                	 	<input type="hidden"  name="myGroup.id" id="myGroupId">
                        <input type="hidden"  name="profile.id" id="profilID">
                        <input type="hidden"  name="myGroup.title" id="mygroupTitle">
                        
                     <div id="contact_msg_details">
                  	 <h5><span style="display:none;color:red;" id="failureMsg">
	                    	Please Select profile.
	                    </span></h5>
	                    
                      <h5>Profiles : </h5>
                     <h5 align="center">
                      <s:select  list="profilList"
                            listKey="id"
                            headerKey=""
                            headerValue="Please Select"
                            listValue="name" id="profileId"/></h5>
                           <br/>
                        <span  id="messageSpanID">
                    	<h5>Message:</h5> 
                     	<textarea rows="2" cols=""  name="message" id="messageId" class="" style="width: 150px;"></textarea><br/>
                     	</span>
                     </div>
                     <br/>
                    
                     	<h5 align="right">
                     	<span id="selMsgContact">
                    		 <input type="submit" id="contactid" onclick="return joinToGroup();"  title="OK" style="cursor:pointer;" value="Ok"/>|
                    		 <a href="#" title="Close"  onclick="return hide_pop_up1('confirm_add1')">Close</a>
	                   </span></h5>
	                   
	                    <span style="display:none;color:green;" id="msgSuccess">
	                    	<h5>You have successfully joined to this group. </h5>
	                    	<a href="#"  onclick="return hide_pop_up1('confirm_add1')"><h5 align="right">Close</h5></a>
	                    </span>
	             
	                   <h5><span style="display:none" id="msgFailure">
	                    	Sorry, unable to send message! <a href="#"  onclick="return hide_pop_up1('confirm_add1')">Close</a>
	                    </span></h5>
	             </s:if>  
	                          
	                  <s:if test="profilList.size==0">
                 		<h5>&nbsp;Please update your  profile</h5>
	            		<br/>
	            		<h5 align="right"><a href="${ctx}/employee/loadEmployeeProfilesList.action">Update</a>
		                <a href="#"  onclick="return hide_pop_up1('confirm_add1')">Close</a></h5>
	        		 </s:if>
	        		 
                </form>
            </div>
         
            <span class="clear-both"><!--  for IE6 --> </span>
        </div>
    </div>  

</div>

	<span class="clear-both"><!--  for IE6 --> </span>
	
	<script
		src="<c:url value='/styles/default/js/groups/joinGroups.js'/>"
		type="text/javascript"></script>
	
	
