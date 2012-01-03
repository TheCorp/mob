package com.mob.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.acegisecurity.ui.rememberme.TokenBasedRememberMeServices;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport
        implements ServletRequestAware, ServletResponseAware {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private HttpSession session;

    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
        this.session = httpServletRequest.getSession(false);
    }

    public String execute() {
        if (request.getSession(false) != null) {
            session.invalidate();
        }
        Cookie terminate = new Cookie(TokenBasedRememberMeServices.ACEGI_SECURITY_HASHED_REMEMBER_ME_COOKIE_KEY, null);
        String contextPath = request.getContextPath();
        terminate.setPath(contextPath != null && contextPath.length() > 0 ? contextPath : "/");
        terminate.setMaxAge(0);
        response.addCookie(terminate);
        return "success";
    }

    public void setServletResponse(HttpServletResponse httpServletResponse) {
        //To change body of implemented methods use File | Settings | File Templates.
        this.response = httpServletResponse;
    }
}