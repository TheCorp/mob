<%@ include file="/common/taglib.jsp" %>
	<div id="bc_main_outer">
	<style>
	.closetxt
	{
	  margin-bottom:50px;
	}
	</style>
<script type="text/javascript" src="<c:url value='/styles/default/js/groups/grouppagination.js'/>"></script>
<script type="text/javascript">

    $(document).ready(function() {
       showHideGroupData();
       $("#groupdiscussionId").val("");
       
    });
</script>
	<div id="bc_main_outer">
		<div id="bc_main_mid" style="height: 600px;">
			<div id="bc_profile_outernav">
	   			<div class="outer_page_nav">
					<ul>
						<li class="active">
			   				<a href="${ctx}/myGroups/listOfAllTopics.action">Discussions</a>
			   			</li>
			   			<li>
							<a href="${ctx}/myGroups/viewGroupsProfile.action?group.id=<s:property value="group.id"/>&profile.id=<s:property value="profile.id"/>">View Group</a>
			   			</li>
					</ul>
				</div>
			</div>
			<div class="bc_main_inner clear-both">
	   			<div id="bc_view_discussions">
					<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
						<div class="bc_greytbar">
							<div id="bc_viewall-briefcase" class="bc_gtb_viewall">
						<a href='#' onclick="return pop_upForCreateTopic(event,'','','','confirm_delete',['410',300])">
						<img src="${ctx}/styles/default/images/btn_newtopic.png"></a>
	      					</div>
	      					<h3 class="bc_gtb_title">Discussions (Displaying topics <span id="countId" class="pagelink"></span>)</h3>
	     				</div>
	     				<div class="scroll_content">
	     					<div class="bc_scroll_section">
	     					<input type="hidden" id="profileNameId" value='<s:property value="existProfile.name"/>'>
	     					<input type="hidden" value="<s:property value="group.id"/>" id="groupId" name="grpId">
	     						<input type="hidden" value="<s:property value="profile.id"/>" id="profileId" name="profileId">
		      					<table width="100%" cellspacing="0" cellpadding="5">
									<tbody>
										<tr class="sec_heading">
											<td>Topic</td>
											<td width="200px">Author</td>
											<td width="40px">Replies</td>
										</tr>
										</tbody>
								</table>
								<div id="addtopicsList">						
												</div>
									<s:iterator value="groupTopicsList" status="row">
												<s:set name="number" value="(#row.count-1)/10"/>
												
										<div class="post number<s:property value="#number"/>">
											
											<div class="<s:if test="#row.odd== true">odd</s:if><s:else>even</s:else>">
											&nbsp;&nbsp;<a href="${ctx}/myGroups/postTopics.action?group.id=<s:property value="group.id"/>&topic.id=<s:property value="id"/>&profile.id=<s:property value="profile.id"/>"><s:property value="topic"/></a><br>
											<s:if test="discussionList.size()!=0">
												<span class="grey">&nbsp;&nbsp;Latest Post by <s:property value="latestDiscussion.profile.name"/> on <s:date name="latestDiscussionDate.createdDate" format="dd-MM-yyyy 'at' hh:mm a"/></span>
												
												</s:if> 
												 <s:else>
												 <span class="grey">&nbsp;&nbsp;No Posts in this Topic</span>
												  </s:else>
											</div>
											<div style="margin-left: 680px;margin-top:-22px" class="<s:if test="#row.odd== true">odd</s:if><s:else>even</s:else>">
											<div width="200px"><s:property value="profile.name"/><br>
												<span class="grey">Created on <s:date name="topics.createdDate" format="dd-MM-yyyy 'at' hh:mm a"/></span>
											</div>
											
											<div class="<s:if test="#row.odd== true">odd</s:if><s:else>even</s:else>"  style="margin-top:-12px;margin-left: 210px"><s:property value="discussionList.size()"/></div>
											</div>
										</div>
										 </s:iterator>
										<div class="discussion_footer" style="height: 20px">
											<div colspan="3" align="right"><div id="paginator">
	               
			                  	<span id="prev" style="cursor: pointer;" class="pagelink"> « Prev </span>
			                  	<span id="sep">|</span>  
			                  	<span id="next" style="cursor: pointer;" class="pagelink"> Next » </span>
			                  	<span id="count" class="pagelink"></span>
		          
	        	                </div></div>
										</div>
	      					</div>
							
						</div>
					</div></div></div></div></div>
				</div>
	 		</div>
		</div>
		</div>
		<br class="clear-both">
	<div id="confirm_delete" class="popup1" style="left: 410px">
         <form>
            <div style="background-color: #FFFFFF;" id="bc_home">
                <div class="post_topic">
	                  <span id="sucees_message" style="display:none; color: green;text-align: center"></span>	
	                 <span style="display:none;color: red;text-align: center" id="topicSpanId">                    
	                 	<h5>Please enter description</h5> </span>
					<div class="post_header"> 
						<span class="post_cancel">
						<a href="#" onclick="return hide_pop_up('confirm_delete')" title="Cancel">Cancel</a></span>
					</div>
					<div class="post_topic_subject"> 
						New Topic:<br>
						<input type="text" class="post_subject" id="topic"> 
					</div>
					<div class="post_content"> 
						Write Something:<br>
						<textarea class="content" id="description"></textarea>
					</div>
					<div class="post_footer">
						<img class="post_topic_btn"  title="Post Now" src="${ctx}/styles/default/images/btn_topic_post.png" onclick="return saveTopics();"><!--
						
					
							<div class="submit_btn"><input type="image" src="${ctx}/styles/default/images/btn_topic_post.png" onclick="return saveTopics()"/></div>
					</div>-->
			   </div>
		   </div>
          </form>   
     </div>
            <span class="clear-both"><!-- for IE6 --></span>
     
	</div>
	<br class="clear-both">
	
	
<script type="text/javascript" src="<c:url value='/styles/default/js/groups/createTopic.js'/>"></script>