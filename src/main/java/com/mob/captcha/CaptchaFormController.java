package com.mob.captcha;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.validation.BindException;
import org.springframework.validation.ObjectError;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.octo.captcha.service.CaptchaServiceException;
import com.octo.captcha.service.image.ImageCaptchaService;

public class CaptchaFormController  extends SimpleFormController {
	/**
	 * Default paramter name for CAPTCHA response in <code>{@link HttpServletRequest}</code>
	 */
	private static final String DEFAULT_CAPTCHA_RESPONSE_PARAMETER_NAME = "j_captcha_response";
	
	protected ImageCaptchaService jcaptchaService;
	protected String captchaResponseParameterName = DEFAULT_CAPTCHA_RESPONSE_PARAMETER_NAME;
	private String captchaId;
		
	
	public ImageCaptchaService getJcaptchaService() {
		return jcaptchaService;
	}


	public void setJcaptchaService(ImageCaptchaService jcaptchaService) {
		this.jcaptchaService = jcaptchaService;
	}


	


	public String getCaptchaId() {
		return captchaId;
	}


	public void setCaptchaId(String captchaId) {
		this.captchaId = captchaId;
	}


	protected ModelAndView onSubmit(HttpServletRequest request, 
			       HttpServletResponse response, Object command, BindException errors) throws Exception {
				   String originalRequestMethod = request.getParameter("original_request_method");
				   String originalRequestUrl = request.getParameter("original_requestUrl");
				   String originalRequestParameters = request.getParameter("original_request_parameters");
				   System.out.println("inside submit method");
				   String redirectUrl = originalRequestUrl;
				   return new ModelAndView("redirect:" + redirectUrl);
			   }

	
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		     return new Object();
		   }
		 
	
	/**
	 * Delegates request to CAPTCHA validation, subclasses which overrides this 
	 * method must manually call <code>{@link #validateCaptcha(HttpServletRequest, BindException)}</code>
	 * or explicitly call super method.
	 * 
	 * @see #validateCaptcha(HttpServletRequest, BindException)
	 * @see org.springframework.web.servlet.mvc.BaseCommandController#onBindAndValidate(javax.servlet.http.HttpServletRequest, java.lang.Object, org.springframework.validation.BindException)
	 *//*
	@Override
	protected void onBindAndValidate(HttpServletRequest request, Object command, BindException errors) throws Exception {		
		validateCaptcha(request, errors);
	}
	
	*//**
	 * Validate CAPTCHA response, if response isn`t valid creates new error object 
	 * and put him to errors holder.
	 * 
	 * @param request current servlet request
	 * @param errors errors holder
	 *//*
	protected void validateCaptcha(HttpServletRequest request, BindException errors){
		boolean isResponseCorrect = false;
		
        //remenber that we need an id to validate!
        String captchaId = request.getSession().getId();
        //retrieve the response
        String response = request.getParameter(captchaResponseParameterName);
        //validate response
        try {			
			if(response != null){
				isResponseCorrect =
					captchaService.validateResponseForID(captchaId, response);
			}
		} catch (CaptchaServiceException e) {
		    //should not happen, may be thrown if the id is not valid			
		}
		
		if(!isResponseCorrect){
			//prepare object error, captcha response isn`t valid
	        String objectName = "Captcha";
			String[] codes = {"invalid"};
			Object[] arguments = {};
			String defaultMessage = "Wrong control text!";
			ObjectError oe = new ObjectError(objectName, codes, arguments, defaultMessage);
			errors.addError(oe);
		}         
	}

	*//**
	 * Set captcha service
	 * @param captchaService the captchaService to set.
	 *//*
	public void setCaptchaService(ImageCaptchaService captchaService) {
		this.captchaService = captchaService;
	}

	*//**
	 * Set paramter name for CAPTCHA response in <code>{@link HttpServletRequest}</code>
	 * @param captchaResponseParameterName the captchaResponseParameterName to set.
	 *//*
	public void setCaptchaResponseParameterName(String captchaResponseParameterName) {
		this.captchaResponseParameterName = captchaResponseParameterName;
	}*/
	
	public String checkJcaptcha(){ 
		System.out.println("inside if condition response:"+captchaId);
		HttpServletRequest request = ServletActionContext.getRequest(); 
		//HttpServletResponse response = ServletActionContext.getResponse(); 
			 boolean flag = false; 
			 String id = request.getSession().getId(); 
			 if (!captchaId.equals("")) { 
				 flag = jcaptchaService.validateResponseForID (id,captchaId); 
			 } 
			 if(flag){
				 return "success";
			 }else{
				 return "failure";
			 }
			
		 }  
}
