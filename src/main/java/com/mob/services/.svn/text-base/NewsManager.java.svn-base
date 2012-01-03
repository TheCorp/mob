package com.mob.services;

import com.mob.model.User;
import com.mob.news.cache.NewsCache;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Mar 12, 2009
 * Time: 12:43:19 PM
 * To change this template use File | Settings | File Templates.
 */
public interface NewsManager {
    public void messageRecieved(long sender, long[] reciever, long messageId);
    public void employerViewedEmployeeProfile(long employerId, long[] employeeIds);
    public void employerMarkedEmployeeProfile(long employerId, long[] employeeIds);

    public void employeeAppliedForOpportunity(long employeeId, long opportunityId);
    public void employeeMarkedOpportunityAsFavorite(long employeeId, long opportunityId);

    public NewsCache initNewsCache(User newsOwner);
}
