package com.mob.forum.sso;



import javax.servlet.http.Cookie;

import org.apache.log4j.Logger;

import com.mob.forum.context.RequestContext;
import com.mob.forum.entities.UserSession;
import com.mob.forum.util.preferences.ConfigKeys;
import com.mob.forum.util.preferences.SystemGlobals;

public class CookieUserSSO implements SSO {

static final Logger logger = Logger.getLogger(CookieUserSSO.class.getName());

    public String authenticateUser(RequestContext request) {
        // myapp login cookie, contain logged username
        String cookieName = "JForumSSO";
        Cookie cookies [] = request.getCookies ();
        Cookie myCookie = null;
        if (cookies != null)
        {
            for (int i = 0; i < cookies.length; i++)
            {
                if (cookies [i].getName().equals (cookieName))
                {
                    myCookie = cookies[i];
                    break;
                }
            }
        }
        String username = null;
        if (myCookie != null) {
            username = myCookie.getValue();
        }
        return username; // jforum username
    }

    public boolean isSessionValid(UserSession userSession, RequestContext request) {
        String cookieName = "JForumSSO";
        Cookie cookies [] = request.getCookies ();
        Cookie SSOCookie = null;
        if (cookies != null)
        {
            for (int i = 0; i < cookies.length; i++)
            {
                if (cookies [i].getName().equals (cookieName))
                {
                    SSOCookie = cookies[i];
                    break;
                }
            }
        }
        String remoteUser = null;
        if (SSOCookie != null) {
              remoteUser = SSOCookie.getValue(); //  jforum username
        }

        // user has since logged out
        if(remoteUser == null && userSession.getUserId() != SystemGlobals.getIntValue(ConfigKeys.ANONYMOUS_USER_ID)) {
                return false;
        // user has since logged in
        }
        else if(remoteUser != null && userSession.getUserId() == SystemGlobals.getIntValue(ConfigKeys.ANONYMOUS_USER_ID)) {
                return false;
        // user has changed user
        }
        else if(remoteUser != null && !remoteUser.equals(userSession.getUsername())) {
              return false;
        }
        return true; // myapp user and forum user the same
     }
}

