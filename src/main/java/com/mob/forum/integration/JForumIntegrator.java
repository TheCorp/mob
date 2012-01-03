package com.mob.forum.integration;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mob.forum.JForumExecutionContext;
import com.mob.forum.SessionFacade;
import com.mob.forum.context.JForumContext;
import com.mob.forum.context.RequestContext;
import com.mob.forum.context.ResponseContext;
import com.mob.forum.context.web.WebRequestContext;
import com.mob.forum.context.web.WebResponseContext;
import com.mob.forum.util.preferences.ConfigKeys;
import com.mob.forum.util.preferences.SystemGlobals;

import freemarker.template.SimpleHash;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Feb 3, 2009
 * Time: 12:44:55 AM
 * To change this template use File | Settings | File Templates.
 */
public class JForumIntegrator {

    /**
     * @see javax.servlet.http.HttpServlet#service(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    public void createContext(long userId,
                                     HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException
    {
            JForumContext forumContext = null;
            RequestContext request = null;
            ResponseContext response = null;
            String encoding = SystemGlobals.getValue(ConfigKeys.ENCODING);
            try {
                // Initializes the execution context
                JForumExecutionContext ex = JForumExecutionContext.get();

                request = new WebRequestContext(req);
                response = new WebResponseContext(res);

                forumContext = new JForumContext(request.getContextPath(),
                    SystemGlobals.getValue(ConfigKeys.SERVLET_EXTENSION),
                    request,
                    response
                );
                ex.setForumContext(forumContext);

                JForumExecutionContext.set(ex);

                // Setup stuff
                SimpleHash context = JForumExecutionContext.getTemplateContext();

//                ControllerUtils utils = new ControllerUtils();
//                utils.refreshSession();

                context.put("logged", SessionFacade.isLogged());

                // Process security data
//                SecurityRepository.load(SessionFacade.getUserSession().getUserId());
            }
            catch (Exception e) {
                throw new RuntimeException(e);
            }
            finally {
            }
        }
}
