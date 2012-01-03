<%@ include file="/common/taglib.jsp"%>
<head>
<s:head theme="ajax"/>
</head>


		<form id="regForm"  method="post" action="addEmployer.action">
		
		<div class="form_line">
								<h5>Your <em>Organization Name </em></h5>
								<div class="lt"><input type="text" name="employer.organizationName" class="txt" /> </div>
								<div class="rt">
									<div class="check"></div><div class="expl" id="fn-expl"></div>
								</div>
							</div>

							<div class="form_line">
								<h5>Your <em>Email</em></h5>
								<div class="lt"><input type="text" name="employer.email" class="txt" /></div>
								<div class="rt">
									<div class="check"></div><div class="expl" id="ln-expl">Only letters are allowed.</div>
								</div>
							</div>

							<div class="form_line">
								<h5><em>Number of Employees</em></h5>
								<div class="lt"><input type="text" name="employer.noOfEmployees" class="txt" /></div>
								<div class="rt">
									<div class="check"></div><div class="expl" id="em-expl"></div>
								</div>
							</div>
							<div class="form_line">

								<h5><em>Location</em></h5>
								<div class="lt"><input type="text" name="employer.location" class="txt" /></div>
								<div class="rt">
									<div class="check"></div><div class="expl" id="bd-expl"></div>
								</div>
							</div>
							
							
							<div class="form_line">
								<h5><em>Password</em></h5>

								<div class="lt"><input type="password" name="employer.password" class="txt" /></div>
								<div class="rt">
									<div class="check"></div><div class="expl" id="pw-expl"></div>
								</div>
							</div>
							<div class="form_line">
								<input type="image" value="Submit" src="${ctx}/styles/default/images/joinforfree_red-up.png" />
								<div class="ex">By clicking &quot;Join For Free&quot; you are agreeing with our <a href="">Terms and Conditions</a>.</div>

							</div>
		 </form>
	 
	