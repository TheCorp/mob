<%@ include file="/common/taglib.jsp"%>
<%@ taglib uri="/MOB" prefix="mob"%>
<style>  
.cust tr.odd {background-color:"#FFFFFF";}   
.cust tr.even {background-color:#CCCCCC;}   
</style>  

<div id="bc_main_outer">
	<div id="bc_main_mid">

		<div class="bc_main_inner clear-both r_sel_prof ">
			<div id="outerlgb"><div class="lgrey_box"><div class="lgrey_box-r"><div class="lgrey_box-b">
       
       <div id="bc_profile_outernav"><div class="outer_page_nav centered">
       <ul><li class="active">
		<a href="${ctx}/employee/myOpportunities.action">Opportunities Applied</a></li><li>
		<a href="${ctx}/employee/markAsFavoriteList.action">Marked as Favorite</a></li>
		 <li class="align-right help">
		         <mob:flag key="1" src="../styles/default/images/icon_help.png">
                 </mob:flag>
		        </li>
		</ul>
		</div></div>
		<div class="lgrey_simple select_profile"><div class="lgrey_simple-b"><div class="lgrey_simple-l"><div class="lgrey_simple-r"><div class="lgrey_simple-tl"><div class="lgrey_simple-tr"><div class="lgrey_simple-bl"><div class="lgrey_simple-content">
					<h2></h2>

 <s:if test="allOpportunitiesList.size==0">No results found</s:if>
				  <s:if test="allOpportunitiesList.size!=0">
					<div class="sel_prof_headers">
						<div class="sel_prof_col spc_jname" style="width: 250px"><h3><b>Opportunity Title</b></h3></div>
						<div class="sel_prof_col spc_ptitle"><h3><b>Skills</b></h3></div>
						<div class="sel_prof_col spc_empbooked"><h3><b>Company</b></h3></div>
						<div class="sel_prof_col spc_empall" style="width: 100px"><h3><b>Location</b></h3></div>
							<div class="sel_prof_col spc_empbooked"><h3><b>Date Posted</b></h3></div>

					</div>
					</s:if>
						<s:iterator value="allOpportunitiesList" status="rowstatus">
					<div class="<s:if test="#rowstatus.odd == true">sel_prof_row</s:if><s:else>sel_prof_row noshade</s:else>">
						<div class="sel_prof_col spc_name" style="width:265px ">&nbsp;&nbsp;
						<a href="${ctx}/employee/viewEmployerAppliedOpportunities.action?Opportunityid=<s:property value="id"/>">
						<s:property value="result"/></a></div>
						<div class="sel_prof_col spc_views" style="width:212px "><s:property value="skillsNeeded"/></div>
						<div class="sel_prof_col spc_items" ><s:property value="organizationName"/></div>
						<div class="sel_prof_col spc_messages"><s:property value="str_location"/></div>
						<div class="sel_prof_col spc_notes"  style="width: 100px"><s:property value="createdDate"/></div>
					</div>
					</s:iterator>
					
				</div></div></div></div></div></div></div>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
			


<br class="clear-both" /><!--#include file="mobc_footer.html"-->

<br />

<script src="<c:url value='/styles/default/js/jobSearchCriteria.js'/>" type="text/javascript"></script>
