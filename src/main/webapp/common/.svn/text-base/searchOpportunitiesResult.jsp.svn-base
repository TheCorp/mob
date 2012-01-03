<%@ include file="/common/taglib.jsp"%>
<style>  
.cust tr.odd {background-color:"#FFFFFF";}   
.cust tr.even {background-color:#CCCCCC;}   
</style>  

<div id="bc_main_outer">
	<div id="bc_main_mid">
	<div class="bc_main_inner clear-both">
	<div id="outerlgb"><div class="lgrey_box"><div class="lgrey_box-r"><div class="lgrey_box-b">
		  				<div class="red_bar"><div class="red_bar-l"><div class="red_bar-r">
					<h1>Advanced Job Search</h1>
				</div></div></div>
				<!--  
				<form id="adv_search_form" class="dbl_search_form" action="${ctx}/employee/getOpportunitiesFromSearch.action">
				-->
				<form id="adv_search_form" class="dbl_search_form" action="${ctx}/search/getOpportunitiesFromSearch.action">
					<div class="col leftsearch">
						<h2 class="greygrad_header">Required Search Criteria</h2>
						<div class="form_cont">
							<div class="row">
								<h4 class="red">Keywords</h4>
								<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r"><input type="text" class="txt" name="position"  /></span></span></span>
							</div>
							<div class="row">
								<h4 class="red">Locations</h4>
								<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r"><input type="text" class="txt" name="location" /></span></span></span>
							</div>
							<div class="row">
								<div class="col left">
									<h4 class="red">Skills</h4>
									<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r"><input type="text" class="txt" id="skillsid" name="skillsNeeded" /></span></span></span>
									<input type="hidden" id="searchList" name="skillNames"/>
									<div class="skills_to_add_list" >
										<h6>Currently Searching for...</h6>
										<p id="skills_to_add_list"></p>
									</div>
								</div>
								<div class="col">
								
                                <img class="add_skill"  id="add_btn" src="${ctx}/styles/default/images/add_entry_btn-up.png" onclick="addSkills()" />
								</div>
							</div>
							<div class="row search_btn_cont">
								<input type="image" value="Search" src="${ctx}/styles/default/images/red_search_btn-up.png" />
							</div>
						</div>
					</div>
					<div class="col rightsearch">
						<h2 class="greygrad_header">Additional Fields</h2>
						<div class="form_cont">
							<div class="row">
								<h4>Keywords</h4>
								<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r"><input type="text" class="txt" name="additionalKeyword" /></span></span></span>
							</div>
							<div class="row">
								<div class="col left">
									<h4>Skills</h4>
									<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r"><input type="text" id="additionalSkillsId" class="txt" name="skills2" /></span></span></span>
									<input type="hidden" id="searchSkillsList" name="additionalSkillNames"/>
									<div class="skills_to_add_list">
										<h6>Currently Searching for...</h6>
										<p id="additionalSkills_to_add_list"></p>
									</div>
									<!--<div class="ajax_box" id="ajbx_skills" style="display:block;">
										<div class="entry"><a href="#"><strong>De</strong>velopment (Architecture)</a></div>
										<div class="entry"><a href="#"><strong>De</strong>velopment</a></div>
										<div class="entry"><a href="#"><strong>De</strong>sign (Accounting)</a></div>
										<div class="entry"><a href="#">Motion <strong>De</strong>sign</a></div>
										<div class="entry"><a href="#"><strong>De</strong>ntal</a></div>
										<div class="add_one"><a href="">Add Another Skill...</a></div>
									</div>-->
								</div>
								<div class="col">
									<img class="add_skill"  src="${ctx}/styles/default/images/add_entry_btn-up.png" onclick="addAdditionalSkills()" />
									
								</div>
							</div>
						</div>
					</div>
				</form>
				<br class="clear-both" /><br />
				<s:if test="oppotunityList.size!=0">
				 <form id="advanced_search" name="form1" method="post" action="jobSearch.action" >
				<div class="r_sel_prof">
					<div class="sel_prof_headers">
						<div class="sel_prof_col spc_optitle"><h3>Opportunity Title</h3></div>
						<div class="sel_prof_col spc_resultsmatched"><h3>Results Matched</h3></div>
						<div class="sel_prof_col spc_company"><h3>Company</h3></div>
						<div class="sel_prof_col spc_location"><h3>Location</h3></div>
						<div class="sel_prof_col spc_dateposted"><h3>Date Posted</h3></div>
					</div>
					<s:iterator value="oppotunityList" status="rowstatus">
					<s:url id="view" action="../search/viewOpportunityFromSearch"><s:param name="opportunityid" value="id"/>
								</s:url>
					<div class="<s:if test="#rowstatus.odd == true">sel_prof_row</s:if><s:else>sel_prof_row noshade</s:else>">
						<div class="sel_prof_col spc_optitle"><s:a href="%{view}"> <s:property value="title"/></s:a></div>
						<div class="sel_prof_col spc_resultsmatched"><s:property value="skillsNeeded"/></div>
						<div class="sel_prof_col spc_company"><s:property value="str_job_name"/></div>
						<div class="sel_prof_col spc_location"><s:property value="str_location"/></div>
						<div class="sel_prof_col spc_dateposted"><s:property value="createdDate"/></div>
					</div>
					</s:iterator>
				</div>
				</form>
				</s:if>
				<s:if test="oppotunityList.size==0">No results found</s:if>
				<br /><br />
			</div></div></div></div>
		</div>
	</div>
</div>

<br class="clear-both" /><!--#include file="mobc_footer.html"-->

<br />

<script src="<c:url value='/styles/default/js/jobSearchCriteria.js'/>" type="text/javascript"></script>
