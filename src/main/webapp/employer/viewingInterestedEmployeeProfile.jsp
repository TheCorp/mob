<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<div id="editprofile">
<div id="bc_main_outer">
	<div id="bc_main_mid">

		<div class="bc_main_inner clear-both">
			<div id="outerlgb"><div class="lgrey_box"><div class="lgrey_box-r"><div class="lgrey_box-b">
				<div class="red_bar">
				
				<h1>Viewing Profile <s:property value="interestedEmployeeProfile.name"/></h1><h4 class="ta-left"></h4><h4 class="ta-right"></h4>
				</div>
				<div class="lgrey_simple"><div class="lgrey_simple-b"><div class="lgrey_simple-l"><div class="lgrey_simple-r"><div class="lgrey_simple-tl"><div class="lgrey_simple-tr"><div class="lgrey_simple-bl"><div class="lgrey_simple-content">
					<form id="editProfForm">
						
						<div class="col1">
							<h3>little bit about <s:property value="interestedEmployeeProfile.name"/>.</h3>
							<div class="col1-content">
								<div class="f_line">
									<h5><em>category</em></h5>
								 <s:property value="interestedEmployeeProfile.jobcategory"/>
						
								</div>
								<div class="f_line">
									<h5><em>Worktimeframe</em></h5>
									<s:property value="interestedEmployeeProfile.workTimeframe"/>
								</div>
								
								<div class="f_line" >
									<h5><em>salary range</em> expecting</h5>
									<div class="i-lft" style="width:100px">
									<div id="yearlydiv" >									
									<s:property value="interestedEmployeeProfile.range"/>
									</div>
									<div id="hourlydiv" style="display: none;">
									</div>
									</div>
									<div style="width:100px">									
									<s:property value="interestedEmployeeProfile.salaryType"/>
									</div>
									
								</div>
								
								<div class="rangeclass" id="rangeclass">
								</div>
								
								<div class="f_line">
									<h5>Days available for work</h5>
									
								<s:property value="interestedEmployeeProfile.days"/>
								</div><br class="clear-both" />
								</div>
							<span class="clear-both">&nbsp;</span>
							</div>
						<div class="col2">
		
						<h3>Work Experience</h3>
						
						<div id="addWorkExp">
						
								<div class="f_col">														
								<h5>Company Name</h5>               					
								</div>
								
								<div class="f_col">
								<h5>Title/Position</h5>
								</div>
								
								<div class="f_col">
						         <h5>Started</h5>
						        </div>
						        
						        <div class="f_col">
						         <h5>Ended</h5>
						        </div>
							</div>
							
							<div id="currentWorkExp" >
							<s:iterator value="interestedEmployeeProfile.experience">
									<div class="exp_entry" id="expdiv">
									<div class="where"><s:property value="employerName"/> </div>
									<div class="what"><s:property value="description"/></div>
									<div class="when"><s:date name="workStart" format="MM/dd/yyyy"/> - <s:date name="workEnd" format="MM/dd/yyyy"/></div>
									</div>
						</s:iterator>
						</div>
							
						<div>
							</div>
						</div>
				</form>
				</div></div></div></div></div></div></div></div>
			</div></div></div></div>
		</div>

	</div>
</div>
</div>
<br class="clear-both" />
<script src="<c:url value='/styles/default/js/jquery-1.2.6.js'/>" type="text/javascript"></script>
