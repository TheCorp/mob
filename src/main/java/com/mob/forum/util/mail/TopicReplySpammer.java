/*
 * Copyright (c) JForum Team
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms,
 * with or without modification, are permitted provided
 * that the following conditions are met:
 *
 * 1) Redistributions of source code must retain the above
 * copyright notice, this list of conditions and the
 * following  disclaimer.
 * 2)  Redistributions in binary form must reproduce the
 * above copyright notice, this list of conditions and
 * the following disclaimer in the documentation and/or
 * other materials provided with the distribution.
 * 3) Neither the name of "Rafael Steil" nor
 * the names of its contributors may be used to endorse
 * or promote products derived from this software without
 * specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT
 * HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
 * BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 * THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
 * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
 * IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE
 *
 * This file creation date: 04/03/2004 - 20:32:13
 * The JForum Project
 * http://www.jforum.net
 */
package com.mob.forum.util.mail;

import java.text.MessageFormat;
import java.util.List;

import com.mob.forum.api.integration.mail.pop.MessageId;
import com.mob.forum.entities.Post;
import com.mob.forum.entities.Topic;
import com.mob.forum.util.preferences.ConfigKeys;
import com.mob.forum.util.preferences.SystemGlobals;
import com.mob.forum.view.forum.common.PostCommon;
import com.mob.forum.view.forum.common.ViewCommon;

import freemarker.template.SimpleHash;

/**
 * Notify users of replies to existing topics
 * @author Rafael Steil
 * @version $Id: TopicReplySpammer.java,v 1.5 2007/08/20 19:35:51 rafaelsteil Exp $
 */
public class TopicReplySpammer extends Spammer
{
	/**
	 * Creates a new instance with a message's contents send
	 * @param topic the topic we are replying to
	 * @param post the post instance, with the message's contents. If null,
	 * only a notification will be sent
	 * @param users list of users who'll be notified
	 */
	public TopicReplySpammer(Topic topic, Post post, List users)
	{
		// Make the topic url
		StringBuffer page = new StringBuffer();
		int postsPerPage = SystemGlobals.getIntValue(ConfigKeys.POSTS_PER_PAGE);

		if (topic.getTotalReplies() >= postsPerPage) {
			page.append(((topic.getTotalReplies() / postsPerPage)) * postsPerPage).append('/');
		}

		String forumLink = ViewCommon.getForumLink();

		String path = this.messageLink(topic, page, forumLink);
		String unwatch = this.unwatchLink(topic, forumLink);

		SimpleHash params = new SimpleHash();

		params.put("topic", topic);
		params.put("path", path);
		params.put("forumLink", forumLink);
		params.put("unwatch", unwatch);

		if (post != null) {
			this.setMessageId(MessageId.buildMessageId(post.getId(), topic.getId(), topic.getForumId()));

			post = PostCommon.preparePostForDisplay(post);
			params.put("message", post.getText());
		}

		this.setUsers(users);

		if (topic.getFirstPostId() != post.getId()) {
			this.setInReplyTo(MessageId.buildInReplyTo(topic));
		}

		this.setTemplateParams(params);
		String subject = SystemGlobals.getValue(ConfigKeys.MAIL_NEW_ANSWER_SUBJECT);

		this.prepareMessage(
			MessageFormat.format(subject, new Object[] { topic.getTitle() }),
			SystemGlobals.getValue(ConfigKeys.MAIL_NEW_ANSWER_MESSAGE_FILE));
	}

	/**
	 * Creates the "unwatch" link for the current topic
	 * @param topic the topic
	 * @param forumLink the forum's link
	 * @return the unwath link
	 */
	private String unwatchLink(Topic topic, String forumLink)
	{
		return new StringBuffer(128)
			.append(forumLink)
			.append("posts/unwatch/")
			.append(topic.getId())
			.append(SystemGlobals.getValue(ConfigKeys.SERVLET_EXTENSION))
			.toString();
	}

	/**
	 * Creates the link to read the message online
	 * @param topic the topic
	 * @param page the current topic's page
	 * @param forumLink the forum's link
	 * @return the link to the message
	 */
	private String messageLink(Topic topic, StringBuffer page, String forumLink)
	{
		return new StringBuffer(128)
			.append(forumLink)
			.append("posts/list/")
			.append(page.toString())
			.append(topic.getId())
			.append(SystemGlobals.getValue(ConfigKeys.SERVLET_EXTENSION))
			.append('#')
			.append(topic.getLastPostId())
			.toString();
	}
}
