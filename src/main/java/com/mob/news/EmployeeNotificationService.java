package com.mob.news;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Mar 11, 2009
 * Time: 9:32:46 PM
 * To change this template use File | Settings | File Templates.
 */
public interface EmployeeNotificationService {
    public void messageRecieved(long[] recievers, long messageId, long senderId);
    public void profileViewedByEmployer(long[] employeeWhoseProfileViewed, long employerViewingProfile);
    public void profileMarkedAsFavByEmployer(long[] employeeWhoseProfileMarked, long employerMarkingProfile);
}
