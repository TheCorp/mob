<%@ include file="/common/taglib.jsp"%>

<script type="text/javascript" src="<c:url value='/styles/default/js/groups/grouppagination.js'/>"></script>
<script type="text/javascript" src="<c:url value='/styles/default/js/groups/createTopic.js'/>"></script>
<script type="text/javascript" src="<c:url value='/styles/default/js/employeeBriefcase.js'/>"></script>

<script type="text/javascript">

    $(document).ready(function() {
       showHideGroupData();
       lineBreak();
    });
</script>
	<div id="bc_main_outer">
		<div id="bc_main_mid">
			<div id="bc_profile_outernav">

	   			<div class="outer_page_nav">
					<ul>
						<li class="active">
			   				<a href="${ctx}/myGroups/postTopics.action">Discussions</a>
			   			</li>
			   			<li>
							<a href="${ctx}/myGroups/listOfAllTopics.action">View Topics</a>
			   			</li>
					</ul>
				</div>
			</div>
			<div class="bc_main_inner clear-both">
	   			<div id="bc_view_topic">
					<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
						<div class="bc_greytbar">
	      					<h3 class="bc_gtb_title">Posts (Displaying posts 1-10 out of 20)</h3>

	     				</div>
	     				<form action="${ctx}/myGroups/savegroupDiscussion.action" method="post" id="helpForm">
	     				<span style="display:none;margin-top: 30px;color: red;text-align: center" id="groupdiscussionSpanId">                    
	                    	<span id="failureMsgId"></span>
	                    </span>
	                    
	                      <span style="margin-top: 30px; color: red; font-size: 12px;" id="groupProfileSpanId"></span>
	                 	 <span style="margin-left: 69px;font-size: 12px;font-weight: bold;"><h5 class="groupspace"></h5>
	                  
						<!--<s:select list="profilList" listKey="id"  cssStyle="width:225px;" 
				                  headerKey="1" headerValue="Please Select"  key="Profiles"listValue="name"
				                  name="profile.id" id="profileListId" />
				        --></span>
				        
				        
				        
	     				<div class="post_comment">
	     					<div class="comment_side">Post Comment:</div>
	     					<div class="comment_box">
	     						<textarea name="discussion" rows="6" id="groupdiscussionId" cols="98"></textarea><br>
	     						<input id="" type="image" value="Submit" 
	     					                  src="${ctx}/styles/default/images/btn_discussion_post.png" alt="Submit"
	     					                   onclick="return postCommentValidations()"/>
	     					</div>
	     				</div>
					</form>
					
					
					<div class="bc_greytbar_topic">
	      					<h3 class="bc_gtb_title">Topic Content</h3>
	     				</div>
	     				<div class="post_comment1">
	     				<div class="topic_content">
	     					<s:property value="description" />
	     					</div>
	     				</div>
	     			
					
					<s:iterator value="groupDiscussionList" status="row">
						  <s:set name="number" value="(#row.count-1)/10"/>
							<div class="grey_line"></div>
								<div class="post number<s:property value="#number"/>">
		     					<div class="post_header">
		     						<div class="post_details"><b><s:property value="profile.Name" /></b> wrote <span class="grey"><s:date name="createdDate" format=" 'on' dd MMM yyyy 'at' h:mm a"/>:</span></div>
		     						<div class="post_actions">
		     						
		     						<a href='#' onclick="return pop_upForFlagComment(event,'<s:property value='id'/>','','','confirm_delete',[20,20,'negoffset_mouse'])">
		     						<img width="14" height="14" src="${ctx}//styles/default/images/icon_flag.png">
		     						</a>
		     						
		     						 <a href="${ctx}/myGroups/deleteGroupDiscussions.action?groupDiscussions.id=<s:property value="id"/>"> 
		     					 <img width="14" height="14" src="${ctx}/styles/default/images/mobc_prof_action_btn-redx.gif">  </a> </div>
		     					</div>
								<div class="post_block">

									<div class="post_sidebar">
									<s:if test="profile.picture!=null">
		     							<img src="<s:property value="profile.resizedMinPicture"/>" alt="N/A" align="top"/>
		     						</s:if>
		     						<s:else>
		     							<img src="${ctx}/styles/default/images/mobc_default_profile_pic.jpg" alt="N/A" align="top" width="55" height="50"/>
		     						</s:else>
									
		     						</div>
									<div class="post_content" name="taskDescrptionDiv"  id="taskDescrptionDiv_<s:property value="#row.count" />" >
										<s:property value="discussions" /><br>
									</div>
								</div>
							</div>
						</s:iterator>
							<div class="grey_line"></div>
							
						</div>
						<div class="topic_paginator"><div id="paginator">
	               
			                  	<span id="prev" style="cursor: pointer;" class="pagelink"> « Prev </span>
			                  	<span id="sep">|</span>  
			                  	<span id="next" style="cursor: pointer;" class="pagelink"> Next » </span>
			                  	<span id="count" class="pagelink"></span>
		          
	        	</div></div>
					</div></div></div></div></div>
				</div>
	 		</div>
		</div>

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
								              id="selectedFlagTypeProfileId" >
								    </s:select>
					                <span style="font-size: 12px;font-weight: bold;">Comment:</span>
					                <textarea rows="5" id="flagComment" style="width:200px;"></textarea>
					                 <input type="hidden" value="Threads" id="profileType"/>
					                <a href="#" onclick="return hide_pop_up('confirm_delete')"><img src="${ctx}/styles/default/images/mobc_Cancel.png" align="left" width="77" height="20" /></a>
					               <a class="second_a" href="#" onclick="storeFlagcommentForThreads()"><img src="${ctx}/styles/default/images/mobc_Submit.png" align="right" width="77" height="20" /></a>
					             </form>   
					            </div>
					             <span class="clear-both"><!-- 2 for IE6 --></span>
					        </div>
				    </div>
			</div>
		
		
	
