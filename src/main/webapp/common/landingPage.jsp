<%@ page pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/styles/default/css/master.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/styles/default/css/prettyPhoto.css'/>" />
<script type="text/javascript" src="<c:url value='/styles/default/js/jquery.prettyPhoto.js'/>"></script>

<script type="text/javascript">

    $(document).ready(function() {
      $("a[rel^='prettyPhoto']").prettyPhoto();
       
    });
</script>


<div id="bc_home">
 <div id="bc_main_outer">
	<div id="bc_main_mid-trans">

		<div id="bc_home_top">
			<div id="bc_showcase_box">
				<div id="bc_sb-inner">
					<h1>Showcase your work. <span class="embolden">Get Discovered.</span><br />Interact with Professionals.</h1>
					<p>My Own Briefcase is an online service for anyone who wants to announce or showcase their work, get discovered for their talents and possibly land a job through postings of their profiles, availability for hire and examples of work through photos, videos, music files and real time webcam chats.</p>
					<div id="bc_sb-button">
					  <form action="${ctx}/public/chooseaccounttype.action" method="post"
		                                >
		                            <input type="image" src="${ctx}/styles/default/images/mobc_joinforfreebtn-up.png"
		                                      value="Join for free"/>
		                        <form>

					
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<div class="bc_main_inner clear-both" style="margin: 0 auto;width: 1075px;margin-top:-20px;">
	<div id="bc_main_leftcol"><div id="bc_m_lc-t"><div id="bc_m_lc-contents">
		<h2 class="newshead">Website Highlights</h2>
		<div class="image_thumb">
			<ul>

				<li>
					<a href="${ctx}/styles/default/images/main_briefcase.png" title="Your Briefcase"><img src="${ctx}/styles/default/images/tab_briefcase_focus.png" alt="Your Briefcase" /></a>
					<div class="block">
						<h3>Your Briefcase</h3>
						<p>Your briefcase is where you can present yourself. Upload anything: your resume, sample work, images, music, videos. You choose how the world sees you.</p>
						<p>Additional info!</p>
						<p>Additional info!</p>

						<p>Additional info!</p>
					</div>
				</li>
				<li>
					<a href="${ctx}/styles/default/images/main_profile.png" title="Multiple Profiles"><img src="${ctx}/styles/default/images/tab_profile_idle.png" alt="Organized Food Fight" /></a>
					<div class="block">
						<h3>Multiple Profiles</h3>
						<p>Your professional life, like your personality, can't be described in just one way. Tell us about all the different ways you see yourself and we will help you market them to the world.</p>

						<p>Additional info!</p>								
					</div>
				</li>
				<li>
					<a href="${ctx}/styles/default/images/main_webcam.png" title="Webcam Connect"><img src="${ctx}/styles/default/images/tab_webcam_idle.png" alt="Endangered Species" /></a>
					<div class="block">
						<h3>Webcam Connect</h3>
						<p>Connect face to face with employers and employees through Skype's free webcam service. Get the real story behind the profile and make more meaningful connections today.</p>

						<p>Additional info!</p>		
					</div>
				</li>
				<li>
					<a href="${ctx}/styles/default/images/main_opps.png" title="Create Opportunities"><img src="${ctx}/styles/default/images/tab_opps_idle.png" alt="Evolution" /></a>
					<div class="block">
						<h3>Create Opportunities</h3>
						<p>We strive to bring employers and employees together to create unique opportunities for everyone. Use our tools to build a personal and professional network that helps you achieve you goals.</p>

						<p>Additional info!</p>		
					</div>
				</li>
			</ul>
		</div>
		<div class="main_image">
			<img src="${ctx}/styles/default/images/main_briefcase.png" alt=""/>
			<div class="desc">
				<a  class="collapse" title="Learn More">Close Me!</a>

				<a  class="close" title="Close">Close!</a>
				<div class="block">
					<h3>Your Briefcase</h3>
					<p>Your briefcase is where you can present yourself. Upload anything: your resume, sample work, images, music, videos. You choose how the world sees you.</p>
					<p>Additional info!</p>
					<p>Additional info!</p>

					<p>Additional info!</p>
				</div>
			</div>
		</div>
	</div></div></div>
	 <div id="bc_main_rightcol">
	 
	 <h2 class="newshead">What Is My Own Briefcase?</h2>
	 
		<div class="bc_preview_video">
			<a href="http://www.myownbriefcase.com/privacy_files/myownbriefcase_draft_update.mov?width=640&amp;height=480" rel="prettyPhoto" title="What Is My Own Briefcase?">
			<img src="${ctx}/styles/default/images/prettyPhoto/video_preview.png" alt="What Is My Own Briefcase?" /></a>
		</div>
	 
	 <br/>
	             <h2 class="newshead">Featured Briefcases</h2>
					
						<div class="bc_feat_brief">
							<div class="bc_fb_img">
							<a href="${ctx}/public/viewFeaturedProfile.action?employeeProfileId=<s:property value="profile.id"/>" style="text-decoration: underline">
								<s:if test="profile.picture!=null">
									<img src='<s:property value="resizedMidPicture"/>' width="75" height="93" />
								</s:if>
								<s:else>
									<img src="${ctx}/styles/default/images/mobc_default_profile_thumb.png" width="75" height="94" />
								</s:else>
							</a>
							</div>
							
							<div class="bc_fb_text">
								<h5>
								<a href="${ctx}/public/viewFeaturedProfile.action?employeeProfileId=<s:property value="profile.id"/>" 
								style="text-decoration: underline;">
		                         <s:property  value="profile.nickName"/>
								 <s:property  value="profile.name"/>
		                        </a>
								</h5>
								<!--<h5>
		                            <a href="${ctx}/public/viewFeaturedProfile.action?employeeProfileId=<s:property value="profile.id"/>" style="text-decoration: underline">
		                            	See All
		                            </a>
								</h5>-->
								<p class="bc_fb_t_blurb">
								I am excited about pursuing a career in IT and one day hope to run my own business. I work well with others and I will always contribute to the team. I am eager and ready to start TODAY!
								</p>
							</div>
							
							<br class="clear-both"/>
						</div>
					<br/>
		 	 </div>
			
		</div>
	</div>

<br />




