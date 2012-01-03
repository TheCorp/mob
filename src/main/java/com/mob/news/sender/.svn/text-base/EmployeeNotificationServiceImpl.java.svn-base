package com.mob.news.sender;

import com.mob.news.EmployeeNotification;
import com.mob.news.EmployeeNotificationService;
import com.mob.news.EmployeeNotificationType;
import com.mob.util.MOBLogger;
import org.springframework.jms.core.JmsTemplate102;
import org.springframework.jms.core.MessageCreator;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Mar 11, 2009
 * Time: 9:37:47 PM
 * To change this template use File | Settings | File Templates.
 */
public class EmployeeNotificationServiceImpl implements EmployeeNotificationService{
    private JmsTemplate102 jmsTemplate102;
    private String destinationQueueName;
    private static final MOBLogger LOGGER =
              new MOBLogger(EmployeeNotificationServiceImpl.class);


    public void setDestinationQueueName(String destinationQueueName) {
        this.destinationQueueName = destinationQueueName;
    }

    public void setJmsTemplate102(JmsTemplate102 jmsTemplate102) {
        this.jmsTemplate102 = jmsTemplate102;
    }

    /**
     * This method should be called to notify the reciept of email messages
     * @param recievers
     * @param messageId
     * @param senderId
     */

    public void messageRecieved(long[] recievers, long messageId, long senderId) {
        //To change body of implemented methods use File | Settings | File Templates.
        final EmployeeNotification notification = new EmployeeNotification(messageId,
                EmployeeNotificationType.EMPLOYEE_MESSAGE_RECIEVED,recievers,senderId);

        jmsTemplate102.send(destinationQueueName, new MessageCreator() {
		      public Message createMessage(Session session) throws JMSException {
		        return session.createObjectMessage(notification);
		      }
		    });
    }

    public void profileViewedByEmployer(long[] employeeWhoseProfileViewed, long employerViewingProfile) {
        LOGGER.info("Sending JMS Notification");
        final EmployeeNotification notification = new EmployeeNotification(-1,
                EmployeeNotificationType.EMPLOYER_VIEWED_PROFILE,employeeWhoseProfileViewed,employerViewingProfile);

        jmsTemplate102.send(destinationQueueName, new MessageCreator() {
		      public Message createMessage(Session session) throws JMSException {
		        return session.createObjectMessage(notification);
		      }
		    });
        LOGGER.info("Sent JMS Notification");
    }

    public void profileMarkedAsFavByEmployer(long[] employeeWhoseProfileMarked, long employerMarkingProfile) {
        final EmployeeNotification notification = new EmployeeNotification(-1,
                EmployeeNotificationType.EMPLOYER_MARKED_AS_FAVORITE,employeeWhoseProfileMarked,employerMarkingProfile);

        jmsTemplate102.send(destinationQueueName, new MessageCreator() {
		      public Message createMessage(Session session) throws JMSException {
		        return session.createObjectMessage(notification);
		      }
		    });
    }
}
