package com.mob.services.impl;

import com.mob.dao.BaseDao;
import com.mob.dao.GroupMobDao;
import com.mob.dao.MessagingDao;
import com.mob.dao.ProfileDao;
import com.mob.group.service.GroupService;
import com.mob.model.Inbox;
import com.mob.model.SentBox;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.group.Group;
import com.mob.model.group.GroupJoinUsers;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.MessagingService;
import com.mob.services.NewsManager;
import com.mob.util.MOBLogger;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.MessagingException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


public class MessagingServiceImpl implements MessagingService {

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
            new MOBLogger(MessagingServiceImpl.class);

    private MessagingDao messagingDao;
    private MailSender mailSender;
    private BaseService<SentBox> sentBoxService;
    private BaseService<Inbox> inboxBaseService;
    private BaseService<Profile> profileBaseService;
    private NewsManager newsManager;
    private GroupMobDao groupdao;
    private BaseDao<GroupJoinUsers> baseGroupJoinUsersDao;
    
    
    public void setNewsManager(NewsManager newsManager) {
        this.newsManager = newsManager;
    }

    public void setInboxBaseService(BaseService<Inbox> inboxBaseService) {
        this.inboxBaseService = inboxBaseService;
    }

    public void setSentBoxService(BaseService<SentBox> sentBoxService) {
        this.sentBoxService = sentBoxService;
    }

    public List findListEmailMessages(long id) {
        // TODO Auto-generated method stub
        return messagingDao.findListEmailMessages(id);
    }

    public MessagingDao getMessagingDao() {
        return messagingDao;
    }

    public void setMessagingDao(MessagingDao messagingDao) {
        this.messagingDao = messagingDao;
    }

    public User findMsgReceiverUser(String email) {
        // TODO Auto-generated method stub
        return messagingDao.findMsgReceiverUser(email);
    }

    public List findInboxListEmailMessages(long id) {
        // TODO Auto-generated method stub
        return messagingDao.findInboxListEmailMessages(id);
    }

    public List findEmprInboxListEmailMessages(long id) {
        // TODO Auto-generated method stub
        return messagingDao.findEmprInboxListEmailMessages(id);
    }

    public Employer findEmplrMsgReceiverUser(String emprEmail) {
        // TODO Auto-generated method stub
        return messagingDao.findEmplrMsgReceiverUser(emprEmail);
    }

    @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
    public void sendEmail(String fromAddress, String[] toAddress, String messageSubject,
                          String messageBody)
            throws MessagingException {
        LOGGER.info("in MessagingServiceImpl --> sendEmail --> before Sending email");
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(fromAddress);
        message.setTo(toAddress);
        message.setSubject(messageSubject);
        message.setText(messageBody);
        try {
            mailSender.send(message);
        }
        catch (MailException ex) {
            //log it and go on
            throw new MessagingException(ex.getMessage());
        }
        LOGGER.info("in MessagingServiceImpl --> sendEmail --> after Sending email");
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
    public void sendEmail(String fromAddress, String[] toAddress, String[] ccAddress,
                          String[] bccAddress, String messageSubject, String messageBody)
            throws MessagingException {
        LOGGER.info("in MessagingServiceImpl --> sendEmail --> before Sending email");
        //To change body of implemented methods use File | Settings | File Templates.
        SimpleMailMessage message = new SimpleMailMessage();
        //message.setFrom(fromAddress);
        message.setTo(toAddress);
        message.setCc(ccAddress);
        message.setBcc(bccAddress);
        message.setSubject(messageSubject);
        message.setText(messageBody);
        try {
            mailSender.send(message);
        }
        catch (MailException ex) {
            //log it and go on
            throw new MessagingException(ex.getMessage());
        }
        LOGGER.info("in MessagingServiceImpl --> sendEmail --> after Sending email");
    }

    public MailSender getMailSender() {
        return mailSender;
    }

    public void setMailSender(MailSender mailSender) {
        this.mailSender = mailSender;
    }

    public List findUnreadEmailMsgList(long id, boolean unreadMsgid) {
        // TODO Auto-generated method stub
        return messagingDao.findUnreadEmailMsgList(id, unreadMsgid);
    }

    public List findContactsList(long id) {
        // TODO Auto-generated method stub
        return messagingDao.findContactsList(id);
    }

    public User findEmployerMsgReceiverUser(String organizationName) {
        // TODO Auto-generated method stub
        return messagingDao.findEmployerMsgReceiverUser(organizationName);
    }

    public User findContactsUser(String contactName) {
        // TODO Auto-generated method stub
        return messagingDao.findContactsUser(contactName);
    }

    public List findContactNames(long id) {
        // TODO Auto-generated method stub
        return messagingDao.findContactNames(id);
    }

    public Profile findContactsProfileById(long id) {
        // TODO Auto-generated method stub
        return messagingDao.findContactsProfileById(id);
    }

    public Profile findAssociatedProfile(long id) {
        // TODO Auto-generated method stub
        return messagingDao.findAssociatedProfile(id);
    }

    public int findNumberOfMessagesInProfile(Profile profile) {
        return new Long(messagingDao.countMessagesForProfile(profile)).intValue();
    }

    public int findNumberOfUnreadMessagesInProfile(Profile profile) {
        return new Long(messagingDao.findUreadMessageCountForProfile(profile)).intValue();
    }


    /**
     * Employer sending a message
     *
     * @param user
     * @param emprEmailSubject
     * @param emprEmailContent
     * @param contacts
     */
    @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
    public void sendEmprMessageToContacts(User user, String emprEmailSubject,
                                          String emprEmailContent, long[] contacts, Profile senderOwnerProfile) {
        // To change body of implemented methods use File | Settings | File
        // Templates.
        Date emailDate = new Date();
        if (contacts != null) {
            ArrayList<String> recieverEmailIds = new ArrayList<String>(
                    contacts.length);
            long[] recieverIds = new long[contacts.length];
            for (int i = 0; i < contacts.length; i++) {
            	Profile senderOwnerUserProfile=new Profile();
                User recieverUser = findContactsUserById(contacts[i]);
                Profile profileOwner = findContactsProfileById(contacts[i]);
                Profile associatedOwnerProfile = findAssociatedProfile(contacts[i]);
                senderOwnerUserProfile=profileBaseService.findByPrimaryKey(senderOwnerUserProfile, senderOwnerProfile.getId());
                System.out.println("senderOwnerUserProfile in sendEmprMessageToContacts" +senderOwnerUserProfile.getId());
                SentBox sentBox = new SentBox();
                sentBox.setSentBoxOwner(user);
                sentBox.setEmailTo(recieverUser.getDisplayName());
                sentBox.setEmailSubject(emprEmailSubject);
                sentBox.setEmailContent(emprEmailContent);
                sentBox.setEmailSendDate(emailDate);
                sentBox.setProfileName(profileOwner.getName());
                sentBoxService.create(sentBox);

                Inbox inbox = new Inbox();

                recieverEmailIds.add(recieverUser.getEmail());
                recieverIds[i] = recieverUser.getId();
                inbox.setInboxOwner(recieverUser);
                inbox.setSentboxOwner(user);
                inbox.setSubject(emprEmailSubject);
                inbox.setMessage(emprEmailContent);
                inbox.setReceivedDate(emailDate);
                inbox.setProfileOwner(profileOwner);
                inbox.setAssociatedOwnerProfile(senderOwnerUserProfile);
                inboxBaseService.create(inbox);

            }
            try {
                sendEmail(user.getUsername(), recieverEmailIds
                        .toArray(new String[0]), emprEmailSubject,
                        emprEmailContent);
                LOGGER.info("Message created, notifying");
                if (this.newsManager != null) {
                    this.newsManager.messageRecieved(user.getId(), recieverIds, -1);
                }
            } catch (MessagingException e) {
                // TODO: handle exception
                LOGGER.error(e);
            }
        }
    }

    /**
     * Employee sending a message
     *
     * @param sender
     * @param subject
     * @param content
     * @param contacts
     */
    @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
    public void sendEmpMessageToContacts(User sender, String subject, String content, long[] contacts,
                                         Profile senderProfile) {
        //To change body of implemented methods use File | Settings | File Templates.
        Date emailDate = new Date();
        System.out.println("senderProfile getId" +senderProfile.getId());
        if (contacts != null) {
            ArrayList<String> resultArray = new ArrayList<String>();
            long[] recieverIds = new long[contacts.length];
            for (int i = 0; i < contacts.length; i++) {
            	Profile  senderOwnerProfile= new Profile();
                User recieverUser = findContactsUserById(contacts[i]);
                /**
                 * ReceiverOwnerProfile is  the owner profile(Logged in User  profile)
                 */
                Profile profile = findContactsProfileById(contacts[i]);
                Profile associatedOwnerProfile = findAssociatedProfile(contacts[i]);
                /**
                 * senderOwnerProfile is  the owner profile(Logged in User  profile)
                 */
                senderOwnerProfile=profileBaseService.findByPrimaryKey(senderOwnerProfile, senderProfile.getId());
                System.out.println("associatedOwnerProfile" +associatedOwnerProfile.getId());
                System.out.println("senderProfile senderOwnerProfile:" +senderOwnerProfile.getId());
                SentBox sentBox = new SentBox();
                sentBox.setSentBoxOwner(sender);
                //sentBox.setEmailTo(associatedProfileOwner.getName());
                sentBox.setEmailSubject(subject);
                sentBox.setEmailContent(content);
                sentBox.setEmailSendDate(emailDate);
                sentBox.setProfileName(profile.getName());
                sentBoxService.create(sentBox);

                Inbox inbox = new Inbox();
                recieverIds[i] = recieverUser.getId();
                resultArray.add(recieverUser.getEmail());
                inbox.setInboxOwner(recieverUser);
                inbox.setSentboxOwner(sender);
                inbox.setSubject(subject);
                inbox.setMessage(content);
                inbox.setReceivedDate(emailDate);
                inbox.setProfileOwner(profile);
                inbox.setAssociatedOwnerProfile(senderOwnerProfile);

                inboxBaseService.create(inbox);
            }
            try {
                sendEmail(sender.getUsername(), resultArray.toArray(new String[0]), subject, content);
                LOGGER.info("Message created, notifying");
                if (this.newsManager != null) {
                    this.newsManager.messageRecieved(sender.getId(), recieverIds, -1);
                }
            } catch (MessagingException e) {
                // TODO: handle exception
                LOGGER.error(e);
            }

        }
    }

    @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
    public void sendEmpReplyMessageToContacts(User user, User inboxOwner, Profile profileOwner, Profile associatedOwnerProfile, String subject,
                                              String content, long[] contacts) {
        Date emailDate = new Date();
        if (contacts != null) {
            ArrayList<String> resultArray = new ArrayList<String>();
            for (int i = 0; i < contacts.length; i++) {
                User receiverUser = findContactsUserById(contacts[i]);
                Profile profile = findContactsProfileById(contacts[i]);
                Profile associatedProfile = findAssociatedProfile(contacts[i]);
                SentBox sentBox = new SentBox();
                sentBox.setSentBoxOwner(user);
                sentBox.setEmailSendDate(emailDate);
                //sentBox.setEmailTo(associatedProfile.getName());
                sentBox.setEmailSubject(subject);
                sentBox.setEmailContent(content);
                sentBox.setProfileName(profile.getName());

                Inbox inbox = new Inbox();
                inbox.setInboxOwner(receiverUser);
                resultArray.add(receiverUser.getEmail());
                LOGGER.info("Result Array:" + resultArray);
                inbox.setSentboxOwner(user);
                inbox.setSubject(subject);
                inbox.setMessage(content);
                inbox.setReceivedDate(emailDate);
                inbox.setProfileOwner(profile);
                inbox.setAssociatedOwnerProfile(associatedProfile);

                inboxBaseService.create(inbox);
                sentBoxService.create(sentBox);

                try {
                    sendEmail(user.getUsername(), resultArray
                            .toArray(new String[0]), subject, content);
                    if (this.newsManager != null) {
                        this.newsManager.messageRecieved(user.getId(), new long[]{receiverUser.getId()}, -1);
                    }
                } catch (MessagingException e) {
                    // TODO: handle exception
                    LOGGER.error(e);
                }
            }
        }

        if (inboxOwner != null) {

            ArrayList<String> resultArray = new ArrayList<String>();
            SentBox sentBox = new SentBox();
            sentBox.setSentBoxOwner(user);
            sentBox.setEmailSendDate(emailDate);
            //sentBox.setEmailTo(associatedProfileOwner.getName());
            sentBox.setEmailSubject(subject);
            sentBox.setEmailContent(content);
            sentBox.setProfileName(associatedOwnerProfile.getName());

            Inbox inbox = new Inbox();
            inbox.setInboxOwner(inboxOwner);
            resultArray.add(inboxOwner.getEmail());
            LOGGER.info("Result Array:" + resultArray);
            inbox.setSentboxOwner(user);
            inbox.setSubject(subject);
            inbox.setMessage(content);
            inbox.setReceivedDate(emailDate);
            inbox.setProfileOwner(associatedOwnerProfile);
            inbox.setAssociatedOwnerProfile(profileOwner);
            inboxBaseService.create(inbox);
            sentBoxService.create(sentBox);

            try {
                sendEmail(user.getUsername(), resultArray
                        .toArray(new String[0]), subject, content);
            } catch (MessagingException e) {
                // TODO: handle exception
                LOGGER.error(e);
            }
        }


    }


    @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
    public void sendEmprReplyMessageToContacts(User user, User inboxOwner, Profile profileOwner,
                                               Profile associatedOwnerProfile, String subject,
                                               String content, long[] contacts) {
        System.out.println("In sendEmprReplyMessageToContacts:-");
        Date emailDate = new Date();
        if (contacts != null) {
            ArrayList<String> resultArray = new ArrayList<String>();
            for (int i = 0; i < contacts.length; i++) {
                User receiverUser = findContactsUserById(contacts[i]);
                Profile profile = findContactsProfileById(contacts[i]);
                Profile associatedProfile = findAssociatedProfile(contacts[i]);
                SentBox sentBox = new SentBox();
                sentBox.setSentBoxOwner(user);
                sentBox.setEmailSendDate(emailDate);
                sentBox.setEmailTo(receiverUser.getDisplayName());
                sentBox.setEmailSubject(subject);
                sentBox.setEmailContent(content);
                sentBox.setProfileName(profile.getName());


                Inbox inbox = new Inbox();

                inbox.setInboxOwner(receiverUser);
                resultArray.add(receiverUser.getEmail());
                inbox.setSentboxOwner(user);
                inbox.setSubject(subject);
                inbox.setMessage(content);
                inbox.setReceivedDate(emailDate);
                inbox.setProfileOwner(profile);
                inbox.setAssociatedOwnerProfile(associatedProfile);

                inboxBaseService.create(inbox);
                sentBoxService.create(sentBox);

                try {
                    sendEmail(user.getUsername(), resultArray
                            .toArray(new String[0]), subject, content);
                    LOGGER.info("Message created, notifying");
                    if (this.newsManager != null) {
                        this.newsManager.messageRecieved(user.getId(), new long[]{receiverUser.getId()}, -1);
                    }
                } catch (MessagingException e) {
                    // TODO: handle exception
                    LOGGER.error(e);
                }
            }
        }

        if (inboxOwner != null) {
            ArrayList<String> resultArray = new ArrayList<String>();
            SentBox sentBox = new SentBox();
            sentBox.setSentBoxOwner(user);
            sentBox.setEmailSendDate(emailDate);
            sentBox.setEmailTo(inboxOwner.getDisplayName());
            sentBox.setEmailSubject(subject);
            sentBox.setEmailContent(content);
            sentBox.setProfileName(associatedOwnerProfile.getName());

            Inbox inbox = new Inbox();

            inbox.setInboxOwner(inboxOwner);
            resultArray.add(inboxOwner.getEmail());
            inbox.setSentboxOwner(user);
            inbox.setSubject(subject);
            inbox.setMessage(content);
            inbox.setReceivedDate(emailDate);
            inbox.setProfileOwner(associatedOwnerProfile);
            inbox.setAssociatedOwnerProfile(profileOwner);

            inboxBaseService.create(inbox);
            sentBoxService.create(sentBox);

            try {
                sendEmail(user.getUsername(), resultArray
                        .toArray(new String[0]), subject, content);
                if (this.newsManager != null) {
                    this.newsManager.messageRecieved(user.getId(), new long[]{inboxOwner.getId()}, -1);
                }
            } catch (MessagingException e) {
                // TODO: handle exception
                LOGGER.error(e);
            }
        }

    }

    private ProfileDao profileDao;

    public void setProfileDao(ProfileDao profileDao) {
        this.profileDao = profileDao;
    }

    public void sendMessage(Profile associatedSenderProfile, Profile recieverProfile,
                            String subject, String message) throws MessagingException {
        //To change body of implemented methods use File | Settings | File Templates.
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(System.currentTimeMillis());
        Date emailDate = cal.getTime();
        User sender = this.profileDao.findProfileOwner(associatedSenderProfile);
        User reciever = this.profileDao.findProfileOwner(recieverProfile);
        SentBox sentBox = new SentBox();
        sentBox.setSentBoxOwner(sender);
        sentBox.setEmailTo(reciever.getDisplayName());
        sentBox.setEmailSubject(subject);
        sentBox.setEmailContent(message);
        sentBox.setEmailSendDate(emailDate);
        sentBox.setProfileName(recieverProfile.getName());
        sentBoxService.create(sentBox);

        Inbox inbox = new Inbox();

        // This is the reciever
        inbox.setInboxOwner(reciever);
        // This is the sender
        inbox.setSentboxOwner(sender);
        inbox.setSubject(subject);
        inbox.setMessage(message);
        inbox.setReceivedDate(emailDate);

        // This is the profile of the reciever with which the message will be associated
        inbox.setProfileOwner(recieverProfile);
        // This is the profile from which the sender is sending message
        inbox.setAssociatedOwnerProfile(associatedSenderProfile);
        inboxBaseService.create(inbox);

        try {
            sendEmail(sender.getUsername(), new String[]{reciever.getUsername()}, subject,
                    message);
            if (this.newsManager != null) {
                this.newsManager.messageRecieved(sender.getId(), new long[]{reciever.getId()}, -1);
            }
        } catch (MessagingException e) {
            // TODO: handle exception
            LOGGER.error(e);
        }
    }


    public User findContactsUserById(long contactId) {
        // TODO Auto-generated method stub
        return messagingDao.findContactsUserById(contactId);
    }


    public  void sendmessageFromGroupForJoin(User sender,Profile profileOwner, Profile profile,Group group,String message){
    	Calendar cal = Calendar.getInstance();
    	cal.setTimeInMillis(System.currentTimeMillis());
    	Date emailDate = cal.getTime();
    	/* User recieverUser = findContactsUserById(contacts[i]);
         Profile profile = findContactsProfileById(contacts[i]);
         Profile associatedOwnerProfile = findAssociatedProfile(contacts[i]);*/
    	ArrayList<String> resultArray = new ArrayList<String>();
    	SentBox sentBox = new SentBox();
    	sentBox.setSentBoxOwner(sender);
    	//sentBox.setEmailTo(associatedProfileOwner.getName());
    	sentBox.setEmailSubject(message);
    	sentBox.setEmailContent(message);
    	sentBox.setEmailSendDate(emailDate);
    	sentBox.setProfileName(profileOwner.getName());
    	sentBoxService.create(sentBox);

    	Inbox inbox = new Inbox();
    	inbox.setInboxOwner(profileOwner.getProfileOwner());
    	inbox.setSentboxOwner(sender);
    	inbox.setSubject(message);
    	inbox.setMessage(message);
    	inbox.setMessageStatus("Pending");
    	inbox.setReceivedDate(emailDate);
    	inbox.setProfileOwner(profileOwner);
    	inbox.setAssociatedOwnerProfile(profile);
    	/**
    	 * Checking  for  group  type  for  sending invitation  to  join  the  group
    	 */
    	inbox.setMessageType(1);
    	inboxBaseService.create(inbox);

    }


    public void updateInboxMessageRequest(User user, Inbox inbox) {
    	// TODO Auto-generated method stub
    	Inbox  existingInbox= new Inbox();
    	GroupJoinUsers groupJoinusers= new GroupJoinUsers();
    	existingInbox=inboxBaseService.findByPrimaryKey(existingInbox, inbox.getId());
    	existingInbox.setMessageType(0);
    	existingInbox.setMessageStatus("Accepted");
    	System.out.println("existingInbox.getProfileOwner()" +existingInbox.getProfileOwner().getId());
    	groupJoinusers=groupdao.findProfile(groupJoinusers,existingInbox.getAssociatedOwnerProfile().getId());
    	System.out.println("Group Join users  get Id:"+groupJoinusers.getProfile().getId());
    	//groupJoinusers.setGroupType(true);
    	sendReplyMessageRequest(user,existingInbox);
    	groupdao.updateGroupUsers(groupJoinusers.getProfile().getId());
    	//baseGroupJoinUsersDao.update(groupJoinusers);
    	inboxBaseService.update(existingInbox);


    }
    private void sendReplyMessageRequest(User user, Inbox existingInbox) {
    	// TODO Auto-generated method stub
    	Calendar cal = Calendar.getInstance();
    	cal.setTimeInMillis(System.currentTimeMillis());
    	Date emailDate = cal.getTime();
    	String message="Re:Your request has been  accepted";
    	SentBox sentBox = new SentBox();
    	sentBox.setSentBoxOwner(user);
    	sentBox.setEmailSendDate(emailDate);
    	sentBox.setEmailSubject(message);
    	sentBox.setEmailContent(message);
    	sentBox.setProfileName(existingInbox.getAssociatedOwnerProfile().getName());

    	Inbox newInbox = new Inbox();
    	newInbox.setInboxOwner(existingInbox.getAssociatedOwnerProfile().getProfileOwner());
    	newInbox.setSentboxOwner(user);
    	newInbox.setSubject(message);
    	newInbox.setMessage(message);
    	newInbox.setReceivedDate(emailDate);
    	newInbox.setProfileOwner(existingInbox.getAssociatedOwnerProfile());
    	newInbox.setAssociatedOwnerProfile(existingInbox.getProfileOwner());
    	inboxBaseService.create(newInbox);
    	sentBoxService.create(sentBox);
    }

	public void rejectInboxMessageRequest(User user, Inbox inbox) {
		// TODO Auto-generated method stub
		Inbox  existingInbox= new Inbox();
		GroupJoinUsers groupJoinusers= new GroupJoinUsers();
		existingInbox=inboxBaseService.findByPrimaryKey(existingInbox, inbox.getId());
		existingInbox.setMessageType(0);
		existingInbox.setMessageStatus("Rejected");
		groupJoinusers=groupdao.findProfile(groupJoinusers,existingInbox.getAssociatedOwnerProfile().getId());
		sendRejectReplyMessageRequest(user, existingInbox);
		//groupJoinusers.setGroupType(true);
		//groupdao.updateGroupUsers(groupJoinusers.getProfile().getId());
		//baseGroupJoinUsersDao.update(groupJoinusers);
		inboxBaseService.update(existingInbox);
	}

	
	 private void sendRejectReplyMessageRequest(User user, Inbox existingInbox) {
	    	// TODO Auto-generated method stub
	    	Calendar cal = Calendar.getInstance();
	    	cal.setTimeInMillis(System.currentTimeMillis());
	    	Date emailDate = cal.getTime();
	    	String message="Re:Your request has been  rejected";
	    	SentBox sentBox = new SentBox();
	    	sentBox.setSentBoxOwner(user);
	    	sentBox.setEmailSendDate(emailDate);
	    	sentBox.setEmailSubject(message);
	    	sentBox.setEmailContent(message);
	    	sentBox.setProfileName(existingInbox.getAssociatedOwnerProfile().getName());

	    	Inbox newInbox = new Inbox();
	    	newInbox.setInboxOwner(existingInbox.getAssociatedOwnerProfile().getProfileOwner());
	    	newInbox.setSentboxOwner(user);
	    	newInbox.setSubject(message);
	    	newInbox.setMessage(message);
	    	newInbox.setReceivedDate(emailDate);
	    	newInbox.setProfileOwner(existingInbox.getAssociatedOwnerProfile());
	    	newInbox.setAssociatedOwnerProfile(existingInbox.getProfileOwner());
	    	inboxBaseService.create(newInbox);
	    	sentBoxService.create(sentBox);
	    }

	
	public void setGroupdao(GroupMobDao groupdao) {
		this.groupdao = groupdao;
	}

	public BaseDao<GroupJoinUsers> getBaseGroupJoinUsersDao() {
		return baseGroupJoinUsersDao;
	}

	public void setBaseGroupJoinUsersDao(
			BaseDao<GroupJoinUsers> baseGroupJoinUsersDao) {
		this.baseGroupJoinUsersDao = baseGroupJoinUsersDao;
	}

	public BaseService<Profile> getProfileBaseService() {
		return profileBaseService;
	}

	public void setProfileBaseService(BaseService<Profile> profileBaseService) {
		this.profileBaseService = profileBaseService;
	}
    
    
    
}
