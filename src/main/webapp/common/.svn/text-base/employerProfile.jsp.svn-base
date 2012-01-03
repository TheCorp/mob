<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<div id="bc_home">

<div id="bc_main_outer">
	<div id="bc_main_mid">
		<div id="bc_profile_outernav"><div class="outer_page_nav">
		<ul>
		<li class="active"><s:a href="${ctx}/common/viewEmployerFromSearch.action">Company Profile</s:a>
		<li class="align-right">
		<s:url id="viewEmployerBriefcase" action="viewEmployerBriefcaseFromSearch.action">
	      <s:param name="employer.id" value="viewEmployer.id"/>
	    </s:url>
		<s:a href="%{viewEmployerBriefcase}">View Briefcase</s:a></li>
		</ul></div></div>

		<div class="bc_main_inner clear-both">
			<div id="bc_profile_sec">
				<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
					<div id="bc_profile_pic_spot-c">
						<div class="bc_pps_pic">
							<div id="bc_profile_pic"><img src="${ctx}/styles/default/images/mobc_default_cprofile_pic.jpg" alt="Jason Cosby Joseph" /></div>
						</div>
					</div>
					<div id="bc_profile_info">

						<h2 id="bc_profile_name-c"><s:property value="viewEmployerorganizationName"/></h2>
						<p class="bc_pi_details"><s:property value="viewEmployer.orgInfo" /></p>
					</div>
					<div id="bc_profile_cmoreinfo">
						<p><s:property value="viewEmployer.culture" /></p>
                        <h3>Other Information</h3>
						<p><s:property value="viewEmployer.additionalInfo" /></p>
					</div>
					<br class="clear-both" />
				</div></div></div></div></div>
			</div>
			<div id="bc_opportunities">
			
				<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">

					<div class="bc_greytbar_lg">
						<h3 class="bc_gtb_title">Opportunities at <s:property value="viewEmployer.organizationName"/>(All Groups)</h3>
					</div>
					
					
				<s:set name="id" value="opportunityDetailsList" scope="request"/> 
				<authz:authorize ifAllGranted="ROLE_EMPLOYEE">                                       
	            <display:table  name="${id}"             id="id"
	                            pagesize="3"             sort="list" 
	                            defaultsort="1" requestURI="" 
	                            decorator="com.mob.util.ViewEmployerProfileFromSearch">
		        <display:column  property="opportunitiesForEmployee" title="" sortable="true" sortName="str_job_name"/>
		        <display:setProperty name="paging.banner.placement" value="bottom"></display:setProperty>  
		        <display:setProperty name="paging.banner.some_items_found" value="<div id=bc_op_results_menu1>{0} Results: </div>"/>                    
		        <display:setProperty name="paging.banner.full" value="<div id=bc_op_results_menu><a href={1}></a> <a href={2}></a> {0} <a href={3}> Next</a> <a href={4}></a></div>"/>
                <display:setProperty name="paging.banner.first" value="<div id=bc_op_results_menu><a href={1}></a> <a href={2}></a> {0} <a href={3}> Next</a> <a href={4}></a></div>"/>
                <display:setProperty name="paging.banner.last" value="<div id=bc_op_results_menu><a href={1}></a> <a href={2}></a> {0} <a href={3}> Next</a> <a href={4}></a></div>"/>
	            </display:table>
	             </authz:authorize>
					
				<authz:authorize ifAllGranted="ROLE_EMPLOYER">                                      
	            <display:table  name="${id}"             id="id"
	                            pagesize="3"             sort="list" 
	                            defaultsort="1" requestURI="" 
	                            decorator="com.mob.util.ViewEmployerProfileFromSearch">
		        <display:column  property="opportunitiesForEmployer" title="" sortable="true" sortName="str_job_name"/>
		        <display:setProperty name="paging.banner.placement" value="bottom"></display:setProperty>  
		        <display:setProperty name="paging.banner.some_items_found" value="<div id=bc_op_results_menu1>{0} Results: </div>"/>                    
		        <display:setProperty name="paging.banner.full" value="<div id=bc_op_results_menu><a href={1}></a> <a href={2}></a> {0} <a href={3}> Next</a> <a href={4}></a></div>"/>
                <display:setProperty name="paging.banner.first" value="<div id=bc_op_results_menu><a href={1}></a> <a href={2}></a> {0} <a href={3}> Next</a> <a href={4}></a></div>"/>
                <display:setProperty name="paging.banner.last" value="<div id=bc_op_results_menu><a href={1}></a> <a href={2}></a> {0} <a href={3}> Next</a> <a href={4}></a></div>"/>
	            </display:table>
	            </authz:authorize>
					
					
					<!--<form id="search_opps" class="grn_btn_left" action="" onsubmit="return false">
						<div class="col_l"><input name="search" type="text" class="txt" value="type something..." onfocus="inputOnFocus(this)" /></div>
						<div class="col_r"><input type="image" value="Submit" src="${ctx}/styles/default/images/mobc_grnsearchbtn-up.png" /></div>
					</form>

					-->
					<br style="clear:both" />
				</div></div></div></div></div>
			</div>
			<div id="bc_groups">
				<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
					<div class="bc_greytbar_lg">
						<!--<h3 class="bc_gtb_title">All Groups in Microsoft Corporation</h3>
					-->
					<h3 class="bc_gtb_title">Profile</h3>
					</div>
					
					
					<div class="bc_g_entry">
						<div class="bcge_desc">
						<s:iterator value="employersProfileList">
						  <s:url id="view" action="viewEmployerProfile">
				    	  <s:param name="profile.id" value="id"/>
				    	  <s:param name="employerid"  value="viewEmployer.id"/>
						  </s:url>
						  <h4><s:a href="%{view}"><s:property value="name"/></s:a></h4>
							<p><s:property value="biography"/></p>
							<p><s:property value="others"/></p>
							<div class="num_members"> 
						</div>
						<br/>
						</s:iterator>
						
						</div>
					</div>

					
					<!--<form id="search_groups" class="grn_btn_left" action="" method="" onsubmit="return false">
						<div class="col_l"><input name="search" type="text" class="txt" value="type something..." onfocus="inputOnFocus(this)" /></div>
						<div class="col_r"><input type="image" value="Submit" src="${ctx}/styles/default/images/mobc_grnsearchbtn-up.png" /></div>
					</form>
					-->
					<br style="clear:both" />
				</div></div></div></div></div>
			</div>
			<br class="clear-both" />
		</div>

	</div>
</div>
</div>



<div id="apply_for_position" class="popup1"><div class="popup1-content">
	<div class="pu_row">
		<h3>Microsoft Corporation</h3>
		<form>
		
			<h5>Select profile from drop down list</h5>
			<s:select list="employeeProfilesListForSearch" 
			          headerKey="1" 
			          headerValue="Please Select" 
			          listValue="name" 
			          listKey="id" 
			          id="interestedEmployeeid">
			</s:select>
			<div class="afp_actions"><s:a href="#" onclick="applyforopportunity('apply_for_position');">Apply</s:a> | <a href="#" onclick="return applyPosition_hide_pop_up('apply_for_position')">Close</a></div>
		</form>
		<span class="clear-both"><!-- for IE6 --></span>
	</div>

</div></div>

<div id="markasfavorite" class="popup1"><div class="popup1-content">
	<div class="pu_row">
		<h3>Microsoft Corporation</h3>
		<form>
			<h5>Select profile from drop down list</h5>
			<s:select list="employeeProfilesListForSearch" 
			          headerKey="1" 
			          headerValue="Please Select" 
			          listValue="name" 
			          listKey="id" 
			          id="bookmarkedEmployeeid">
			</s:select>
				<div class="afp_actions"><s:a href="#" onclick="markasFavorite('markasfavorite');">Apply</s:a> | <a href="#" onclick="return markasfavorite_hide_pop_up('markasfavorite')">Close</a></div>
		</form>
		<span class="clear-both"><!-- for IE6 --></span>
	</div>

</div></div>


<script src="<c:url value='/styles/default/js/ApplayForPositionFromSearch.js'/>" type="text/javascript">
</script> 
<script src="<c:url value='/styles/default/js/markasFavoriteFromSearch.js'/>" type="text/javascript">
</script>









