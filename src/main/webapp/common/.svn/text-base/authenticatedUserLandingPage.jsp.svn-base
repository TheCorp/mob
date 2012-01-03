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

<div id="bc_main_mid-trans">
<div id="bc_home_top">
    <div id="bc_showcase_box">
        <div id="bc_sb-inner">
            <h1>Showcase your work. <span class="embolden">Get Discovered.</span><br/>Interact with
                Professionals.</h1>

            <p>My Own Briefcase is an online service for anyone who wants to announce or showcase their work,
                get discovered for their talents and possibly land a job through postings of their profiles,
                availability for hire and examples of work through photos, videos, music files and real time
                webcam chats.</p>

            <div id="bc_sb-button">
                <s:form action="signup" validate="true" method="post"
                        enctype="multipart/form-data">
                        <!-- 
                    <s:submit type="image" src="${ctx}/styles/default/images/mobc_joinforfreebtn-up.png"
                              value="Join for free"/>
                         -->      
                </s:form>

            </div>
        </div>
    </div>
</div>

<div class="bc_main_inner clear-both">
    <div id="bc_main_leftcol">
        <div id="bc_m_lc-t">
            <div id="bc_m_lc-contents1">
                <%--<c:when test="${pageContext.request.remoteUser == null}">--%>

                <h2>Your Latest News</h2>

                <div id="bc_latest_news_table" class="bc_2cbtbl">
                    <ul class="bc_2cbt-when">
                        <li id="type0" class="bc_2cbt_today" onclick="setValue(0)"><h3>today</h3></li>
                        <li id="type1" onclick="setValue(1)">yesterday</li>
                        <li id="type2" onclick="setValue(2)">this week</li>
                        <li id="type3" onclick="setValue(3)">this month</li>
                        <li id="type4" onclick="setValue(4)">this year</li>
                    </ul>
                    <ul class="bc_2cbt-what">
                        <li class="bc_2cbt_grnarrbg" id="news0"></li>
                        <li id="news1"></li>
                        <li id="news2"></li>
                        <li id="news3"></li>
                        <li id="news4"></li>
                    </ul>
                    <br class="clear-both"/>
                </div>
                <%--</c:when>--%>

                <br/>

                <h2>Official Updates</h2>

                <h3 class="newssubhead">Beta Release Commenced</h3>

                <p>MyOwnBriefcase.com is now released for private beta. Welcome all new users! Please send your feedback to <a href="mailto:feedback@myownbriefcase.com">feedback@myownbriefcase.com</a> with any comments, questions or suggestions. We are eager to hear what you think and are excited to have you help us make this service work better for you!
                 </p>
            </div>
        </div>
    </div>
    
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
							<a href="${ctx}/public/viewFeaturedProfile.action?employeeProfileId=<s:property value="profile.id"/>" style="text-decoration: underline">
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
    <br class="clear-both"/>
</div>
</div>
<br class="clear-both"/>


<script src="<c:url value='/styles/default/js/newsTicker.js'/>" type="text/javascript"></script>
