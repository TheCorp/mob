<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<div id="bc_main_outer">
	<div id="bc_main_mid">

		<div class="bc_main_inner clear-both r_sel_prof">
			<div id="outerlgb"><div class="lgrey_box"><div class="lgrey_box-r"><div class="lgrey_box-b">
				<div class="red_bar"><div class="red_bar-l"><div class="red_bar-r">
					<h1>Feedback for <s:property value="profile.name"/> </h1>
				</div></div></div>
				<div class="lgrey_simple select_profile"><div class="lgrey_simple-b"><div class="lgrey_simple-l"><div class="lgrey_simple-r"><div class="lgrey_simple-tl"><div class="lgrey_simple-tr"><div class="lgrey_simple-bl"><div class="lgrey_simple-content">
					<s:if test="listOfFeedbacks.size!=0">
					<h2 class="prof_sub_header">Feedback &nbsp;&nbsp; <s:property value="possitiveSize"/></h2>

					
					<div class="feedback_container">
						<div class="sel_prof_headers">
							<!--<div class="sel_prof_col spc_feedback"><h3>Feedback</h3></div>-->
							<div class="sel_prof_col spc_comment"><h3>Comments</h3></div>
							<div class="sel_prof_col spc_username"><h3>ProfileName</h3></div>
						</div>
						
						<s:iterator value="listOfFeedbacks" status="rowstatus">
						
						<div class="<s:if test="#rowstatus.odd == true">sel_prof_row</s:if><s:else>sel_prof_row noshade</s:else>">
							<div class="sel_prof_col spc_comment"><s:property value="comment"/></div>
							<div class="sel_prof_col spc_username"><s:property value="feedbackProviderName"/></div>
						</div>
						
						<!--<div class="<s:if test="#rowstatus.odd == true">sel_prof_row</s:if><s:else>sel_prof_row noshade</s:else>">

							<div class="sel_prof_col spc_feedback">
							
							<s:if test="feedbackType=='Positive'">
							<em class="pos"><s:property value="feedbackType"/></em>
							</s:if>
							<s:else>
							<em class="neg"><s:property value="feedbackType"/></em>
							</s:else>
							</div>
							<div class="sel_prof_col spc_comment"><s:property value="comment"/></div>
							<div class="sel_prof_col spc_username"><s:property value="feedbackProviderName"/></div>
						</div>
						--></s:iterator>
						
					</div>
					</s:if>
					<s:if test="listOfFeedbacks.size==0">No Feedback</s:if>
				</div></div></div></div></div></div></div></div>
			</div></div></div></div>
		</div>
	</div>
</div>
