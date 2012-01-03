<%@ include file="/common/taglib.jsp" %>
<%@ include file="/admin/comments.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/styles/default/css/mob.css'/>" />
<script type="text/javascript" src="<c:url value='/styles/default/js/admin.js'/>"></script>
<script type="text/javascript" src="<c:url value='/styles/default/js/adminpagination.js'/>"></script>
<script type="text/javascript" src="<c:url value='/styles/default/js/employeeBriefcase.js'/>"></script>

<script type="text/javascript">
    $(document).ready(function() {
      validationsForPopUp();
      showHideAdminData();
       
    });
</script>

<form action="${ctx}/public/adminController.action" method="post">

<div class="selectsection">
        <div id="selectedFlagtypeSpanId" style="color: red;font-size: 12px;margin-bottom:3px;margin-left:155px;"></div>
        <div>
	  <h2>
	     <label>Select a section to view:
	            <s:select id="selectedFlagtypeId"  
	             name="selectedTableName" 
				 headerKey="1"
				 headerValue="- - - - - - - - - - - - -"		    
				 list="#{'user':'Users','profile':'Profiles','Threads':'Threads','TopicReplies':'Topic Replies','item':'Briefcase Items','Groups':'Groups'}"
				 />
		
		 </label>
	  </h2>
	  </div>
</div>
<div id="content-main">
	        <div class="search">
				<input type="text" size="50" class="searchtext" id="searchNameId" name="searchName"/>
				<input type="image" src="${ctx}/styles/default/images/search.png" class="searchbutton" onclick="return validationForSearch();" />
			</div>
		
			
</form>

	   <!--   	
	     <form  id="formflagId" action="${ctx}/public/adminFlag.action" method="post">
            
	    	-->
	 	 <form id="formflagId">
	    	<div class="selectsection">
	    	<div style="margin-top:8px;margin-left:110px"><span id="selectedFlagNameSpanId" style="color: red; font-size: 12px;"></span></div>
	    		<h2>
	        	<label>Select an action:	        	
	          	<s:select id="selectedFlagNameId"
			    name="selectedFlagName" 
			    headerKey="1"
			    headerValue="- - - - - - - - - - - - -"		    
			    list="#{'Flag':'Flag','Delete':'Delete'}"
			    />
	        	</label>
	      		</h2>
	    	</div>
	    	
	    	
	    	
	    	    <div class="search"  style="margin-left: 284px; margin-top: -17px;">
	    		<input type="submit" src="${ctx}/styles/default/images/Ok_admin.png" onclick="return validationsForAdmin()"/>
	    	 						
	    	</div>
 
        <div id="tableholder">
	        	<div id="paginator">
	               
			                  	<span id="prev" style="cursor: pointer;" class="pagelink"> « Prev </span>
			                  	<span id="sep">|</span>  
			                  	<span id="next" style="cursor: pointer;" class="pagelink"> Next » </span>
			                  	<span id="count" class="pagelink"></span>
		          
	        	</div>
		    		<div id="table">
				                <table cellspacing="0" width="100%">
				                <thead class="tableheader">
				                  <tr>
				                    <td class="flagcell"></td>
				
				                    <td class="checkcell"></td>
				                     <s:if test="selectedTableName=='user'">
				                      <td class="textcell"><b>UserId</b></td>
				                      <td class="textcell"><b>Name</b></td>
				                    <td class="textcell"><b>Comment</b></td>
				                      </s:if>
				                        <s:if test="selectedTableName=='profile'">
				                         <td class="textcell"><b>UserId</b></td>
				                          <td class="textcell"><b>ProfileId</b></td>
				                          <td class="textcell"><b>Name</b></td>
				                    <td class="textcell"><b>Comment</b></td>
				                      </s:if>
				                      <s:if test="selectedTableName=='item'">
				                          <td class="textcell"><b>ItemId</b></td>
				                          <td class="textcell"><b>Name</b></td>
				                    <td class="textcell"><b>Comment</b></td>
				                      </s:if>
				                       <s:if test="selectedTableName=='Threads'">
				                         <td class="textcell"><b>UserId</b></td>
				                          <td class="textcell"><b>GroupId</b></td>
				                          <td class="textcell"><b>Name</b></td>
				                    <td class="textcell"><b>Comment</b></td>
				                      </s:if>
				                       <s:if test="selectedTableName=='Groups'">
				                          <td class="textcell"><b>GroupId</b></td>
				                          <td class="textcell"><b>Name</b></td>
				                    <td class="textcell"><b>Comment</b></td>
				                      </s:if>
				                       <s:if test="selectedTableName=='TopicReplies'">
				                         <td class="textcell"><b>UserId</b></td>
				                          <td class="textcell"><b>GroupId</b></td>
				                           <td class="textcell"><b>discussions</b></td>
				                             <td class="textcell"><b>Comment</b></td>
				                      </s:if>
				                    
				                    <td class="cell5"></td>
				                    <td class="cell6"></td>
				                  </tr>
				                </thead>
			               
				                <tbody class="tablebody">				               
				                 <s:iterator value="flaggedInformationList" status="row">
				                 <s:set name="number" value="(#row.count-1)/15"/>
						                  <tr class="row1 number<s:property value="#number"/>">
							                    <td class="flagcell">
								                      <s:if test="user.flagged">
								                         <img src="${ctx}/styles/default/images/icon_flag.png"/>
								                      </s:if>
								                     
								                      <s:if test="profile.flagged">
								                         <img src="${ctx}/styles/default/images/icon_flag.png"/>
								                      </s:if>
								                       <s:if test="item.flagged">
								                         <img src="${ctx}/styles/default/images/icon_flag.png"/>
								                      </s:if>
								                         <s:if test="groupDiscussions.flagged">
								                         <img src="${ctx}/styles/default/images/icon_flag.png"/>
								                      </s:if>
								                       <s:if test="group.flagged">
								                         <img src="${ctx}/styles/default/images/icon_flag.png"/>
								                      </s:if>
								                     
							                    </td>
							                    <td class="checkcell">
							                     <s:if test="user!=null">
							                        <input type="checkbox" 
							                               class="action-select" value="<s:property value='user.id'/>"
							                                name="seletedFlag<s:property value='user.id'/>"/>
							                    
							                     </s:if>
							                      <s:if test="profile!=null">
							                        <input type="checkbox" 
							                               class="action-select" value="<s:property value='profile.id'/>"
							                                name="seletedFlag<s:property value='profile.id'/>"/>
							                    
							                     </s:if>
							                     <s:if test="item!=null">
							                        <input type="checkbox" 
							                               class="action-select" value="<s:property value='item.id'/>"
							                                name="seletedFlag<s:property value='item.id'/>"/>
							                    
							                     </s:if>
							                       <s:if test="groupDiscussions!=null">
				                                      <input type="checkbox"
				                                  class="action-select" value="<s:property value='groupDiscussions.id'/>"
				                                     name="seletedFlag<s:property value='groupDiscussions.id'/>"/>
				                       </s:if> 
				                       
				                         <s:if test="group!=null">
				                                      <input type="checkbox"
				                                  class="action-select" value="<s:property value='group.id'/>"
				                                     name="seletedFlag<s:property value='group.id'/>"/>
				                       </s:if> 
							                   </td>
							                   
							                      <s:if test="profile">
				                      <td class="textcell">
					                    		<s:property value="profile.profileOwner.id"/>
					                    		  </s:if> 
					                    		   <s:if test="groupDiscussions">
				                      <td class="textcell">
					                    		<s:property value="groupDiscussions.profile.profileOwner.id"/>
					                 </td>
				                      </s:if>   
				                    
				                       <td class="textcell">
					                        <s:if test="user">
					                    		<s:property value="user.id"/>
					                        </s:if>      					                     
					                        <s:elseif test="profile">
					                          	<s:property value="profile.id"/>
					                        </s:elseif>   
						                     <s:elseif test="item">
						                     <s:property value="item.id"/>
							                 </s:elseif>
						                       <s:if test="groupDiscussions">
						                     <s:property value="groupDiscussions.topics.group.id"/>
							                 </s:if>
							                   <s:if test="group">
						                     <s:property value="group.id"/>
							                 </s:if>
						                     
						                     
						                     <s:property value="flagedid"/>
				                     </td>
							                   
							                    <td class="textcell">
								                     <s:if test="user!=null">
								                        <s:if test="#row.count==1">
								                            <input type="hidden" value="user" name="type"/>
								                        </s:if>
								                       
								                    		<s:property value="user.firstName"/>
								                    	
								                     </s:if>
								                     <s:elseif test="profile!=null">
								                      <s:if test="#row.count==1">
								                          <input type="hidden" value="profile" name="type"/>
								                       </s:if>    
								                          <s:property value="profile.name"/>
								                     </s:elseif>
								                      <s:elseif test="item!=null">
								                     <s:if test="#row.count==1">
								                     <input type="hidden" value="item" name="type"/>
								                     </s:if>
								                     <s:property value="item.name"/>
								                    </s:elseif>
								                        <s:elseif test="groupDiscussions!=null">
						                      <s:property value="groupDiscussions.discussions"/>
							                     <s:if test="#row.count==1">
							                        <input type="hidden" value="Threads" name="type"/>
							                     </s:if>
						                     </s:elseif>
						                         <s:elseif test="group!=null">
						                      <s:property value="group.name"/>
							                     <s:if test="#row.count==1">
							                        <input type="hidden" value="Groups" name="type"/>
							                     </s:if>
						                     </s:elseif>
						                     
						                     <s:property value="flagedid"/>
							                     </td>
							                    <td class="cell4">
								                    <s:if test="user!=null">
									                    <s:if test="comments.size!=0">
									                       <a href="javascript:void(0);" onclick="pop_upForShowingFlagComments(<s:property value="user.id"/>)"><span style="color:red"><s:property value="comments.size"/></span></a>
									                    </s:if>
								                        <s:else>
								                          <span style="color:red"><s:property value="comments.size"/></span>
								                       </s:else>
								                    </s:if>
								                    <s:if test="profile!=null">
									                    <s:if test="comments.size!=0">
									                       <a href="javascript:void(0);" onclick="pop_upForShowingFlagComments(<s:property value="profile.id"/>)"><span style="color:red"><s:property value="comments.size"/></span></a>
									                    </s:if>
								                        <s:else>
								                          <span style="color:red"><s:property value="comments.size"/></span>
								                       </s:else>
								                    </s:if>
								                     <s:if test="groupDiscussions!=null">
									                    <s:if test="comments.size!=0">
									                       <a href="javascript:void(0);" onclick="pop_upForShowingFlagComments(<s:property value="groupDiscussions.id"/>)"><span style="color:red"><s:property value="comments.size"/></span></a>
									                    </s:if>
								                        <s:else>
								                          <span style="color:red"><s:property value="comments.size"/></span>
								                       </s:else>
								                    </s:if>
								                    <s:if test="item!=null">
									                    <s:if test="comments.size!=0">
									                       <a href="javascript:void(0);" onclick="pop_upForShowingFlagComments(<s:property value="item.id"/>)"><span style="color:red"><s:property value="comments.size"/></span></a>
									                    </s:if>
								                        <s:else>
								                          <span style="color:red"><s:property value="comments.size"/></span>
								                       </s:else>
								                    </s:if>
								                     <s:if test="group!=null">
									                    <s:if test="comments.size!=0">
									                       <a href="javascript:void(0);" onclick="pop_upForShowingFlagComments(<s:property value="group.id"/>)"><span style="color:red"><s:property value="comments.size"/></span></a>
									                    </s:if>
								                        <s:else>
								                          <span style="color:red"><s:property value="comments.size"/></span>
								                       </s:else>
								                    </s:if>
								                    
							                    </td>
							                    <td class="cell5"></td>
							                    <td class="cell6"></td>
						                  </tr>
										  
				                </s:iterator>
				                
				
				                </tbody>
			                </table>
			                
			                <div id="confirm_delete5" class="popup1">
										    <div class="popup1-content">
										        <div class="pu_row">
										            <div class="pu_col left"></div>
										            <div class="pu_col right">		
										               <span id="comment" class="commentSpan"></span>
												      <span class="closeSpan"><a href="javascript:void(0);"  onclick="return hide_pop_up('confirm_delete5')"><span style="font-size: 12px;font-weight: bold;">Cancel</span></a></span>  
										            </div>
										            <span class="clear-both"><!-- for IE6 --></span>
										        </div>
										    </div>
										</div> 
			                
		    		</div>
        </div>
    </form>
  
<div id="confirm_deleteadmin" class="popup1" style="display: block; position: absolute; left: 420px; top: 80px;">
<!--<div id="confirm_deleteadmin" class="popup1" style="visibility: visible; display: block; position: absolute; left: 90px; top: 100px;">
				    --><div class="popup1-content">
					        <div class="pu_row">
					            <div class="pu_col left"></div>
					            <div class="pu_col right">
					            <form>
					              <span style="font-size: 12px;font-weight: bold;">Selected flagged items:</span>
					             <span style="font-size: 12px;font-weight: bold;" id="countId"></span>
					              <span style="font-size: 12px;font-weight: bold;">       </span>
					                 <span style="font-size: 12px;font-weight: bold;">Flag Category:</span>
					               <s:select list="flaggedTypeList"
					                          headerKey="1" 
								              headerValue="Please Select"
								              listValue="typeFlag"
								              cssStyle="width:203px;" 
								              listKey="typeFlag"  
								              id="selectedFlagType" >
								    </s:select>
					                <span style="font-size: 12px;font-weight: bold;">Comment:</span>
					                <textarea rows="5" id="flagComment" style="width:200px;"></textarea>
					                 <input type="hidden" value="Threads" id="profileType"/>
					                <a href="#" onclick="return hide_pop_up('confirm_deleteadmin')"><img src="${ctx}/styles/default/images/mobc_Cancel.png" align="left" width="77" height="20" /></a>
					               <a class="second_a" href="#" onclick="storeFlagcommentForAdmin()"><img src="${ctx}/styles/default/images/mobc_Submit.png" align="right" width="77" height="20" /></a>
					             </form>   
					            </div>
					             <span class="clear-both"><!-- 2 for IE6 --></span>
					        </div>
				    </div>
			</div>
		
	




<!--<script type="text/javascript" src="<c:url value='/styles/default/js/employeeBriefcase.js'/>"></script>-->