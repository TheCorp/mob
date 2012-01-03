<%@ include file="/common/taglib.jsp"%>

<div id="edit_opportunities">
<div id="select_profile_to_edit">
<div id="bc_main_outer">
<div id="bc_main_mid">

<div class="bc_main_inner clear-both">
<div id="outerlgb">
<div class="lgrey_box">
<div class="lgrey_box-r">
<div class="lgrey_box-b">
<div class="red_bar">

<h1>All opportunities </h1>
</div>
<div class="lgrey_simple select_profile">
<div class="lgrey_simple-b">
<div class="lgrey_simple-l">
<div class="lgrey_simple-r">
<div class="lgrey_simple-tl">
<div class="lgrey_simple-tr">
<div class="lgrey_simple-bl">
<div class="lgrey_simple-content">
<h2>Your Opportunities</h2>
<s:iterator value="opportunityDetails">
	<div class="sel_prof_row">
	<div class="sel_prof_col spc_name">
	<!--
	
	   <s:url id="viewOpportunity" action="viewEmployerOwnOpportunities.action">
         <s:param name="Opportunityid" value="opportunity.id"  />
       </s:url>
	   <s:a href="%{viewOpportunity}"><s:property value="opportunity.title" /></s:a>
	   -->
	 <a href="${ctx}/employer/viewEmployerOwnOpportunities.action?Opportunityid=<s:property value="opportunity.id"/>"><s:property value="opportunity.title" /></a>
	   <br><br></div>
     <div class="sel_prof_col spc_name">
        <s:property value="opportunity.profileOwner.name"></s:property><br><br></div>
        <!--   
         <s:url id="loadApplicants" action="loadApplicants">
            <s:param name="profile.id" value="%{profile.id}"  />
            <s:param name="opportunity.id" value="opportunity.id"  />
          </s:url>
          <s:url id="loadBookmarkers" action="loadBookmarkers">
             <s:param name="profile.id" value="%{profile.id}"  />
           <s:param name="opportunity.id" value="opportunity.id"  />
        </s:url>
        
          
          -->
          <div class="sel_prof_col spc_views">
          <a href="${ctx}/employer/loadApplicants.action?opportunity.id=<s:property value="opportunity.id"/>">
          <s:property value="interests" />&nbsp;Applications
          </a>
          </div>
          
	     
	       <div class="sel_prof_col spc_items">
	       <a href="${ctx}/employer/loadBookmarkers.action?opportunity.id=<s:property value="opportunity.id"/>">
	       <s:property value="bookmarks" />&nbsp;Marked as favorites
	       </a>
	       </div>
	       
	     
			<!--
			<s:url id="editOpportunity" action="loadEmployerOpprotunity">
		        <s:param name="profile.id" value="%{profile.id}"  />
		        <s:param name="opportunity.id" value="opportunity.id"  />
		    </s:url>
		    <s:url id="deleteOpportunity" action="deleteEmployeerOpportunity">
		        <s:param name="profile.id" value="%{profile.id}"  />
		        <s:param name="opportunity.id" value="opportunity.id"  />
		    </s:url>
		    
		     -->
		     <div class="sel_prof_col spc_actions" style="margin-left:170px;width: 53px;">
			
			 <a href="${ctx}/employer/loadEmployerOpprotunity.action?opportunity.id=<s:property value="opportunity.id"/>">
			 <img src="${ctx}/styles/default/images/exp_entry-edit.gif" alt="Edit"/>
			 </a>
			
			
			  <a href="${ctx}/employer/deleteEmployeerOpportunity.action?opportunity.id=<s:property value="opportunity.id"/>">
			 <img src="${ctx}/styles/default/images/mobc_redx.gif" alt="Remove" />
			 </a>
			
			</div>
	</div>

</s:iterator>
<div id="add_profile">
 <s:url id="addAnotherOpportunity" action="employerOpportunity">
  <s:param name="profileId" value="profileId"/>
 </s:url>
<s:a href="%{addAnotherOpportunity}">

<img src="${ctx}/styles/default/images/add_another_opportunity.png" alt="Add another opportunity" />
</s:a>

 
</div>
<%--<div id="add_profile">--%>
<%--<s:a href="${ctx}/employer/employerProfile.action">--%>
	<%--<img src="${ctx}/styles/default/images/add_another_profile.png" alt="Add another profile" />--%>
<%--</s:a>--%>
<%--</div>--%>
<%--<div id="save_profile_changes">--%>
 <%--<!--    <img	src="${ctx}/styles/default/images/save_profile_changes.png" alt="Save" /> -->--%>
<%--</div>--%>

</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
