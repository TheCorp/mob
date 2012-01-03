package com.mob.services.jcaptcha;

import org.acegisecurity.captcha.CaptchaSecurityContextImpl;

public class FixedCaptchaSecurityContextImpl extends CaptchaSecurityContextImpl {
	public int hashCode() {
		     if (getAuthentication() == null) {
		       return (int)System.currentTimeMillis();
		     } else {
		                return this.getAuthentication().hashCode();
		           }
		   }

}
