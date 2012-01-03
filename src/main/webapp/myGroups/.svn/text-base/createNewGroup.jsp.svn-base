<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="<c:url value='/styles/default/js/groups/validateGroups.js'/>" 	type="text/javascript"></script>

<div id="editprofile">
<div id="bc_main_outer">
<div id="bc_main_mid">
<div class="bc_main_inner clear-both">
<div id="outerlgb">
<div class="lgrey_box">
<div class="lgrey_box-r">
<div class="lgrey_box-b">
		<div class="red_bar">
			<h1>Create Group</h1>
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

	     <s:if test="profilList.size!=0">
			<form action="createGroup.action" method="POST" enctype="multipart/form-data">
			
			<div class="col1-group">
			<div class="col1-content_group">
					<div class="f_line_group">
							<div id="left-group">
								<h3 class="groupspace">Name of your Group</h3>
								<span style="margin-top: 30px; color: red" id="groupNameSpanId"></span>
								<input type="text" class="inputtext" name="group.name" id="groupNameId" />
								<p></p>
							</div>
					</div>
					<div class="f_line_group">
					<h5 class="groupspace">Upload a new Group photo</h5>
					<span id="picId" style="color: red; font-size: 15px"></span>
					<s:file name="upload" size="32" id="uploadpic" />
					</div>
					<div class="f_line_group">
						<h5 class="groupspace">Group Type</h5>
						<span style="margin-top: 30px; color: red; font-size: 12px;"id="groupTypeSpanId"></span>
						<s:select id="selectedGrpType" cssStyle="width:225px;"
							name="group.title" headerKey="1" headerValue="Please select"
							list="#{'Public':'Public','Private':'Private'}"/>
				    </div>
				    
				    <div class="f_line_group">
						<h5 class="groupspace">Group Description</h5>
						<span style="margin-top: 30px; color: red; font-size: 12px;"id="groupTypeSpanId"></span>
						<s:textarea rows="5" name="group.description" cssStyle="width:300px"></s:textarea>
				    </div>
				    
				    <div class="f_line_group">
						<h5 class="groupspace">Associate with which Profile?</h5>
					<span style="margin-top: 30px; color: red; font-size: 12px;" id="groupProfileSpanId"></span>
						<s:select list="profilList" listKey="id" cssStyle="width:225px;"
				                  headerKey="1" headerValue="Please Select" listValue="name"
				                  name="profile.id" id="profileListId" />
				    </div>
				    <div class="f_line_group">
					    <div class="submit_group_btn_cont">
				            <input type="image"  src="${ctx}/styles/default/images/mob_Group_Create.png" onclick="return checkForExistingGroup();">
				        </div>
				       
				    </div>
			</div>
			</div>
			
			
			</form>
		</s:if>
		<s:else>
	       <h5>Please Update your profile</h5>
	       <h5 align="right">
	               <a href="${ctx}/employee/loadEmployeeProfilesList.action">
	               <img src="${ctx}/styles/default/images/mob_Group_Update.png"></a></h5>
        </s:else>
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
