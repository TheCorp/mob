<%@ include file="/common/taglib.jsp"%>
<style>  
.cust tr.odd {background-color:"#FFFFFF";}   
.cust tr.even {background-color:#CCCCCC;}   
</style>  

<div id="bc_main_outer">
	<div id="bc_main_mid">

		<div class="bc_main_inner clear-both r_sel_prof">
			<div id="outerlgb"><div class="lgrey_box"><div class="lgrey_box-r"><div class="lgrey_box-b">
				<div class="red_bar"><div class="red_bar-l"><div class="red_bar-r">
					<h1>Opportunity Search</h1> 
				</div></div></div>
				<div class="lgrey_simple select_profile"><div class="lgrey_simple-b"><div class="lgrey_simple-l"><div class="lgrey_simple-r"><div class="lgrey_simple-tl"><div class="lgrey_simple-tr"><div class="lgrey_simple-bl"><div class="lgrey_simple-content">
					<h2><a href="${ctx}/search/advancedOpportunitySearch.action">Advanced Search</a></h2>
					<s:if test="opportunityList.size!=0">
					<div class="sel_prof_headers">
						<div class="sel_prof_col spc_jname" style="width:158px"><h3><b>Opportunity Title</b></h3></div>
						<div class="sel_prof_col spc_ptitle" ><h3><b>Results Matched</b></h3></div>
						<div class="sel_prof_col spc_empinted"><h3><b>Company</b></h3></div>
						<div class="sel_prof_col spc_empbooked" style="width:190px"><h3><b>Location</b></h3></div>
						<div class="sel_prof_col spc_empall"><h3><b>Date Posted</b></h3></div>

					</div>
					<s:iterator value="opportunityList" status="rowstatus">
						<div class="<s:if test="#rowstatus.odd == true">sel_prof_row</s:if><s:else>sel_prof_row noshade</s:else>">
						<div class="sel_prof_col spc_jname" style="width:158px">
							<a href="${ctx}/search/viewOpportunityFromSearch.action?opportunityid=<s:property value="id"/>"> <s:property value="title"/>
							</a>
						</div>
						<div class="sel_prof_col spc_ptitle"><s:property value="skillsNeeded"/></div>
						<div class="sel_prof_col spc_empinted"><s:property value="profileOwner.profileOwner.organizationName"/></div>

						<div class="sel_prof_col spc_empbooked" style="width:190px"><s:property value="str_location"/></div>
						<div class="sel_prof_col spc_empall"><s:date name="createdDate" format="MM/dd/yyyy"/></div>
					</div>
					</s:iterator>
					</s:if>
					
					
				<s:if test="opportunityList.size==0">No results found</s:if>
				</div></div></div></div></div></div></div></div>

			</div></div></div></div>
		</div>
	</div>
	
	
</div>



<br />


<script src="<c:url value='/styles/default/js/jobSearchCriteria.js'/>" type="text/javascript"></script>
