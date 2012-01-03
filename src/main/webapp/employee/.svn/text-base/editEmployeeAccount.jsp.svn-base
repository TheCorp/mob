<%@ include file="/common/taglib.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="<c:url value='/styles/default/css/calendar-win2k-cold-2.css'/>"/>
<style>
.startdatetxt
{
float: right;
top: 100px;
margin-top:2px;
margin-right:5px; 


}
.enddatetxt{
float: right;
top: 100px;
margin-top:2px;
}
</style>

<script src="<c:url value='/styles/default/js/editEmployeeAccount.js'/>" type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/calendar_yearsback.js'/>"	type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/calendar.js'/>"
	type="text/javascript"></script>

<div id="edit_account">
<div id="bc_main_outer">
	<div id="bc_main_mid">
		<div class="bc_main_inner clear-both">
			<div id="outerlgb"><div class="lgrey_box"><div class="lgrey_box-r"><div class="lgrey_box-b">
				<div class="red_bar"><div class="red_bar-l"><div class="red_bar-r">
					<h1>Edit Account Settings for <s:property value="user.firstName"/> <s:property value="user.lastName"/> </h1>
				</div></div></div>
				<div class="lgrey_simple"><div class="lgrey_simple-b"><div class="lgrey_simple-l"><div class="lgrey_simple-r"><div class="lgrey_simple-tl"><div class="lgrey_simple-tr"><div class="lgrey_simple-bl"><div class="lgrey_simple-content">
					<form id="editAccountForm" name="editAccountFormName" action="editEmployeeAccount.action">
						<div class="left_col">

							<div class="row">
								<div class="col" style="float: left;width: 160px;">
									<h5>Your <em>First Name</em></h5>
									<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r">
									<input type="text" class="txt" name="firstName"  id="firstName" 
									value='<s:property value="user.firstName"/>' />
									</span></span></span>
								</div>
								<div class="col" style="float: left;width:210px;">
									<h5>&nbsp;</h5>
									<div class="check" id="imageArea"></div>
 									<div class="expl" id="messageArea"></div>
								</div>
							</div>
							
							<div class="row">
								<div class="col" style="float: left;width: 160px;">
									<h5>Your <em>Last Name</em></h5>
									<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r">
									<input type="text" class="txt" name="lastName" id="lastName" value='<s:property value="user.lastName"/>'
									onfocus="validateEditAccount('firstName','imageArea','messageArea');" />
									</span></span></span>
								</div>
								<div class="col" style="float: left;width:210px;">
									<h5>&nbsp;</h5>
									<div class="check" id="imageArea1"></div>
 									<div class="expl" id="messageArea1"></div>
								</div>
							</div>
							
							<div class="row" style="padding-bottom:20px;">
								<div class="col" style="float: left;width: 160px;">
									<h5><em>Email</em></h5>
									<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r">
									<input type="text" class="txt" id="email" name="email" value='<s:property value="user.email"/>'
									onfocus="validateEditAccount('firstName','imageArea','messageArea');
									validateEditAccount('lastName','imageArea1','messageArea1');" />
									</span></span></span>
									<div class="note">This is how we will contact you, <br/>so make sure this is correct.</div>
								</div>
								<div class="col" style="float: left;width:210px;">
									<h5>&nbsp;</h5>
									<div class="check" id="imageArea2"></div>
									 <div class="expl" id="messageArea2"></div> 
								</div>
							</div>	
							
							<div class="row">
								<div class="col" style="float: left;width: 160px;margin-top:25px;">
									<h5><em>PhoneNumber</em></h5>
									<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r">
									<input type="text" class="txt" id="phoneNumberId" name="phoneNumber" value='<s:property value="user.phoneNumber"/>' 
									onfocus="validateEditAccount('firstName','imageArea','messageArea');
									validateEditAccount('lastName','imageArea1','messageArea1');
									CheckEditAccountEmail('email','imageArea2','messageArea2');" />
									</span></span></span>
								</div>
								<div class="col" style="float: left;width:210px;">
									<h5>&nbsp;</h5>
									<div class="check" id="pnImageArea"></div>
 									<div class="expl" id="pnMessageArea"></div>
								</div>
							</div>
							<div class="row">	
								<div class="col" style="float: left;width: 160px;margin-top:14px;">
									<h5><em>Location</em></h5>
									<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r">
									<input type="text" class="txt" id="city" name="city" value='<s:property value="user.city"/>'
									onfocus="validateEditAccount('firstName','imageArea','messageArea');
									validateEditAccount('lastName','imageArea1','messageArea1');
									CheckEditAccountEmail('email','imageArea2','messageArea2');
									validatePhoneNumber('phoneNumberId','pnImageArea','pnMessageArea');" />
									</span></span></span>
								</div>		
								<div class="col" style="float: left;width:210px;">
									<h5>&nbsp;</h5>
									<div class="check" id="cityimageArea"></div>
									 <div class="expl" id="citymessageArea"></div> 
								</div>
							</div>
							
							<div class="row">
								<div class="col" style="float: left;width: 160px;">
									<h5>Birthday</h5>
									<span class="input_gi">
									<span class="input_gi-l">
									<span class="input_gi-r">
									<input type="text"  style="width:120px;" class="txt" id="dob" name="birthday"  value='<s:date name="user.dob" format="MM/dd/yyyy"/>' 
									onfocus="validateEditAccount('firstName','imageArea','messageArea');
									validateEditAccount('lastName','imageArea1','messageArea1');
									CheckEditAccountEmail('email','imageArea2','messageArea2');
									validatePhoneNumber('phoneNumberId','pnImageArea','pnMessageArea');
									validateEmpCity('city','cityimageArea','citymessageArea');" />
                                     <img src="${ctx}/styles/default/images/datepicker_image.GIF" id="f_trigger_c"  title="Date selector"/>

									<script type="text/javascript">
									    Calendar.setup({
									        inputField     :    "dob",     // id of the input field
									        ifFormat       :    "%m/%d/%Y",      // format of the input field
									        button         :    "f_trigger_c",  // trigger for the calendar (button ID)
									        align          :    "Tl",           // alignment (defaults to "Bl")
									        singleClick    :    true
									    });
									</script>
									
									<!--
									<input type="text" class="txt" id="dob" name="birthday" value=<s:date name="user.dob" format="MM/dd/yyyy"/> 
									onfocus="CheckEmail('email','imageArea2','messageArea2');validate('lastName','imageArea1','messageArea1');validate('firstName','imageArea','messageArea');">
									-->
									</span>
									</span>
									</span>
									<div class="note">ex: 02/01/1985</div>
								</div>
								<div class="col" style="float: left;width:210px;">
									<h5>&nbsp;</h5>
									<div class="check" id="imageArea3"></div>
 									<div class="expl" id="messageArea3"></div>
								</div>
							</div>
							
							
							<div class="row">
								<div class="col" style="float: left;width: 160px;">
									<h5>Gender</h5>									
									<s:radio
								          list="%{#{'Male':'Male','Female':'Female'}}"								          
								          value="selectedRadiaoButton"
								          name="gender">
								     </s:radio>	
							</div>							
							</div>		
							
						</div>
						
						<div class="right_col">
							<div class="row">
								<div class="col" style="float: left;width: 160px;">
									<h5><em>Old Password</em></h5>
									<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r">
										<input type="password" class="txt" name="oldPassword" id="oldPasswordId" />
									</span></span></span>
								</div>
								<div class="col" style="float: left;width:210px;">
									<h5>&nbsp;</h5>
									<div class="check" id="imageArea5"></div>
 									<div class="expl" id="messageArea5"></div>
								</div>
							</div>
							<div class="row">
								<div class="col" style="float: left;width: 160px;">
									<h5><em>New Password</em></h5>
									<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r">
									<input type="password"  class="txt" name="newPassword" id="newPasswordId" />
									</span></span></span>
									<div class="note">6 or more characters.</div>
								</div>
								<div class="col" style="float: left;width:210px;">
									<h5>&nbsp;</h5>
									<div class="check" id="imageArea6"></div>
 									<div class="expl" id="messageArea6"></div>
								</div>
							</div>

							<div class="row">
								<div class="col" style="float: left;width: 160px;">
									<h5><em>Verify New Password</em></h5>
									<span class="input_gi"><span class="input_gi-l"><span class="input_gi-r">
									<input type="password" class="txt" name="verifyNewPassword" id="verifyNewPasswordId" />
									</span></span></span>
									<div class="note">6 or more characters.</div>
								</div>
								<div class="col" style="float: left;width:210px;">
									<h5>&nbsp;</h5>
									<div class="check" id="imageArea7"></div>
 									<div class="expl" id="messageArea7"></div>

								</div>
							</div>
							<div class="row submit_btn_cont">
							<input type="image" src="${ctx}/styles/default/images/red_submit_arr_btn-up.png" 
							onclick="return(checkEditForm());"/>
  							</div>
						</div>
					</form>
				</div></div></div></div></div></div></div></div>

			</div></div></div></div>
		</div>
	</div>
</div>

<br class="clear-both" /><!--#include file="mobc_footer.html"-->

<br />

</div>
