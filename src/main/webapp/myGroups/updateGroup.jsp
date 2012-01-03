<%@ include file="/common/taglib.jsp"%>
<script src="<c:url value='/styles/default/js/groups/validateGroups.js'/>" type="text/javascript"></script>



<div id="editprofile">
<div id="bc_main_outer">
<div id="bc_main_mid">
<div class="bc_main_inner clear-both">
<div id="outerlgb">
<div class="lgrey_box">
<div class="lgrey_box-r">
<div class="lgrey_box-b">
		<div class="red_bar">
			<h1>Edit Group</h1>
			<h4 class="ta-right"></h4>
		</div>
<div class="lgrey_simple">
<div class="lgrey_simple-b">
<div class="lgrey_simple-l">
<div class="lgrey_simple-r">
<div class="lgrey_simple-tl">
<div class="lgrey_simple-tr">
<div class="lgrey_simple-bl">
<div class="lgrey_simple-content">

	   
			<form action="updateGroupAction.action" method="POST" enctype="multipart/form-data" >
							<s:hidden name="group.id"></s:hidden>	
			
			<div class="col1-group">
			<div class="col1-content_group">
					<div class="f_line_group">
							<div id="left-group">
								<h3 class="groupspace">Name of your Group</h3>
								<span style="margin-top: 30px; color: red" id="groupNameSpanId"></span>
								 <s:textfield cssClass="inputtext" name="group.name" id="groupNameId"></s:textfield>
								<p></p>
							</div>
					</div>
					<div class="f_line_group">
					   <s:if test="group.icon!=null">					   
							<img src="<s:property value="resizedPicture"/>" alt=""  width="150" height="100" />
						</s:if>
						<s:else>
							<img src="${ctx}/styles/default/images/mobc_default_profile_pic.jpg" alt=""  width="150" height="100" />
						</s:else>
					<h5 class="groupspace">Upload a new Group photo</h5>
					<span id="picId" style="color: red; font-size: 15px"></span>
					<s:file name="upload" size="32" id="uploadpic" />
					</div>
					
					
					<div class="f_line_group">
						<h5 class="groupspace">Group Type</h5>
						<span style="margin-top: 30px; color: red; font-size: 12px;"id="groupTypeSpanId"></span>
						<s:select id="selectedGrpType" name="group.title" cssStyle="width:225px"
			                          headerKey="1" headerValue="Please select"
			                          list="#{'Public':'Public','Private':'Private'}" />
				    </div>
				    
				    <div class="f_line_group">
						<h5 class="groupspace">Group Description</h5>
						<span style="margin-top: 30px; color: red; font-size: 12px;"id="groupTypeSpanId"></span>
						<s:textarea rows="3" name="group.description" cssStyle="width:300px"></s:textarea>
				    </div>
				    <!--  <div class="f_line_group">
						<h5 class="groupspace">Profiles</h5>
					<span style="margin-top: 30px; color: red; font-size: 12px;" id="groupProfileSpanId"></span>
						<s:select list="profilList" value="group.profile.id" cssStyle="width:225px"
							      listKey="id" headerKey="1"
			                      headerValue="Please Select"
			                      listValue="name" name="group.profile.id" id="profileListId"/>
				    </div> -->
				 
				    <div class="f_line_group">
					    <div class="submit_group_btn_cont">
				            <input type="image"  src="${ctx}/styles/default/images/mob_Group_Update.png" onclick="return checkForExistingGroup();">
				        </div>
				    </div>
			</div>
			</div>
			
			
			</form>
		
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<br class="clear-both" />
