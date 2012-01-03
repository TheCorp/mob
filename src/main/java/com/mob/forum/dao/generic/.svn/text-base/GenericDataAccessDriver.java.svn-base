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
 * This file creation date: Mar 3, 2003 / 2:19:47 PM
 * The JForum Project
 * http://www.jforum.net
 */
package com.mob.forum.dao.generic;

import com.mob.forum.dao.ApiDAO;
import com.mob.forum.dao.AttachmentDAO;
import com.mob.forum.dao.BanlistDAO;
import com.mob.forum.dao.BannerDAO;
import com.mob.forum.dao.BookmarkDAO;
import com.mob.forum.dao.CategoryDAO;
import com.mob.forum.dao.ConfigDAO;
import com.mob.forum.dao.DataAccessDriver;
import com.mob.forum.dao.ForumDAO;
import com.mob.forum.dao.GroupDAO;
import com.mob.forum.dao.GroupSecurityDAO;
import com.mob.forum.dao.KarmaDAO;
import com.mob.forum.dao.LuceneDAO;
import com.mob.forum.dao.MailIntegrationDAO;
import com.mob.forum.dao.ModerationDAO;
import com.mob.forum.dao.ModerationLogDAO;
import com.mob.forum.dao.PollDAO;
import com.mob.forum.dao.PostDAO;
import com.mob.forum.dao.PrivateMessageDAO;
import com.mob.forum.dao.RankingDAO;
import com.mob.forum.dao.SmilieDAO;
import com.mob.forum.dao.SummaryDAO;
import com.mob.forum.dao.TopicDAO;
import com.mob.forum.dao.TreeGroupDAO;
import com.mob.forum.dao.UserDAO;
import com.mob.forum.dao.UserSessionDAO;
import com.mob.forum.dao.generic.security.GenericGroupSecurityDAO;

/**
 * @author Rafael Steil
 * @version $Id: GenericDataAccessDriver.java,v 1.16 2007/07/28 20:07:18 rafaelsteil Exp $
 */
public class GenericDataAccessDriver extends DataAccessDriver
{
	private static GroupDAO groupDao = new GenericGroupDAO();
	private static PostDAO postDao = new GenericPostDAO();
	private static PollDAO pollDao = new GenericPollDAO();
	private static RankingDAO rankingDao = new GenericRankingDAO();
	private static TopicDAO topicDao = new GenericTopicDAO();
	private static UserDAO userDao = new GenericUserDAO();
	private static TreeGroupDAO treeGroupDao = new GenericTreeGroupDAO();
	private static SmilieDAO smilieDao = new GenericSmilieDAO();
	private static GroupSecurityDAO groupSecurityDao = new GenericGroupSecurityDAO();
	private static PrivateMessageDAO privateMessageDao = new GenericPrivateMessageDAO();
	private static UserSessionDAO userSessionDao = new GenericUserSessionDAO();
	private static KarmaDAO karmaDao = new GenericKarmaDAO();
	private static BookmarkDAO bookmarkDao = new GenericBookmarkDAO();
	private static AttachmentDAO attachmentDao = new GenericAttachmentDAO();
	private static ModerationDAO moderationDao = new GenericModerationDAO();
	private static ForumDAO forumDao = new GenericForumDAO();
	private static CategoryDAO categoryDao = new GenericCategoryDAO();
	private static ConfigDAO configDao = new GenericConfigDAO();
	private static BannerDAO bannerDao = new GenericBannerDAO();
    private static SummaryDAO summaryDao = new GenericSummaryDAO();
    private static MailIntegrationDAO mailIntegrationDao = new GenericMailIntegrationDAO();
    private static ApiDAO apiDAO = new GenericApiDAO();
    private static BanlistDAO banlistDao = new GenericBanlistDAO();
    private static ModerationLogDAO moderationLogDao = new GenericModerationLogDAO();
    private static LuceneDAO luceneDao = new GenericLuceneDAO();

	/**
	 * @see com.mob.forum.dao.DataAccessDriver#getForumModel()
	 */
	public ForumDAO newForumDAO()
	{
		return forumDao;
	}

	/**
	 * @see com.mob.forum.dao.DataAccessDriver#getGroupModel()
	 */
	public GroupDAO newGroupDAO()
	{
		return groupDao;
	}

	/**
	 * @see com.mob.forum.dao.DataAccessDriver#getPostModel()
	 */
	public PostDAO newPostDAO()
	{
		return postDao;
	}

	/**
	 * @see com.mob.forum.dao.DataAccessDriver#getPollModel()
	 */
	public PollDAO newPollDAO()
	{
		return pollDao;
	}

	/**
	 * @see com.mob.forum.dao.DataAccessDriver#getRankingModel()
	 */
	public RankingDAO newRankingDAO()
	{
		return rankingDao;
	}

	/**
	 * @see com.mob.forum.dao.DataAccessDriver#getTopicModel()
	 */
	public TopicDAO newTopicDAO()
	{
		return topicDao;
	}

	/**
	 * @see com.mob.forum.dao.DataAccessDriver#getUserModel()
	 */
	public UserDAO newUserDAO()
	{
		return userDao;
	}

	/**
	 * @see com.mob.forum.dao.DataAccessDriver#newCategoryDAO()
	 */
	public CategoryDAO newCategoryDAO()
	{
		return categoryDao;
	}

	/**
	 * @see com.mob.forum.dao.DataAccessDriver#newTreeGroupDAO()
	 */
	public TreeGroupDAO newTreeGroupDAO()
	{
		return treeGroupDao;
	}

	/**
	 * @see com.mob.forum.dao.DataAccessDriver#newSmilieDAO()
	 */
	public SmilieDAO newSmilieDAO()
	{
		return smilieDao;
	}

	/**
	 * @see com.mob.forum.dao.DataAccessDriver#newGroupSecurityDAO()
	 */
	public GroupSecurityDAO newGroupSecurityDAO()
	{
		return groupSecurityDao;
	}

	/**
	 * @see com.mob.forum.dao.DataAccessDriver#newPrivateMessageDAO()
	 */
	public PrivateMessageDAO newPrivateMessageDAO()
	{
		return privateMessageDao;
	}

	/**
	 * @see com.mob.forum.dao.DataAccessDriver#newUserSessionDAO()
	 */
	public UserSessionDAO newUserSessionDAO()
	{
		return userSessionDao;
	}

	/**
	 * @see com.mob.forum.dao.DataAccessDriver#newConfigDAO()
	 */
	public ConfigDAO newConfigDAO()
	{
		return configDao;
	}

	/**
	 * @see com.mob.forum.dao.DataAccessDriver#newKarmaDAO()
	 */
	public KarmaDAO newKarmaDAO()
	{
		return karmaDao;
	}

	/**
	 * @see com.mob.forum.dao.DataAccessDriver#newBookmarkDAO()
	 */
	public BookmarkDAO newBookmarkDAO()
	{
		return bookmarkDao;
	}

	/**
	 * @see com.mob.forum.dao.DataAccessDriver#newAttachmentDAO()
	 */
	public AttachmentDAO newAttachmentDAO()
	{
		return attachmentDao;
	}

	/**
	 * @see com.mob.forum.dao.DataAccessDriver#newModerationDAO()
	 */
	public ModerationDAO newModerationDAO()
	{
		return moderationDao;
	}

    /**
     * @see com.mob.forum.dao.DataAccessDriver#newBannerDAO()
     */
	public BannerDAO newBannerDAO()
	{
		return bannerDao;
	}

    /**
     * @see com.mob.forum.dao.DataAccessDriver#newSummaryDAO()
     */
    public SummaryDAO newSummaryDAO()
    {
        return summaryDao;
    }

    /**
     * @see com.mob.forum.dao.DataAccessDriver#newMailIntegrationDAO()
     */
    public MailIntegrationDAO newMailIntegrationDAO()
    {
    	return mailIntegrationDao;
    }

    /**
     * @see com.mob.forum.dao.DataAccessDriver#newApiDAO()
     */
    public ApiDAO newApiDAO()
    {
    	return apiDAO;
    }

    /**
     * @see com.mob.forum.dao.DataAccessDriver#newBanlistDAO()
     */
    public BanlistDAO newBanlistDAO()
    {
    	return banlistDao;
    }

    /**
     * @see com.mob.forum.dao.DataAccessDriver#newModerationLogDAO()
     */
    public ModerationLogDAO newModerationLogDAO()
    {
    	return moderationLogDao;
    }

    /**
     * @see com.mob.forum.dao.DataAccessDriver#newLuceneDAO()
     */
    public LuceneDAO newLuceneDAO()
    {
    	return luceneDao;
    }
}
