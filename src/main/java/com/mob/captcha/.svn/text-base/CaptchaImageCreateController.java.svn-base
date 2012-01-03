package com.mob.captcha;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.octo.captcha.service.image.ImageCaptchaService;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class CaptchaImageCreateController  extends ActionSupport implements  InitializingBean {

	private ImageCaptchaService jcaptchaService;

	/**
	 * @see org.springframework.web.servlet.mvc.Controller#handleRequest(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public String  handleRequest() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest(); 
		HttpServletResponse response = ServletActionContext.getResponse(); 
		byte[] captchaChallengeAsJpeg = null; 

		ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream(); 

		String captchaId = request.getSession().getId(); 

		BufferedImage challenge = jcaptchaService.getImageChallengeForID(captchaId,request.getLocale());
		JPEGImageEncoder jpegEncoder = JPEGCodec.createJPEGEncoder(jpegOutputStream);
		jpegEncoder.encode(challenge);

		captchaChallengeAsJpeg = jpegOutputStream.toByteArray (); 
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache"); 
		response.setDateHeader("Expires", 0); 
		response.setContentType("image/jpeg"); 
		ServletOutputStream responseOutputStream = response.getOutputStream(); 
		responseOutputStream.write(captchaChallengeAsJpeg); 
		responseOutputStream.flush(); 
		responseOutputStream.close(); 

		return null; 
	}

	/**
	 * Set captcha service
	 * @param captchaService The captchaService to set.
	 */

	/**
	 * @see org.springframework.beans.factory.InitializingBean#afterPropertiesSet()
	 */
	public void afterPropertiesSet() throws Exception {
		if(jcaptchaService == null){
			throw new RuntimeException("Image captcha service wasn`t set!");
		}
	}

	public ImageCaptchaService getJcaptchaService() {
		return jcaptchaService;
	}

	public void setJcaptchaService(ImageCaptchaService jcaptchaService) {
		this.jcaptchaService = jcaptchaService;
	}

}
