<%@ include file="/common/taglib.jsp" %>
<div id="bc_briefcase_briefcase">
<div id="bc_main_outer">
<div id="bc_main_mid">
<div id="your_briefcase">
<div class="bc_box">
<div class="bcb_header">
    <h2><s:property value="employeeProfile.name"/>'s&nbsp;Briefcase</h2>&nbsp;(<s:property value="itemcount"/> Items: <s:property value="documentsCount"/> Documents,
    <s:property value="photossCount"/> Photos, <s:property value="audioVedioCount"/> Videos) <h2><s:property value="employeeProfile.name"/>'s Inbox</h2>:
    <s:property value="inboxMessageCount"/> Messages, <s:property value="unreadEmpMsgListSize"/> Unread
</div>
<s:hidden name="employeeProfile.id" id="briefcaseProfilrId"></s:hidden>
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
	            	<img src="${ctx}/styles/default/images/mobc_bcbn_icon_photoq..png" alt="" />
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
            	<img src="${ctx}/styles/default/images/mobc_bcbn_icon-contacts.png" alt=""/>
            </div>
            <div class="bcb_n_link">Contacts</div>
        </a>
        </li>
        
        
  </ul>
  
  
</div>
<div id="bcb_controw">

    <div class="bcb_controw-left">
        <div class="bc_lgrnbox">
            <div class="bc_lgb-content">
                <div class="bc_lgb_title"><h1>MyBriefcase</h1></div>
                <br/>

                <h3>You have <s:property value="itemcount"/> items.</h3>
                <br/>

                <h3>You have <span id="viewCountId"><s:property value="briefCase.briefcaseViewCount"/></span>&nbsp;views.</h3>

                <br/>

                <p>Organize <s:property value="employee.firstName"/>  briefcase items here.</p>
                <br/>

                
            </div>
        </div>
    </div>

    <div id="testid">
        <div class="test"></div>
    </div>
    <div class="" title="Help">
 
</div>
   <s:hidden name="hiddenIdForEdit" id="hiddenIdForEdit_id"/>					
					<s:set name="id" value="photosListFromBriefcase" scope="request"/>
					<div class="bcb_controw-right">                                    
	                 <display:table  name="${id}"     id="id"  class="bc_bc_table2" cellspacing="0"
	                                 pagesize="5"     sort="list" defaultsort="1" requestURI="" 
	                                 decorator="com.mob.util.BriefCaseItems">
	                   <s:property value="${id}"/>               
	                <display:column title="Type" scope="col" property="image"></display:column>
	               
	               <display:column property="name" title="Title" class="bc_tbl_shad"></display:column>  
	               <display:column property="privacySetting" title="Privacy" class="bc_tbl_shad"></display:column>	
	               <display:column property="createdDate"  title="Added"></display:column>                           	            
	               <display:column property="modifiedDate" title="Last Viewed" class="bc_tbl_shad"></display:column>
	               <display:column property="flagImage" title="Flag" class="bc_tbl_shad"></display:column>
	               <display:setProperty name="basic.msg.empty_list" value="No Photos to display!"/>
	              
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
     
     <br class="clear-both"/>
     <div id="confirm_delete" class="popup1">
    <div class="popup1-content">
        <div class="pu_row">
            <div class="pu_col left"></div>
            <div class="pu_col right">
            <form>
              <span style="font-size: 12px;font-weight: bold;">Flag Category:</span>
               <s:select list="flaggedTypeList"
                          headerKey="1" 
			              headerValue="Please Select"
			              listValue="typeFlag"
			              cssStyle="width:203px;" 
			              listKey="typeFlag"  
			              id="selectedFlagTypeId" >
			    </s:select>
                <span style="font-size: 12px;font-weight: bold;">Comment:</span>
                <textarea rows="5" id="flagComment" style="width:200px;"></textarea>
                 <input type="hidden" value="item" id="type"/>
                <a href="#" onclick="return hide_pop_up('confirm_delete')"><img src="${ctx}/styles/default/images/mobc_Cancel.png" align="left" width="77" height="20" /></a>
               <a class="second_a" href="#"   onclick="storeFlagcomment()"><img src="${ctx}/styles/default/images/mobc_Submit.png" align="right" width="77" height="20" /></a>
             </form>   
            </div>
            <span class="clear-both"><!-- for IE6 --></span>
        </div>
    </div>
</div>
  	
    <div class="bc_items_pagination1">
        <!-- Leave this empty unless testing for styles. It will be filled via Javascript. -->
    </div>
     
    <div id="bcb_footer">
        <div class="bcb_f_options_cont"><a href=""><img src="${ctx}/styles/default/images/mobc_grnoptionsbtn2-up.png"
                                                        alt="Options"/></a></div>
        <div class="bcb_f_form_cont">
            <form id="bcb_f_searchform" action="" onsubmit="return false">
                <div class="col_l"><input name="search" type="text" class="txt" value="type something..."
                                          onfocus="inputOnFocus(this)"/></div>
                <div class="col_r"><input type="image" value="Submit"
                                          src="${ctx}/styles/default/images/mobc_grnsearchbtn2-up.png"/></div>

            </form>
        </div>
    </div>
     
</div>
</div>
</div>


</div>



<script type="text/javascript" src="<c:url value='/styles/default/js/employeeBriefcase.js'/>"></script>



