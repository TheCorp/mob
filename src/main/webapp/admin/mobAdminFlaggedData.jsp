
<%@ include file="/common/taglib.jsp" %>
<%@ include file="/admin/flaggedComments.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/styles/default/css/mob.css'/>" />

<script type="text/javascript" src="<c:url value='/styles/default/js/admin.js'/>"></script>
<script type="text/javascript" src="<c:url value='/styles/default/js/adminFlagged.js'/>"></script>
<script type="text/javascript" src="<c:url value='/styles/default/js/adminpagination.js'/>"></script>
<script type="text/javascript">
    $(document).ready(function() {
       showHideAdminData();
    });
</script>
<!-- <form action="${ctx}/public/flaggedData.action" method="post"> -->
<form action="${ctx}/public/adminFlaggedController.action" method="post">

<div class="selectsection">
 <div id="selectedFlagedDataSpanId" style="color: red;font-size: 12px;margin-bottom:3px;margin-left:155px;"></div>
        <div>
	  <h2>
	     <label>Select a section to view:
	             <s:select id="selectedFlagDataId"
		  	     name="selectedTableName" 
				 headerKey="1"
				 headerValue="- - - - - - - - - - - - -"		    
				 list="#{'user':'Users','profile':'Profiles','Threads':'Threads','item':'Briefcase Items','Groups':'Groups'}"
				 />
		
		 </label>
	  </h2>
</div>
<div id="content-main">
	    
	        <div class="search">
				<input type="text" size="50" class="searchtext" name="searchName"/>
				<input type="image" src="${ctx}/styles/default/images/search.png" class="searchbutton" onclick="return validationForFlagDataSearch();" />
	    	</div>
	   </form>   	
	    
		
  	
     <form action="${ctx}/public/adminDeleteInfo.action" method="post">
            
	    	<div class="selectsection">
	    	<div style="margin-top:8px;margin-left:110px"><span id="selectedFlagedDeleteSpanId" style="display: none;color: red"></span></div>
	    		<h2>
	        	<label>Select an action:	        	
	          	<s:select id="selectedFlagDeleteNameId"
			    name="selectedFlagName" 
			    headerKey="1"
			    headerValue="- - - - - - - - - - - - -"		    
			    list="#{'Delete':'Delete'}"/>
	        	</label>
	      		</h2>
	      		
	    	</div>
	    	
	    	<div class="search" style="margin-left: 284px; margin-top: -17px;">
	    		<input type="image" src="${ctx}/styles/default/images/Ok_admin.png" onclick="return deleteFlaggedData()"/>
	    	</div>
 
        <div id="tableholder">
	        	<div id="paginator">
	               <div id="paginator">
	               
			                  	<span id="prev" style="cursor: pointer;" class="pagelink"> « Prev </span>
			                  	<span id="sep">|</span>  
			                  	<span id="next" style="cursor: pointer;" class="pagelink"> Next » </span>
			                  	<span id="count" class="pagelink"></span>
		          
	        	</div>
	        	</div>
		    		<div id="table">
				                <table cellspacing="0" width="100%">
				                <thead class="tableheader">
				                  <tr>
				                    <td class="flagcell"></td>
			
				                    <td class="checkcell"></td>
				                    	                    	
				                    	  <s:if test="selectedTableName=='user'">
				                      <td class="textcell"><b>UserId</b></td>
				                      </s:if>
				                        <s:if test="selectedTableName=='profile'">
				                         <td class="textcell"><b>UserId</b></td>
				                          <td class="textcell"><b>ProfileId</b></td>
				                      </s:if>
				                       <s:if test="selectedTableName=='item'">
				                          <td class="textcell"><b>ItemId</b></td>
				                      </s:if>
				                       <s:if test="selectedTableName=='Threads'">
				                         <td class="textcell"><b>UserId</b></td>
				                          <td class="textcell"><b>GroupId</b></td>
				                      </s:if>
				                       <s:if test="selectedTableName=='Groups'">
				                          <td class="textcell"><b>GroupId</b></td>
				                      </s:if>
				                      
				                      
				                    <td class="textcell"><b>Name</b></td>
				                    <td class="textcell"><b>Comment</b></td>
				                    <td class="cell5"></td>
				                    <td class="cell6"></td>
				                  </tr>
				                </thead>
			               
				                <tbody class="tablebody">
				                 <s:iterator value="adminflaggedInfoList" status="row">
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
						                     <s:elseif test="groupDiscussions">
						                     <s:property value="groupDiscussions.topics.group.id"/>
							                  
						                     </s:elseif>
						                        <s:else> 
						                     <s:property value="group.id"/>
							                   </s:else>
						                     <s:property value="flagedid"/>
				                     </td>
				                    <td class="textcell">
					                        <s:if test="user">
					                    		<s:property value="user.firstName"/>
					                    		 <s:if test="#row.count==1">
					                            <input type="hidden" value="user" name="type"/>
					                            </s:if>
					                        </s:if>      					                     
					                        <s:elseif test="profile">
					                          	<s:property value="profile.name"/>
					                            <s:if test="#row.count==1">
					                          		<input type="hidden" value="profile" name="type"/>
					                            </s:if>   
					                        </s:elseif>   
						                      <s:elseif test="item">
						                     <s:property value="item.name"/>
							                     <s:if test="#row.count==1">
							                        <input type="hidden" value="item" name="type"/>
							                     </s:if>
						                    </s:elseif>
						                     <s:elseif test="groupDiscussions">
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
				                    <td class="textcell">
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
								                    <s:if test="item!=null">
									                    <s:if test="comments.size!=0">
									                       <a href="javascript:void(0);" onclick="pop_upForShowingFlagComments(<s:property value="item.id"/>)"><span style="color:red"><s:property value="comments.size"/></span></a>
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
		    		</div>
		    		   <div id="confirm_delete5" class="popup1">
										    <div class="popup1-content">
										        <div class="pu_row">
										            <div class="pu_col left"></div>
										            <div class="pu_col right">		
										               <span id="comment" class="commentSpan"></span>
												      <span class="closeSpan"><a href="javascript:void(0);"  onclick="return hide_pop_up('confirm_delete5')"><span style="font-size: 12px;font-weight: bold;">Close</span></a></span>  
										            </div>
										            <span class="clear-both"><!-- for IE6 --></span>
										        </div>
										    </div>
										</div> 
		    		
		    		  		
        </div>
    </form>
    
    
    
    
    
  


