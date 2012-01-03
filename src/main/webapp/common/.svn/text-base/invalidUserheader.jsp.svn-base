<%@ include file="/common/taglib.jsp" %>
<form id="th_searchform" action="" onsubmit="return false">
    <div class="col_l">

        <!--
       <input name="search" type="text" class="txt"
           value="type something..." onfocus="inputOnFocus(this)" />
        -->
    </div>
    <div class="col_r">

        <!--
	<input type="image" value="Submit"
		src="${ctx}/styles/default/images/mobc_thsearchbtn-up.png" />
		-->
    </div>
</form>

<div id="login_spot">

    <!--<authz:authorize ifNotGranted="ROLE_ADMIN,ROLE_EMPLOYER,ROLE_EMPLOYEE">-->

    <div class="joinorlogin">
        <!--<span style="font-size: 12px;">Invalid user name or password,please try again</span>
             -->
        <div class="thf_line" id="msgID" >Invalid user name or password</div>
    </div>
    <!-- <div class="thf_line" id="msgID">Invalid user name or password,please try again</div> -->
    <!--</authz:authorize>-->

    <div id="loginid">
        <form id="login" action="<c:url value='/j_security_check'/>"
              method="POST">
            <s:textfield cssClass="txt" name="j_username"
                         value="you@somewhere.com" onfocus="inputOnFocus(this)" onkeypress="clickButton();"/><br/>
            <s:password cssClass="txt" name="j_password" value="your password"
                        onfocus="inputOnFocus(this)" onkeypress="clickButton();"/>

            <div class="frow">
                <div class="fcol-l"><s:checkbox name="j_remember_me" value="1"/>
                    <span class="remember_details">remember details</span></div>
                <div class="fcol-r" style="margin-top: -2px">
                    <input type="image" class="login_btn" id="loginImageId" onclick="clickButton()"
                           value="login" src="${ctx}/styles/default/images/mobc_sm_login-up.jpg"/>
                </div>
            </div>

            <div class="frow forgot_pass">
                <s:a href="${ctx}/public/forgotPassword.action">forgot password?</s:a>
            </div>
            <br>
        </form>
    </div>
</div>
<script type="text/javascript" src="<c:url value='/styles/default/js/jquery-1.3.2.min.js'/>"></script>
<script src="<c:url value='/styles/default/js/invalidUserHeader.js'/>" type="text/javascript"></script>
<script src="<c:url value='/styles/default/js/searchFromHeader.js'/>" type="text/javascript"></script>