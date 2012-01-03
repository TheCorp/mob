<%@ include file="/common/taglib.jsp"%>

<div id="bc_main_outer">
	<div id="bc_main_mid">
		<div id="bc_profile_outernav"><div class="outer_page_nav"><ul><li class="active"><a href="">Company Profile</a></li><li><a href="">Edit Company Profile</a></li></ul></div></div>

		<div class="bc_main_inner clear-both">
			<div id="bc_profile_sec">
				<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
					<div id="bc_profile_pic_spot-c">
						<div class="bc_pps_pic">
							<div id="bc_profile_pic"><img src="${ctx}/styles/default/images/mobc_default_cprofile_pic.jpg" alt="Jason Cosby Joseph" /></div>
						</div>
					</div>
					<div id="bc_profile_info">

						<h2 id="bc_profile_name-c"><s:property value="employer.organizationName"/></h2>
						
						<p class="bc_pi_details">Endeavour combines deep Banking and Finance domain knowledge with technology expertise to design and develop custom software on the Calypso solutions platform.</p>
					</div>
					<div id="bc_profile_cmoreinfo">
						<h3>Culture</h3>
						<s:iterator value="profilelist" >
						<p><s:property value="culture" />,</p>
                        </s:iterator>
						<h3>Other Information</h3>
						<s:iterator value="profilelist" >
						<p><s:property value="others" /></p>
						</s:iterator>
					</div>
					<br class="clear-both" />
				</div></div></div></div></div>
			</div>
			<div id="bc_editprof">
				<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">

					<div class="bc_greytbar_lg">
						<h3 class="bc_gtb_title">Edit Main Profile</h3>
					</div>
					<form id="editEmpForm" onsubmit="return false">
						<div class="frow">
							<div class="f-lt">
								<h5>Email</h5>
							</div>

							<div class="f-rt">
								<div class="acc_dec_r"><a href=""><img src="${ctx}/styles/default/images/grncheck-onwhite.jpg" alt="Accept" />Accept</a>&nbsp;&nbsp;<a href=""><img src="${ctx}/styles/default/images/exp_entry-remove.gif" alt="Cancel" />Cancel</a></div>
								<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r"><input name="employer.email" value=<s:property value="employer.email"/> /></span></span></span>
							</div>
						</div>
						<br style="clear: both" />
						<div class="frow">
							<div class="f-lt">

								<h5>Address</h5>
							</div>
							<div class="f-rt">
								<div id="address">
								<div class="address_entry"><s:property value="employer.address"/> <s:property value="employer.location"/></div><div class="edit_r"><a href=""><img src="${ctx}/styles/default/images/exp_entry-edit.gif" title="Edit" alt="Edit" />Edit</a></div>
			                     	 <s:property value="employer.state"/>
								</div>
							</div>
						</div>
						<h4 class="changepass">Change Current Password</h4>
						<div class="frow">
							<div class="f-lt">
								<h6>New</h6>
							</div>

							<div class="f-rt">
								<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r"><input type="password" class="txt" name="new" /></span></span></span>
							</div>
						</div>
						<div class="frow">
							<div class="f-lt">
								<h6>Verify New</h6>
							</div>

							<div class="f-rt">
								<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r"><input type="password" class="txt" name="verify_new" /></span></span></span>
							</div>
						</div>
						<div class="frow">
							<div class="f-lt">
								<h6>Enter Old Password</h6>
							</div>
							<div class="f-rt">
								<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r"><input type="password" class="txt" name="old"  value=""/></span></span></span>
							</div>
						</div>
						
						<div class="frow">
							<div class="f-lt">&nbsp;</div>
							<div class="f-rt">
								<input type="image" value="Change Password" src="${ctx}/styles/default/images/mobc_changepass_btn-up.png" />
							</div>

						</div>
					</form>
					<br style="clear:both" />
				</div></div></div></div></div>
			</div>
			<div id="bc_subprof">
				<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
					<div class="bc_greytbar_lg">
						<h4 class="bc_gtb_title rt"><a href="">Create New Profile</a></h4><h3 class="bc_gtb_title">Sub-Profiles</h3>

					</div>
					
				<s:iterator value="profilelist" >
					<div class="bc_sp_entry">
					
					
					<s:url id="delete" action="deleteProfile">
					<s:param name="profile.id" value="id"/>
					</s:url>
					<div class="delete_r">
					<s:a href="%{delete}">
					<img src="${ctx}/styles/default/images/exp_entry-remove.gif" title="Delete" alt="Delete"/>Delete</s:a>
					</div>
					<h5><s:property value="name"/> </h5>
					<div class="edit_r"><a href=""><img src="${ctx}/styles/default/images/exp_entry-edit.gif" title="Edit" alt="Edit" />Edit</a>
					<!-- added for creating Groups -->
					<s:url id="group" action="createEmployerGroup">
					<s:param name="profile.id" value="id"/>
					</s:url>
					<s:a href="%{group}">Group <s:property value="id"/></s:a>
					<!-- added for creating opportunity -->
					<s:url id="opp" action="employerOpportunity">
					<s:param name="profile.id" value="id"/>
					</s:url>
					
					<s:a href="%{opp}">Create Opportunity </s:a>
					
					</div>
					<p><s:property value="biography"/></p>
					</div>
				</s:iterator>
					</div>
					<br style="clear:both" />
				</div></div></div></div></div>
			
			<br class="clear-both" />
		</div>
	</div>
</div>

<br class="clear-both" />


