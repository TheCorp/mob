package com.mob.news.reciever;

import com.mob.news.EmployeeNotification;
import com.mob.news.EmployerNotification;
import com.mob.news.reciever.employee.EmployeeNotificationHandler;
import com.mob.news.reciever.employer.EmployerNotificationHandler;
import com.mob.util.MOBLogger;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.ObjectMessage;
import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Mar 12, 2009
 * Time: 12:26:13 AM
 * To change this template use File | Settings | File Templates.
 */
public class NotificationListener implements MessageListener, ApplicationContextAware {

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
            new MOBLogger(NotificationListener.class);

    private ApplicationContext context;

    public void onMessage(Message message) {
        LOGGER.info("Recieved the message " + message);
        //To change body of implemented methods use File | Settings | File Templates.
        if (message instanceof ObjectMessage) {
            LOGGER.info("Object Message");
            ObjectMessage notificationObject = (ObjectMessage) message;
            try {
                Serializable notification = notificationObject.getObject();
                LOGGER.info("Object Message is " + notification);
                if (notification instanceof EmployeeNotification) {
                    LOGGER.info("Employee Notification");
                    handleEmployeeNotification((EmployeeNotification) notification);
                } else {
                    LOGGER.info("Employer Notification");
                    handleEmployerNotification((EmployerNotification) notification);
                }
            } catch (JMSException e) {
                LOGGER.error(e);
                throw new RuntimeException(e);
            }
        }
    }

    private void handleEmployerNotification(EmployerNotification employerNotification) {
        EmployerNotificationHandler notificationHandler = (EmployerNotificationHandler)
                context.getBean(employerNotification.getNotificationType().name());
        notificationHandler.handleEmployerNotification(employerNotification);
    }

    private void handleEmployeeNotification(EmployeeNotification employeeNotification) {
        EmployeeNotificationHandler notificationHandler = (EmployeeNotificationHandler)
                context.getBean(employeeNotification.getNotificationType().name());
        notificationHandler.handleEmployeeNotification(employeeNotification);
    }

    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        //To change body of implemented methods use File | Settings | File Templates.
        this.context = applicationContext;
    }
}
