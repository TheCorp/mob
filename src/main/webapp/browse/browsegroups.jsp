<%@ include file="/common/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/styles/default/css/browse/browse.css" />
 <div id="bc_main_outer">
  <div id="bc_main_mid">
   <div id="body_container">
   <h2>Group Search</h2>
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
 		<s:include value="categories.jsp"></s:include>
      </div>

	  <div id="browse_right_content">
        <div class="head_sec">
          <s:include value="keyword.jsp"></s:include>
          <div class="right_box">
			<s:include value="pagination.jsp"></s:include>
          </div>
        </div>
        <div class="list_section">
          <ul>
            <li class="none">
              <div class="name">Name</div>
              <div class="details">Details</div>
            </li>
			<div id="page">
			<s:include value="browsegrouppage.jsp"></s:include>			
			</div>
          </ul>
        </div>
      </div>
    
	<div>
		<div class="popup" id="popup" style="display:none;">
	</div>
	  </div>
		  </div>
</div>
		<div id="searchtype" style="display:none">Group</div>
</div>
<br class=clear-both"/>

<script type="text/javascript" src="${ctx}/styles/default/js/jquery.livequery.min.js">
</script>
<script type="text/javascript" src="${ctx}/styles/default/js/browse/browse.js">
</script>
<script
		src="${ctx}/styles/default/js/groups/joinGroups.js"
		type="text/javascript"></script>

   	
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
                <s:if test="profiles.size!=0">
                
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
                      <s:select  list="profiles"
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

