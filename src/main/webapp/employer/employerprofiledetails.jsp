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
		<ul><li class="active"><a href="${ctx}/employer/listopportunities.action">Company Profile</a>
		<li><a href="${ctx}/employer/listopportunities.action">Edit Company Profile</a></li></ul></div></div>


		<div class="bc_main_inner clear-both">
			<div id="bc_profile_sec">
				<div class="bc_light_box"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
					<div id="bc_profile_pic_spot-c">
						<div class="bc_pps_pic">
							<div id="bc_profile_pic" style="height: 90px">
							user  picture
								 <img align="top" src="${ctx}<s:property value="user.picture"/>" width="130" height="130" alt="N/A"/>
															
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
						<h3 class="bc_gtb_title">Welcome <s:property value="user.organizationName"/></h3>
							<s:actionerror/>
							<span id="employerProfileId" style="color: red"></span>
							
						<form  action="addEmployerProfile.action" method="post">
						<div class="form_line">
 						<h5>Profile Name</h5>
		 						<div class="lt" >
		 						<input class="imgtext" type="text" id="ProfileName"
		  						name="profile.name" class="txt"/>
		  						</div>
  						</div
  						><br>
						<!--  this will be profile info  -->
						
						<div class="form_line">
						<h5>Profile Info</h5>
						<div class="lt" >
						<textarea class="img" name="profile.biography" rows="3"></textarea></div></div><br>
						<!--  this will be misc/other info-->					
					
					
						<div class="form_line">
						<h5>Profile Misc/Other Info</h5>
						<div class="lt">
						<textarea class="img" name="profile.others" rows="2" id="img"></textarea></div></div><br>
						<!--  this will be misc/other info-->		
					
					<input type= "image" value="submit" src="${ctx}/styles/default/images/save1.JPG" onclick="return(addEmployerProfile());"/>
					</form>
					
					</div>
					
					<br style="clear:both" />
				</div></div></div></div></div>
			</div>
			<br class="clear-both" />
		</div>

	</div>
</div>

<script type="text/javascript" src="<c:url value='/styles/default/js/addEmployerProfile.js'/>"></script>

