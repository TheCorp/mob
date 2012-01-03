package com.mob.integration;

import java.util.List;

import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.profile.Profile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Feb 2, 2009
 * Time: 4:45:55 PM
 * To change this template use File | Settings | File Templates.
 */
public interface UserDataIntegrator {
    void employeeRegistered(User user,
                        HttpServletRequest req, HttpServletResponse res);
    void employerRegistered(Employer employer,
                        HttpServletRequest req, HttpServletResponse res);

    void userLoggedIn(long userId, HttpServletRequest req, HttpServletResponse res);

    void profileCreated(long userId, String profileName, HttpServletRequest req, HttpServletResponse res);
    void profileSetAsDefault(long userId, String profileName,HttpServletRequest req, HttpServletResponse res);
    
    
}
