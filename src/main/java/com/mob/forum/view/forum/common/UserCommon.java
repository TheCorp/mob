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
 * Created on 29/11/2004 23:07:10
 * The JForum Project
 * http://www.jforum.net
 */
package com.mob.forum.view.forum.common;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.mob.forum.JForumExecutionContext;
import com.mob.forum.SessionFacade;
import com.mob.forum.context.RequestContext;
import com.mob.forum.dao.DataAccessDriver;
import com.mob.forum.dao.UserDAO;
import com.mob.forum.entities.User;
import com.mob.forum.util.I18n;
import com.mob.forum.util.MD5;
import com.mob.forum.util.SafeHtml;
import com.mob.forum.util.image.ImageUtils;
import com.mob.forum.util.legacy.commons.fileupload.FileItem;
import com.mob.forum.util.preferences.ConfigKeys;
import com.mob.forum.util.preferences.SystemGlobals;
import com.mob.util.MOBLogger;

/**
 * @author Rafael Steil
 * @version $Id: UserCommon.java,v 1.29 2007/09/19 14:08:57 rafaelsteil Exp $
 */
public class UserCommon
{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger logger =
        new MOBLogger(UserCommon.class);


	/**
	 * Updates the user information
	 *
	 * @param userId int The user id we are saving
     * @return List
	 */
	public static List saveUser(int userId)
	{
		List errors = new ArrayList();

		UserDAO um = DataAccessDriver.getInstance().newUserDAO();
		User u = um.selectById(userId);

		RequestContext request = JForumExecutionContext.getRequest();
		boolean isAdmin = SessionFacade.getUserSession().isAdmin();

		if (isAdmin) {
			String username = request.getParameter("username");

			if (username != null) {
				u.setUsername(username.trim());
			}

			if (request.getParameter("rank_special") != null) {
				u.setRankId(request.getIntParameter("rank_special"));
			}
		}

		SafeHtml safeHtml = new SafeHtml();

		u.setId(userId);
		u.setIcq(safeHtml.makeSafe(request.getParameter("icq")));
		u.setAim(safeHtml.makeSafe(request.getParameter("aim")));
		u.setMsnm(safeHtml.makeSafe(request.getParameter("msn")));
		u.setYim(safeHtml.makeSafe(request.getParameter("yim")));
		u.setFrom(safeHtml.makeSafe(request.getParameter("location")));
		u.setOccupation(safeHtml.makeSafe(request.getParameter("occupation")));
		u.setInterests(safeHtml.makeSafe(request.getParameter("interests")));
		u.setBiography(safeHtml.makeSafe(request.getParameter("biography")));
		u.setSignature(safeHtml.makeSafe(request.getParameter("signature")));
		u.setViewEmailEnabled(request.getParameter("viewemail").equals("1"));
		u.setViewOnlineEnabled(request.getParameter("hideonline").equals("0"));
		u.setNotifyPrivateMessagesEnabled(request.getParameter("notifypm").equals("1"));
		u.setNotifyOnMessagesEnabled(request.getParameter("notifyreply").equals("1"));
		u.setAttachSignatureEnabled(request.getParameter("attachsig").equals("1"));
		u.setHtmlEnabled(request.getParameter("allowhtml").equals("1"));
		u.setLang(request.getParameter("language"));
		u.setBbCodeEnabled("1".equals(request.getParameter("allowbbcode")));
		u.setSmiliesEnabled("1".equals(request.getParameter("allowsmilies")));
		u.setNotifyAlways("1".equals(request.getParameter("notify_always")));
		u.setNotifyText("1".equals(request.getParameter("notify_text")));

		String website = safeHtml.makeSafe(request.getParameter("website"));
		if (!StringUtils.isEmpty(website) && !website.toLowerCase().startsWith("http://")) {
			website = "http://" + website;
		}

		u.setWebSite(website);

		String currentPassword = request.getParameter("current_password");
		boolean isCurrentPasswordEmpty = currentPassword == null || "".equals(currentPassword.trim());

		if (isAdmin || !isCurrentPasswordEmpty) {
			if (!isCurrentPasswordEmpty) {
				currentPassword = MD5.crypt(currentPassword);
			}

			if (isAdmin || u.getPassword().equals(currentPassword)) {
				u.setEmail(safeHtml.makeSafe(request.getParameter("email")));

				String newPassword = request.getParameter("new_password");

				if (newPassword != null && newPassword.length() > 0) {
					u.setPassword(MD5.crypt(newPassword));
				}
			}
			else {
				errors.add(I18n.getMessage("User.currentPasswordInvalid"));
			}
		}

		if (request.getParameter("avatardel") != null) {
			File f = new File(SystemGlobals.getApplicationPath() + "/images/avatar/"+ u.getAvatar());
			f.delete();

			u.setAvatar(null);
		}

		if (request.getObjectParameter("avatar") != null) {
			try {
				UserCommon.handleAvatar(u);
			}
			catch (Exception e) {
				logger.error("Problems while uploading the avatar: " );
				errors.add(I18n.getMessage("User.avatarUploadError"));
			}
		} else if (SystemGlobals.getBoolValue(ConfigKeys.AVATAR_ALLOW_EXTERNAL_URL)) {
			String avatarUrl = request.getParameter("avatarUrl");
			if (!StringUtils.isEmpty(avatarUrl)) {
				if (avatarUrl.toLowerCase().startsWith("http://")) {
					u.setAvatar(avatarUrl);
				}
				else {
					errors.add(I18n.getMessage("User.avatarUrlShouldHaveHttp"));
				}
			}
		}

		if (errors.size() == 0) {
			um.update(u);
		}

		if (SessionFacade.getUserSession().getUserId() == userId) {
		    SessionFacade.getUserSession().setLang(u.getLang());
		}
		return errors;
	}

	/**
	 * @param u User
	 */
	private static void handleAvatar(User u)
	{
		String fileName = MD5.crypt(Integer.toString(u.getId()));
		FileItem item = (FileItem)JForumExecutionContext.getRequest().getObjectParameter("avatar");
		UploadUtils uploadUtils = new UploadUtils(item);

		// Gets file extension
		String extension = uploadUtils.getExtension().toLowerCase();
		int type = ImageUtils.IMAGE_UNKNOWN;

		if (extension.equals("jpg") || extension.equals("jpeg")) {
			type = ImageUtils.IMAGE_JPEG;
		}
		else if (extension.equals("gif") || extension.equals("png")) {
			type = ImageUtils.IMAGE_PNG;
		}

		if (type != ImageUtils.IMAGE_UNKNOWN) {
			String avatarTmpFileName = SystemGlobals.getApplicationPath()
				+ "/images/avatar/"
				+ fileName
				+ "_tmp."
				+ extension;

			// We cannot handle gifs
			if (extension.toLowerCase().equals("gif")) {
				extension = "png";
			}

			String avatarFinalFileName = SystemGlobals.getApplicationPath()
				+ "/images/avatar/"
				+ fileName
				+ "."
				+ extension;

			uploadUtils.saveUploadedFile(avatarTmpFileName);

			// OK, time to check and process the avatar size
			int maxWidth = SystemGlobals.getIntValue(ConfigKeys.AVATAR_MAX_WIDTH);
			int maxHeight = SystemGlobals.getIntValue(ConfigKeys.AVATAR_MAX_HEIGHT);

			BufferedImage image = ImageUtils.resizeImage(avatarTmpFileName, type, maxWidth, maxHeight);
			ImageUtils.saveImage(image, avatarFinalFileName, type);

			u.setAvatar(fileName + "." + extension);

			// Delete the temporary file
			new File(avatarTmpFileName).delete();
		}
	}
}
