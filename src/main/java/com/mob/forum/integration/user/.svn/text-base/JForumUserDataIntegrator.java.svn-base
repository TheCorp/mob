package com.mob.forum.integration.user;

import com.mob.forum.ControllerUtils;
import com.mob.forum.JForumExecutionContext;
import com.mob.forum.SessionFacade;
import com.mob.forum.dao.DataAccessDriver;
import com.mob.forum.dao.UserDAO;
import com.mob.forum.dao.UserSessionDAO;
import com.mob.forum.entities.User;
import com.mob.forum.entities.UserSession;
import com.mob.forum.integration.JForumIntegrator;
import com.mob.forum.repository.SecurityRepository;
import com.mob.forum.util.I18n;
import com.mob.forum.util.MD5;
import com.mob.forum.util.preferences.ConfigKeys;
import com.mob.forum.util.preferences.SystemGlobals;
import com.mob.integration.UserDataIntegrator;
import com.mob.model.employer.Employer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Feb 3, 2009
 * Time: 12:48:13 AM
 * To change this template use File | Settings | File Templates.
 */
public class JForumUserDataIntegrator extends JForumIntegrator implements UserDataIntegrator {

    public void employeeRegistered(com.mob.model.User user, HttpServletRequest req,
                               HttpServletResponse res) {
        //To change body of implemented methods use File | Settings | File Templates.
        try {
            super.createContext(user.getId(),req,res);
            insertSave(user.getId(),new Long(user.getId()).toString(),user.getPassword(),user.getEmail());
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } finally{
            try {
                handleFinally();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

    }

    public void employerRegistered(Employer user, HttpServletRequest req,
                               HttpServletResponse res) {
        //To change body of implemented methods use File | Settings | File Templates.
        try {
            super.createContext(user.getId(),req,res);
            insertSave(user.getId(),user.getOrganizationName(),user.getPassword(),user.getUsername());
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } finally{
            try {
                handleFinally();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

    }

    public void userLoggedIn(long userId, HttpServletRequest req, HttpServletResponse res) {
        //To change body of implemented methods use File | Settings | File Templates.
        try {
            try {
                super.createContext(userId,req,res);
            } catch (IOException e) {
                throw new RuntimeException(e);
                //To change body of catch statement use File | Settings | File Templates.
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
            UserDAO dao = DataAccessDriver.getInstance().newUserDAO();
            int id = new Long(userId).intValue();
            User user = dao.selectById(id);

            if (user != null) {
                SessionFacade.makeLogged();

                String sessionId = SessionFacade.isUserInSession(user.getId());
                UserSession userSession = new UserSession();

                // Remove the "guest" session
                SessionFacade.remove(userSession.getSessionId());

                userSession.dataToUser(user);

                UserSession currentUs = SessionFacade.getUserSession(sessionId);

                // Check if the user is returning to the system
                // before its last session has expired ( hypothesis )
                UserSession tmpUs;
                if (sessionId != null && currentUs != null) {
                    // Write its old session data
                    SessionFacade.storeSessionData(sessionId, JForumExecutionContext.getConnection());
                    tmpUs = new UserSession(currentUs);
                    SessionFacade.remove(sessionId);
                }
                else {
                    UserSessionDAO sm = DataAccessDriver.getInstance().newUserSessionDAO();
                    tmpUs = sm.selectById(userSession, JForumExecutionContext.getConnection());
                }

                I18n.load(user.getLang());

                if (tmpUs == null) {
                    userSession.setLastVisit(new Date(System.currentTimeMillis()));
                }
                else {
                    // Update last visit and session start time
                    userSession.setLastVisit(new Date(tmpUs.getStartTime().getTime() + tmpUs.getSessionTime()));
                }

                SessionFacade.add(userSession);
                SessionFacade.setAttribute(ConfigKeys.TOPICS_READ_TIME, new HashMap());
                ControllerUtils.addCookie(SystemGlobals.getValue(ConfigKeys.COOKIE_NAME_DATA),
                    Integer.toString(user.getId()));

                SecurityRepository.load(user.getId(), true);
             }
        } finally{
            try {
                handleFinally();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public void profileCreated(long userId, String profileName,HttpServletRequest req, HttpServletResponse res) {
        try {
            try {
                super.createContext(userId,req,res);
            } catch (IOException e) {
                throw new RuntimeException(e);
                //To change body of catch statement use File | Settings | File Templates.
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
            UserDAO dao = DataAccessDriver.getInstance().newUserDAO();
            User u = dao.selectById(new Long(userId).intValue());
            u.setUsername(profileName);
            dao.update(u);

            try {
                if(SessionFacade.getUserSession() != null){
                    SessionFacade.getUserSession().setUsername(profileName);
                }
            } catch (Exception e) {
                
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            try {
                handleFinally();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public void profileSetAsDefault(long userId, String profileName,HttpServletRequest req, HttpServletResponse res) {
        try {
            try {
                super.createContext(userId,req,res);
            } catch (IOException e) {
                throw new RuntimeException(e);
                //To change body of catch statement use File | Settings | File Templates.
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
            UserDAO dao = DataAccessDriver.getInstance().newUserDAO();
            User u = dao.selectById(new Long(userId).intValue());
            u.setUsername(profileName);
            dao.update(u);
            try {
                if(SessionFacade.getUserSession() != null){
                    SessionFacade.getUserSession().setUsername(profileName);
                }
            } catch (Exception e) {

            }         } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            try {
                handleFinally();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public void insertSave(long userId, String username, String password, String email)
	{
		User u = new User();
		UserDAO dao = DataAccessDriver.getInstance().newUserDAO();

		if (username != null) {
			username = username.trim();
		}

		u.setUsername(username);
		u.setPassword(MD5.crypt(password));
		u.setEmail(email);
        int newUserId = new Long(userId).intValue();
        u.setId(newUserId);
		dao.addNewWithId(u);

		this.logNewRegisteredUserIn(newUserId, u);
        dao.writeUserActive(newUserId);
	}

    private void logNewRegisteredUserIn(int userId, User u)
	{
		SessionFacade.makeLogged();

		UserSession userSession = new UserSession();
		userSession.setAutoLogin(true);
		userSession.setUserId(userId);
		userSession.setUsername(u.getUsername());
		userSession.setLastVisit(new Date(System.currentTimeMillis()));
		userSession.setStartTime(new Date(System.currentTimeMillis()));

		SessionFacade.add(userSession);
	}

    private void handleFinally() throws IOException
	{
		JForumExecutionContext.finish();
	}
}
