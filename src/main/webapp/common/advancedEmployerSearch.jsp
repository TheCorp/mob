<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<div id="bc_main_outer">
	<div id="bc_main_mid">

		<div class="bc_main_inner clear-both r_sel_prof">
			<div id="outerlgb"><div class="lgrey_box"><div class="lgrey_box-r"><div class="lgrey_box-b">
				<div class="red_bar"><div class="red_bar-l"><div class="red_bar-r">
					<h1>Employer Search</h1>
				</div></div></div>
				<div class="lgrey_simple select_profile"><div class="lgrey_simple-b"><div class="lgrey_simple-l"><div class="lgrey_simple-r"><div class="lgrey_simple-tl"><div class="lgrey_simple-tr"><div class="lgrey_simple-bl"><div class="lgrey_simple-content">
					<h2 class="prof_sub_header">Search Criteria</h2>
					<form id="advancedEmpEmpSearchForm" name="form1" method="post" action="${ctx}/search/searchAllEmployers.action">

						<div class="row">
							<h5>Keywords</h5>
							<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r"><input type="text" class="txt" name="employerName" /></span></span></span>
						</div>
						<div class="row">
							<h5>Location</h5>
							<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r"><input type="text" class="txt" name="employerLocation" /></span></span></span>
						</div>

						<div class="row">
							<input type="image" value="Search" src="${ctx}/styles/default/images/red_search_btn-up.png" />
						</div>
					</form>
					
					
					 
				</div> </div> </div> </div> </div></div></div></div>
			</div></div></div></div>
		</div>
	</div>
	