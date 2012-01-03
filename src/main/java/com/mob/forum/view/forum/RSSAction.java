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
 * Created on 13/10/2004 23:47:06
 * The JForum Project
 * http://www.jforum.net
 */
package com.mob.forum.view.forum;

import java.util.List;

import com.mob.forum.Command;
import com.mob.forum.JForumExecutionContext;
import com.mob.forum.SessionFacade;
import com.mob.forum.context.RequestContext;
import com.mob.forum.context.ResponseContext;
import com.mob.forum.dao.DataAccessDriver;
import com.mob.forum.dao.PostDAO;
import com.mob.forum.dao.TopicDAO;
import com.mob.forum.entities.Forum;
import com.mob.forum.entities.Topic;
import com.mob.forum.repository.ForumRepository;
import com.mob.forum.util.I18n;
import com.mob.forum.util.preferences.ConfigKeys;
import com.mob.forum.util.preferences.SystemGlobals;
import com.mob.forum.util.preferences.TemplateKeys;
import com.mob.forum.util.rss.RSSAware;
import com.mob.forum.util.rss.RecentTopicsRSS;
import com.mob.forum.util.rss.TopicPostsRSS;
import com.mob.forum.util.rss.TopicRSS;
import com.mob.forum.view.forum.common.TopicsCommon;

import freemarker.template.SimpleHash;
import freemarker.template.Template;

/**
 * @author Rafael Steil
 * @version $Id: RSSAction.java,v 1.32 2007/09/02 14:30:48 rafaelsteil Exp $
 */
public class RSSAction extends Command
{
	/**
	 * RSS for all N first topics for some given forum
	 */
	public void forumTopics()
	{
		int forumId = this.request.getIntParameter("forum_id");

		if (!TopicsCommon.isTopicAccessible(forumId)) {
			JForumExecutionContext.requestBasicAuthentication();
            return;
		}

		List posts = DataAccessDriver.getInstance().newPostDAO().selectLatestByForumForRSS(
			forumId, SystemGlobals.getIntValue(ConfigKeys.TOPICS_PER_PAGE));

		Forum forum = ForumRepository.getForum(forumId);
		String[] p = { forum.getName() };

		RSSAware rss = new TopicRSS(I18n.getMessage("RSS.ForumTopics.title", p),
			I18n.getMessage("RSS.ForumTopics.description", p),
			forumId,
			posts);

		this.context.put("rssContents", rss.createRSS());
	}

	/**
	 * RSS for all N first posts for some given topic
	 */
	public void topicPosts()
	{
		int topicId = this.request.getIntParameter("topic_id");

		PostDAO pm = DataAccessDriver.getInstance().newPostDAO();
		TopicDAO tm = DataAccessDriver.getInstance().newTopicDAO();

		Topic topic = tm.selectById(topicId);

		if (!TopicsCommon.isTopicAccessible(topic.getForumId()) || topic.getId() == 0) {
			JForumExecutionContext.requestBasicAuthentication();
            return;
		}

		tm.incrementTotalViews(topic.getId());

		List posts = pm.selectAllByTopic(topicId);

		String[] p = { topic.getTitle() };

		String title = I18n.getMessage("RSS.TopicPosts.title", p);
		String description = I18n.getMessage("RSS.TopicPosts.description", p);

		RSSAware rss = new TopicPostsRSS(title, description, topic.getForumId(), posts);
		this.context.put("rssContents", rss.createRSS());
	}

	public void recentTopics()
	{
		String title = I18n.getMessage("RSS.RecentTopics.title",
			new Object[] { SystemGlobals.getValue(ConfigKeys.FORUM_NAME) });
		String description = I18n.getMessage("RSS.RecentTopics.description");

		List posts = DataAccessDriver.getInstance().newPostDAO().selectHotForRSS(
			SystemGlobals.getIntValue(ConfigKeys.POSTS_PER_PAGE));

		RSSAware rss = new RecentTopicsRSS(title, description, posts);
		this.context.put("rssContents", rss.createRSS());
	}

	/**
	 * @see com.mob.forum.Command#list()
	 */
	public void list()
	{

	}

	/**
	 * @see com.mob.forum.Command#process(com.mob.forum.context.RequestContext, com.mob.forum.context.ResponseContext, freemarker.template.SimpleHash)
	 */
	public Template process(RequestContext request,
			ResponseContext response,
			SimpleHash context)
	{
        if (!SessionFacade.isLogged() && UserAction.hasBasicAuthentication(request)) {
            new UserAction().validateLogin(request);
            JForumExecutionContext.setRedirect(null);
        }

        JForumExecutionContext.setContentType("text/xml");
		super.setTemplateName(TemplateKeys.RSS);

		return super.process(request, response, context);
	}

}
