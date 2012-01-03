<%@ include file="/common/taglib.jsp"%>
<style>
    .img{
      width:383px;
	  height:43px;     
	  border:1;
	  border-top-style:outset;	  
	  border-top-color:#CCCCCC;
	  border-left-style:outset;	  
	  border-left-color:#CCCCCC;	
	  overflow:hidden;
	  font-family: arial, sans-serif;
	  font-size: 12px;
	  }
	  
	  .imgtext{
	  width:140px;
	  height:20px;     
	  border:1;
	  border-top-style:outset;	  
	  border-top-color:#CCCCCC;
	  border-left-style:outset;	  
	  border-left-color:#CCCCCC;	
	  overflow:hidden;
	  font-family: arial, sans-serif;
	  font-size: 12px;
	  }
    </style>
<div id="bc_main_outer">
	<div id="bc_main_mid">
		<div id="bc_profile_outernav"><div class="outer_page_nav">
		<ul>
		<li>
		<!--
		<s:url id="viewProfile" action="loademployerprofile.action"/>
		<s:a href="%{viewProfile}">view Profile</s:a>
		-->
		<a href="${ctx}/employer/loademployerprofile.action?profile.id=<s:property value="profile.id"/>">View Profile</a>
		</li>
		<li class="active">
		<!--
		<s:url id="editProfile" action="setUpForInsertOrUpdate.action"/>
		<s:a href="%{editProfile}">Edit Profile</s:a>
		-->
		<a href="${ctx}/employer/setUpForInsertOrUpdate.action?profile.id=<s:property value="profile.id"/>">Edit Profile</a>
		</li>
		
		<li class="align-right">
		<!--
		<s:url id="privacySettings" action="privacySettingsForEmployer.action"/>
		<s:a href="%{privacySettings}">Privacy Settings</s:a>
		 -->
		 <a href="${ctx}/employer/privacySettingsForEmployer.action?profile.id=<s:property value="profile.id"/>">Privacy Settings</a>
		</li>
		</ul></div></div>

		<div class="bc_main_inner clear-both">
			<div id="bc_profile_sec">
				<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
					<div id="bc_profile_pic_spot-c">
						<div class="bc_pps_pic">
							<div id="bc_profile_pic">
							<s:if test="profile.picture!=null">
								 <img align="top" src="${ctx}<s:property value="profile.picture"/>" width="130" height="130" alt="N/A"/>
								 </s:if>
								 <s:else>
								<img src="${ctx}/styles/default/images/mobc_default_cprofile_pic.jpg" alt="N/A"/>
							</s:else>
							</div>
						</div>
					</div>
					<div id="bc_profile_info">
						<h2 id="bc_profile_name-c"><s:property value="employer.organizationName"/></h2>
						
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
			<div id="bc_opportunities1">
				<div class="bc_light_box">
				<div class="bc_lb-tr">
				<div class="bc_lb-bl">
				<div class="bc_lb-br">
				<div class="bc_lb-content">

					<div class="bc_greytbarprofile_lg">
						<h3 class="bc_gtb_title">Edit Profile <s:property value="profile.name"/></h3>
							<s:actionerror/>
							<span id="employerProfileId" style="color: red"></span>
						<form  action="editEmployerProfile.action" method="post">
						<s:hidden name="profile.id"/>
						
						<div class="form_line">
 						        <h5>Profile Name</h5>
		 						<div class="lt" >
			 						<input class="imgtext" type="text" id="profileNameId"
			  						name="name" class="txt" value=<s:property value="profile.name"/>>
		  						</div>
  						</div>
  						<div class="form_line">
								<h5>Profile Info</h5>
								<div class="lt" >
								<textarea class="img" name="biography" rows="3"><s:property value="profile.biography"/></textarea>
								</div>
						</div><br>
						
						
						<div class="form_line">
							<h5>Profile Misc/Other Info</h5>
							<div class="lt">
							<textarea class="img" name="others" rows="2" id="img"><s:property value="profile.others"/></textarea>
							</div>
						</div>
						<br>
						<!--
							<div class="form_line">
	 						<h5>Profile Name</h5>
		 						<div class="lt">
		 						<input style="max-height: 150px;" name="name" id="profileNameId" value=<s:property value="profile.name"/>/>
		 						</div>
	 						</div>
 						<br>
						  this will be profile info  
						
						<div class="form_line">
						<h5>Profile Info</h5>
						<div class="lt" >
						<textarea rows="4" cols="15" name="biography"><s:property value="profile.biography"/></textarea>
						</div>
						</div><br>
						  this will be misc/other info					
					
					
						<div class="form_line">
						<h5>Profile Misc/Other Info</h5>
						<div class="lt">
						<textarea rows="4" cols="15" name="others"><s:property value="profile.others"/></textarea>
						
						</div></div><br>
						-->								
					<input type="image" value="submit" src="${ctx}/styles/default/images/save_changes.JPG" onclick="return(editEmployerProfile());"/>
					
					</form>
					
					</div>    
					
					<br style="clear:both" />
				</div></div></div></div></div>
			</div>
			<br class="clear-both" />
		</div>

	</div>
</div>



<script type="text/javascript" src="<c:url value='/styles/default/js/editEmployerProfile.js'/>"></script>

