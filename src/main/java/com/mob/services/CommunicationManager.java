package com.mob.services;

import com.mob.model.Inbox;
import com.mob.model.Message;
import com.mob.model.Notification;
import com.mob.model.SentBox;
import com.mob.model.User;

public interface CommunicationManager {
	public void sentNotification(Notification notice);
	public void sendMessage(Message message);
	public Inbox returnInboxForUser(User user);
	public SentBox returnSentBoxForUser(User user);
}
