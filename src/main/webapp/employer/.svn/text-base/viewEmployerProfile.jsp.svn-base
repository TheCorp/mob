<%@ include file="/common/taglib.jsp"%>
<div id="bc_home">
<div id="bc_main_outer">
	<div id="bc_main_mid">
		<div id="bc_profile_outernav">
		<div class="outer_page_nav">
		<ul>
		         <li class="active">		         
		          <a href="${ctx}/employer/loademployerprofile.action?profile.id=<s:property value="profile.id"/>">View Profile</a>
		         <li>
		         <a href="${ctx}/employer/setUpForInsertOrUpdate.action?profile.id=<s:property value="profile.id"/>">Edit Profile</a>
		         </li>
		         <li class="align-right">
		         <a href="${ctx}/employer/privacySettingsForEmployer.action?profile.id=<s:property value="profile.id"/>">Privacy Settings</a>
		         </li>
		</ul>
		</div>
		</div>
		<div class="bc_main_inner clear-both">
			<div id="bc_profile_sec">
				<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
					<div id="bc_profile_pic_spot-c">
						<div class="bc_pps_pic">
							<div id="bc_profile_pic">
							<s:if test="profile.picture!=null">
							 <a rel="ibox" href='${ctx}/<s:property value="profile.picture"/>'>
								 <img align="top" src="${ctx}<s:property value="profile.picture"/>" width="130" height="130" alt="N/A"/>
								 </a>
								 </s:if>
								 <s:else>
								<img src="${ctx}/styles/default/images/mobc_default_cprofile_pic.jpg" alt="N/A"/>
							</s:else>
							</div>
						</div>
					</div>
					<div id="bc_profile_info">
						<h2 id="bc_profile_name-c"><s:property value="user.organizationName"/></h2>
						
						<p class="bc_pi_details">
						<s:property value="user.orgInfo" />
                       </p>
					</div>
					<div id="bc_profile_cmoreinfo">
						<h3>Culture</h3>
						<p><s:property value="user.culture" /></p>
                        <h3>Other Information</h3>
						<p><s:property value="user.additionalInfo" /></p>
						</div>
					<br class="clear-both" />
				</div></div></div></div></div>
			</div>
			<div id="bc_opportunities">
				<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">


					<div class="bc_greytbar_lg">
						<h3 class="bc_gtb_title">Opportunities at <s:property value="profile.name"/> (Profile)</h3>
					</div>
					
						
					
               
                <s:set name="id" value="opportunityDetailsList" scope="request"/>                                      
	            <display:table  name="${id}"             id="id"
	                            pagesize="3"             sort="list" 
	                            defaultsort="1" requestURI="" 
	                            decorator="com.mob.util.EmployerProfileDecorator">
	                            	                
		        <display:column property="opportunities" title="" sortable="true" sortName="str_job_name"/>
		        <display:setProperty name="paging.banner.placement" value="bottom"></display:setProperty>  
		        <display:setProperty name="paging.banner.some_items_found" value="<div id=bc_op_results_menu1>{0} Results: </div>"/>                    
		        <display:setProperty name="paging.banner.full" value="<div id=bc_op_results_menu><a href={1}></a> <a href={2}></a> {0} <a href={3}> Next</a> <a href={4}></a></div>"/>
                <display:setProperty name="paging.banner.first" value="<div id=bc_op_results_menu><a href={1}></a> <a href={2}></a> {0} <a href={3}> Next</a> <a href={4}></a></div>"/>
                <display:setProperty name="paging.banner.last" value="<div id=bc_op_results_menu><a href={1}></a> <a href={2}></a> {0} <a href={3}> Next</a> <a href={4}></a></div>"/>
	            </display:table>
					
				<br style="clear:both" />
				</div></div></div></div></div>
			</div>
			<br class="clear-both" />
		</div>

	</div>
</div>
</div>

 <script src="<c:url value='/styles/default/js/ibox.js'/>" type="text/javascript"></script>
 <script type="text/javascript" src="<c:url value='/styles/default/js/viewEmployerOpportunities.js'/>"></script> 


