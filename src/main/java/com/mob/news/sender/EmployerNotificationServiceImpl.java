package com.mob.news.sender;

import com.mob.news.EmployerNotificationService;
import com.mob.news.EmployerNotification;
import com.mob.news.EmployerNotificationType;
import org.springframework.jms.core.JmsTemplate102;
import org.springframework.jms.core.MessageCreator;

import javax.jms.Message;
import javax.jms.Session;
import javax.jms.JMSException;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Mar 15, 2009
 * Time: 5:30:18 PM
 * To change this template use File | Settings | File Templates.
 */
public class EmployerNotificationServiceImpl implements EmployerNotificationService {
    private JmsTemplate102 jmsTemplate102;
    private String destinationQueueName;

    public void setDestinationQueueName(String destinationQueueName) {
        this.destinationQueueName = destinationQueueName;
    }

    public void setJmsTemplate102(JmsTemplate102 jmsTemplate102) {
        this.jmsTemplate102 = jmsTemplate102;
    }

    public void messageRecieved(long[] recievers, long messageId, long senderId) {
        final EmployerNotification notification = new EmployerNotification(messageId,
                EmployerNotificationType.EMPLOYER_MESSAGE_RECIEVED,recievers,senderId);

        jmsTemplate102.send(destinationQueueName, new MessageCreator() {
		      public Message createMessage(Session session) throws JMSException {
		        return session.createObjectMessage(notification);
		      }
		    });
     }

    public void opportunityAppliedFor(long opportunityId, long employeeWhoApplied) {
        final EmployerNotification notification = new EmployerNotification(opportunityId,
                 EmployerNotificationType.OPPORTUNITY_APPLIED,null,employeeWhoApplied);

         jmsTemplate102.send(destinationQueueName, new MessageCreator() {
               public Message createMessage(Session session) throws JMSException {
                 return session.createObjectMessage(notification);
               }
             });
    }

    public void opportunityMarked(long opportunityId, long employeeWhoMarked) {
        final EmployerNotification notification = new EmployerNotification(opportunityId,
                  EmployerNotificationType.OPPORTUNITY_MARKED_AS_FAVORITE,null,employeeWhoMarked);

          jmsTemplate102.send(destinationQueueName, new MessageCreator() {
                public Message createMessage(Session session) throws JMSException {
                  return session.createObjectMessage(notification);
                }
              });
    }
}
