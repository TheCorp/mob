package com.mob.authentication;

import com.mob.model.Role;
import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.mob.news.cache.NewsCache;
import com.mob.news.cache.NewsCacheManager;
import com.mob.services.EmployeeProfileService;
import com.mob.services.NewsManager;
import com.mob.util.MOBLogger;
import org.acegisecurity.Authentication;
import org.acegisecurity.context.SecurityContextHolder;
import org.acegisecurity.ui.webapp.AuthenticationProcessingFilter;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;
import java.util.Set;


/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Mar 13, 2009
 * Time: 2:37:03 AM
 * To change this template use File | Settings | File Templates.
 */
public class MobAuthenticationFilter extends AuthenticationProcessingFilter {
    private static final MOBLogger LOGGER =
        new MOBLogger(MobAuthenticationFilter.class);

    private NewsManager newsManager;
    private EmployeeProfileService profileServiceBean;

    protected void onSuccessfulAuthentication(HttpServletRequest request,
                                              HttpServletResponse response,
                                              Authentication authResult) throws IOException {
        super.onSuccessfulAuthentication(request, response, authResult);

        //Setting default profile as current profile as soon as user logs into account
        User user = (User) authResult.getPrincipal();
        Profile profile = profileServiceBean.getDefaultProfileForUser(user.getId());
        if (profile != null)
            request.getSession().setAttribute("currentProfile", profile.getId());

        //To change body of overridden methods use File | Settings | File Templates.
        if (newsManager != null) {
            LOGGER.info("Initializing the news cache");
            System.out.println("Initializing the news cache manager");

            User loggedinUser = (User) authResult.getPrincipal();
            NewsCache cache = newsManager.initNewsCache(loggedinUser);
            NewsCacheManager.addSessionForUser(request.getSession(), loggedinUser, cache);
        }else{
            LOGGER.info("No news manager found to initialize");
            System.out.println("Could not initialialize the news cache manager");
        }
    }

    public void setNewsManager(NewsManager newsManager) {
        this.newsManager = newsManager;
    }

    public EmployeeProfileService getProfileServiceBean() {
        return profileServiceBean;
    }

    public void setProfileServiceBean(EmployeeProfileService profileServiceBean) {
        this.profileServiceBean = profileServiceBean;
    }

    private Map<String,String> targetUrls;
    public void setTargetUrls(Map<String,String> urls){
        this.targetUrls = urls;        
    }

    protected String determineTargetUrl(HttpServletRequest request) {
        User loggedinUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Set<Role> roles = loggedinUser.getRoles();
        for(Role role:roles){
            if(role.getName().equals("ROLE_ADMIN")){
                return targetUrls.get("ROLE_ADMIN");
            }
        }
        return super.determineTargetUrl(request);
        //To change body of overridden methods use File | Settings | File Templates.
    }
    
}