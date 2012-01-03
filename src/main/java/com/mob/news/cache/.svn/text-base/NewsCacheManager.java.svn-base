package com.mob.news.cache;

import com.mob.model.User;
import com.mob.news.reciever.NotificationListener;
import com.mob.util.MOBLogger;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.HashMap;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Mar 13, 2009
 * Time: 2:14:35 AM
 * To change this template use File | Settings | File Templates.
 */
public class NewsCacheManager implements HttpSessionListener {
    
	private static final MOBLogger LOGGER = new MOBLogger(NewsCacheManager.class);
	private static HashMap<Long, HttpSession> userIdVsSession = new HashMap<Long,HttpSession>();
    private static HashMap<HttpSession, Long> sessionVsUserId = new HashMap<HttpSession,Long>();


    public void sessionCreated(HttpSessionEvent se) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    public void sessionDestroyed(HttpSessionEvent se) {
        //To change body of implemented methods use File | Settings | File Templates.
        HttpSession session = se.getSession();
        if (session!=null) {
        	long userIdForSession = sessionVsUserId.get(session);
            sessionVsUserId.remove(session);
            userIdVsSession.remove(userIdForSession);
		}
    }

    /**
     * Once a user logs in, this method will be invoked to store the details in the cache
     * @param session
     * @param user
     */
    public static void addSessionForUser(HttpSession session, User user, NewsCache cache){
        userIdVsSession.put(user.getId(),session);
        sessionVsUserId.put(session,user.getId());
        session.setAttribute("cache",cache);
    }

    public static void updateCache(long cacheOwnerId, String news){
    	LOGGER.info("cacheOwnerId while updating cache---:"+cacheOwnerId);
        HttpSession session = userIdVsSession.get(cacheOwnerId);
        NewsCache cache = (NewsCache) session.getAttribute("cache");
        cache.addNews(news);
//        session.removeAttribute("cache");
//        session.setAttribute("cache",cache);
    }

    public static NewsCache obtainCacheFor(long cacheOwnerId){
        HttpSession session = userIdVsSession.get(cacheOwnerId);
        NewsCache cache = (NewsCache) session.getAttribute("cache");
        return cache;        
    }
}
