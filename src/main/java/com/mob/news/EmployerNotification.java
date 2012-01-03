package com.mob.news;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Mar 11, 2009
 * Time: 9:44:37 PM
 * To change this template use File | Settings | File Templates.
 */
public class EmployerNotification implements Serializable {
    private EmployerNotificationType notificationType;
    private long notifier;
    private long notificationEventId;
    private long[] notified;

    public EmployerNotification(long notificationEventId, EmployerNotificationType notificationType, long[] notified, long notifier) {
        this.notificationEventId = notificationEventId;
        this.notificationType = notificationType;
        this.notified = notified;
        this.notifier = notifier;
    }

    public long getNotificationEventId() {
        return notificationEventId;
    }

    public EmployerNotificationType getNotificationType() {
        return notificationType;
    }

    public long[] getNotified() {
        return notified;
    }

    public long getNotifier() {
        return notifier;
    }
}
