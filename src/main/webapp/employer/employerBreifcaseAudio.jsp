<%@ include file="/common/taglib.jsp" %>
<div id="bc_briefcase_briefcase">
<div id="bc_main_outer">
<div id="bc_main_mid">
<div id="your_briefcase">
<div class="bc_box">
<div class="bcb_header">
     <h2>My Inbox:</h2>
    <s:property value="inboxMessageCount"/>&nbsp;Messages,&nbsp;<s:property value="unreadEmprMsgListSize"/>&nbsp;Unread
</div>
<div class="bcb_nav">
    <ul>

        <li><a href="employerBriefcase.action">
            <div class="bcb_n_icon"><img src="${ctx}/styles/default/images/mobc_bcbn_icon-document.png" alt=""/></div>
            <div class="bcb_n_link">Documents</div>
        </a></li>
        <li><a href="employerBreifcasePhotos.action">
            <div class="bcb_n_icon"><img src="${ctx}/styles/default/images/mobc_bcbn_icon_photo_seleted..png" alt=""/>
            </div>
            <div class="bcb_n_link">Photos</div>
        </a></li>
        <li><a href="employerBreifcaseAudio.action">
            <div class="bcb_n_icon"><img src="${ctx}/styles/default/images/mobc_bcbn_icon-audio-selected.png" alt=""/>
            </div>
            <div class="bcb_n_link">Music/Videos</div>
        </a></li>
        
         <li>
		      <a href="employerBriefcaseURL.action">
		      <div class="bcb_n_icon"><img src="${ctx}/styles/default/images/mobc_bcbn_icon-URL.png" alt=""/></div>
		      <div class="bcb_n_link">Links</div>
		     </a>
		 </li>
        <li><a href="employerBriefcaseContacts.action">
            <div class="bcb_n_icon"><img src="${ctx}/styles/default/images/mobc_bcbn_icon-contacts.png" alt=""/></div>
            <div class="bcb_n_link">Contacts</div>
        </a></li>
        <li>
        	<a href="employerSkypeChat.action">
            <div class="bcb_n_icon"><img src="${ctx}/styles/default/images/mobc_bcbn_icon-chat.png" alt=""/></div>
            <div class="bcb_n_link">Chat</div>
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
            <!--
                <h3>You have <s:property value="itemcount"/> items.</h3>
                <br/>
                -->
            <h3>You have 0 views.</h3>

            <!--<s:property value="currentProfileId"/>

                --><br/>

            <p>Organize your briefcase items here.</p>
            <br/>

            <p>Add, remove, and edit your items.</p>
            <br/>

            <p><a href="">Help!</a></p>
            <br/>

            <form onsubmit="return false">
                <input type="image" value="Add a New Item" src="${ctx}/styles/default/images/red_add_new_btn-up.png"
                       onclick="bc_pop_up(event,'add_item',['center',300,'absolute']);hideEditableFields()"/>
            </form>
        </div>
    </div>
</div>

<div id="testid">
    <div class="test"></div>
</div>

<s:hidden name="hiddenIdForEdit" id="hiddenIdForEdit_id"/>
<s:set name="id" value="audioVedioListFromBriefcase" scope="request"/>
<div class="bcb_controw-right">
    <display:table name="${id}" id="id" class="bc_bc_table2" cellspacing="0"
                   pagesize="5" sort="list" defaultsort="1" requestURI=""
                   decorator="com.mob.util.EmployerBriefCaseItems">
        <display:column title="Type" scope="col" property="image"></display:column>

        <display:column property="name" title="Title" class="bc_tbl_shad"></display:column>
        <display:column property="audioVedioCategory" title="Category" class=""></display:column>
        <display:column property="privacySetting" title="Privacy" class="bc_tbl_shad"></display:column>
        <display:column property="createdDate" title="Added"></display:column>
        <display:column property="modifiedDate" title="Last Viewed" class="bc_tbl_shad"></display:column>
        <display:column property="links" title=""></display:column>

        <display:setProperty name="basic.msg.empty_list" value="Upload Music/Videos to share with your contacts!"/>

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

<div class="bc_items_pagination1">
    <!-- Leave this empty unless testing for styles. It will be filled via Javascript. -->
</div>
<!--
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
     -->
</div>
</div>
</div>
</div>

<div id="confirm_delete" class="popup1">
    <div class="popup1-content">
        <div class="pu_row">
            <div class="pu_col left"><img src="${ctx}/styles/default/images/big_blue_q.png" alt="Are you sure?"/></div>
            <div class="pu_col right">
                <h4>Remove &quot;<span id="briefcaseName"></span>&quot; from your Briefcase?</h4>

                <a href="#" onclick="return hide_pop_up('confirm_delete')"><img
                        src="${ctx}/styles/default/images/grn_no_btn-up.png" alt="No"/></a>
                  <a class="second_a" href="#"
                 id="delete"
                 onclick="deleteEmployerBriefcaseAudioOrVideo()">
                 <img src="${ctx}/styles/default/images/grn_yes_btn-up.png" alt="Yes"/></a>
            </div>
            <span class="clear-both"><!-- for IE6 --></span>
        </div>
    </div>
</div>


<div id="add_item" class="popup1">
    <div class="popup1-content">
        <div class="pu_row">
	 <span style="display:none;margin-top: 30px;color: red" id="nameId">                    
             <h5>Please enter name of item.</h5>
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
         <span style="display:none;margin-top:30px;color: red" id="nameId1">                    
             <h5>Should have less than 45 characters</h5>
         </span>

            <form action="${ctx}/employer/addEmployerAudioVedioItem.action" method="post" enctype="multipart/form-data">
                <input type="hidden" name="profile.id" value=
                <s:property value="currentProfileId"/>>
                <h4>Name of Item</h4>
                <input type="text" name="name" id="nameid"/>

                <div class="pu_row">
                    <div class="pu_col left">

                        <h4>Privacy Setting</h4>
                        <s:select name="privacySetting" headerKey="1" 
                                  list="contactTypesList" listKey="name" listValue="name" id="privacySettingId">
                        </s:select></div>
                    <div class="pu_col" style="margin-left: 50px;">
                        <h4>Category</h4>
                        <select name="category" id="categoryId" onchange="audioOrVideo();">
                            <option value="1"></option>
                            <option value="Video">Video</option>
                            <option value="Audio">Music</option>
                        </select>
                    </div>

                </div>
                <div class="pu_row">
                    <div class="pu_col" style="display: block;" id="audioDiv">
                        <h4>Location of Item (max 8MB)</h4>
                        <s:file name="itemFile" id="fileItem"/>
                    </div>

                    <div class="pu_col" style="display: none;" id="videoDiv">
                        <h4>Youtube Video URL</h4>
                        <input type="text" class="txt xlg" name="videoUrl" id="videoUrl"/>
                    </div>
                </div>
                <div class="submit_btn"><input type="image" src="${ctx}/styles/default/images/grn_add_item_btn-up.png"
                                               onclick="return addEmployerBriefcaseAudioVedio()"/></div>
                <div class="ftos">By uploading a file you certify that you have the right to distribute this content and
                    that it does not violate the Terms of Service.
                </div>
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
             <h6>Title should have less than 45 characters.<a href="#" onclick="return hide_pop_up('confirm_delete2')">Close</a>
             </h6>
             </span> 
             <span style="display:none" id="failure">
	        Sorry,Unable to update data. <a href="#" onclick="return hide_pop_up('confirm_delete2')">Close</a>
	        </span>
                <span class="clear-both"><!-- for IE6 --></span>
            </div>
        </div>
    </div>
  
   <script type="text/javascript" src="<c:url value='/styles/default/js/employerBriefcase.js'/>"></script>
   <script type="text/javascript" src="<c:url value='/styles/default/js/audio/yahoomediaplayer.js'/>"></script>
<script type="text/javascript" src="<c:url value='/styles/default/js/audio/yahoomediaplayerwikia.js'/>"></script>


