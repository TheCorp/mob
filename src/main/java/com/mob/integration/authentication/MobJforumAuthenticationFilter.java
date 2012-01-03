package com.mob.integration.authentication;

import com.mob.authentication.MobAuthenticationFilter;
import com.mob.integration.IntegrationPoint;
import com.mob.integration.IntegrationPointListener;
import com.mob.integration.UserDataIntegrator;
import com.mob.model.User;
import com.mob.util.MOBLogger;
import org.acegisecurity.Authentication;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * This class allows integration with the JForum authentication processing.
 *
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Feb 4, 2009
 * Time: 10:26:46 AM
 * To change this template use File | Settings | File Templates.
 */
public class MobJforumAuthenticationFilter extends MobAuthenticationFilter {

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(MobJforumAuthenticationFilter.class);

    private IntegrationPoint integrationPoint;

    public void setIntegrationPoint(IntegrationPoint integrationPoint) {
        this.integrationPoint = integrationPoint;
    }

    
    protected void onSuccessfulAuthentication(HttpServletRequest request,
              HttpServletResponse response, Authentication authResult)
            throws IOException {
    	LOGGER.info("Inside onSuccessfulAuthentication");
        super.onSuccessfulAuthentication(request, response, authResult);
        //To change body of overridden methods use File | Settings | File Templates.
        informIntegrationPoint((User) authResult.getPrincipal(), request, response);
    }

    private void informIntegrationPoint(User user, HttpServletRequest request, HttpServletResponse response) {
    	LOGGER.info("Inside informIntegrationPoint");
        List<IntegrationPointListener> listeners = this.integrationPoint.getListeners();
        for (IntegrationPointListener listener : listeners) {
            UserDataIntegrator userIntegrator = listener.getUserDataIntegrator();
            userIntegrator.userLoggedIn(user.getId(),
                    request, response);
        }
    }

}
