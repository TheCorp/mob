package com.mob.services.jcaptcha;

import org.acegisecurity.captcha.CaptchaServiceProxy;

import com.octo.captcha.service.CaptchaServiceException;
import com.octo.captcha.service.image.ImageCaptchaService;

public class JCaptchaServiceProxyImpl implements CaptchaServiceProxy {
	private ImageCaptchaService jcaptchaService;

	
	public boolean validateReponseForId(String id, Object response) {
		try {
			return jcaptchaService.validateResponseForID(id, response);

		} catch (CaptchaServiceException cse) {
			return false;
		}
	}
	
	public ImageCaptchaService getJcaptchaService() {
		return jcaptchaService;
	}

	public void setJcaptchaService(ImageCaptchaService jcaptchaService) {
		this.jcaptchaService = jcaptchaService;
	}

}
