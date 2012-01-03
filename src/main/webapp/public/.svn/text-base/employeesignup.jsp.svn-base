<%@ include file="/common/taglib.jsp"%>
<s:form id="regForm" method="post" action="addEmployee.action">

	<div class="form_line">

	<h5>Your<em>First Name</em></h5>
	<div class="lt"><input type="text" id="firstName"
		name="user.firstName" class="txt" /></div>
	<div class="rt">
	<div class="check" id="imageArea"></div>
	<div class="expl" id="messageArea"></div>
	</div>
	</div>


	<div class="form_line">
	<h5>Your <em>Last Name</em></h5>
	<div class="lt"><input type="text" id="lastName"
		name="user.lastName" class="txt"
		onfocus="validate('firstName','imageArea','messageArea');" /></div>

	<div class="rt">
	<div class="check" id="imageArea1"></div>
	<div class="expl" id="messageArea1"></div>
	</div>

	</div>
	<div class="form_line">
	<h5><em>Email</em></h5>
	<div class="lt"><input type="text" id="email" name="user.email"
		class="txt"
		onfocus="validate('lastName','imageArea1','messageArea1');" /></div>
	<div class="rt">
	<div class="check" id="imageArea2"></div>
	<div class="expl" id="messageArea2"></div>
	</div>
	</div>
	<div class="form_line">
	<h5><em>Birthday</em></h5>
	<div class="lt"><input type="text" id="dob" name="user.dob"
		class="txt" onfocus="CheckEmail('email','imageArea2','messageArea2');" />
	<div class="ex">(Ex: 02/01/1981)</div>
	</div>
	<div class="rt">
	<div class="check" id="imageArea3"></div>
	<div class="expl" id="messageArea3"></div>
	</div>
	</div>

	<div class="form_line">
	<h5><em>Gender</em></h5>
	<div class="lt"><select name="user.sex">
		<option value="Male">Male</option>
		<option value="Female">Female</option>
	</select></div>
	<div class="rt">
	<div class="check" id="imageArea4"></div>
	<div class="expl" id="messageArea4"></div>
	</div>
	</div>
	<div class="form_line">
	<h5><em>Password</em></h5>

	<div class="lt"><input type="password" id="password"
		name="user.password" class="txt"
		onfocus="return checkDate('dob','imageArea3','messageArea3');"
		onblur="return validatePwd('imageArea5','messageArea5');" /></div>
	<div class="rt">
	<div class="check" id="imageArea5"></div>
	<div class="expl" id="messageArea5"></div>
	</div>
	</div>
	<div class="form_line"><input type="image" value="Submit"
		src="${ctx}/styles/default/images/joinforfree_red-up.png"
		onclick="return(checkForm())" />

	<div class="ex">By clicking &quot;Join For Free&quot; you are
	agreeing with our <a href="">Terms and Conditions</a>.</div>

	</div>
</s:form>

