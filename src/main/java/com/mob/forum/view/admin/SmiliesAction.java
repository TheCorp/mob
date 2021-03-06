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
 * This file creation date: 13/01/2004 / 18:45:31
 * The JForum Project
 * http://www.jforum.net
 */
package com.mob.forum.view.admin;

import java.io.File;

import com.mob.forum.dao.DataAccessDriver;
import com.mob.forum.dao.SmilieDAO;
import com.mob.forum.entities.Smilie;
import com.mob.forum.repository.SmiliesRepository;
import com.mob.forum.util.MD5;
import com.mob.forum.util.legacy.commons.fileupload.FileItem;
import com.mob.forum.util.preferences.ConfigKeys;
import com.mob.forum.util.preferences.SystemGlobals;
import com.mob.forum.util.preferences.TemplateKeys;
import com.mob.forum.view.forum.common.UploadUtils;

/**
 * @author Rafael Steil
 * @version $Id: SmiliesAction.java,v 1.15 2006/08/20 22:47:44 rafaelsteil Exp $
 */
public class SmiliesAction extends AdminCommand
{
	private String processUpload()
	{
		String imgName = "";

		if (this.request.getObjectParameter("smilie_img") != null) {
			FileItem item = (FileItem)this.request.getObjectParameter("smilie_img");
			UploadUtils uploadUtils = new UploadUtils(item);

			imgName = MD5.crypt(item.getName());

			uploadUtils.saveUploadedFile(SystemGlobals.getApplicationPath()
					+ "/"
					+ SystemGlobals.getValue(ConfigKeys.SMILIE_IMAGE_DIR)
					+ "/"
					+ imgName + "." + uploadUtils.getExtension());

			imgName += "." + uploadUtils.getExtension();
		}

		return imgName;
	}

	public void insert()
	{
		this.setTemplateName(TemplateKeys.SMILIES_INSERT);
		this.context.put("action", "insertSave");
	}

	public void insertSave()
	{
		Smilie s = new Smilie();
		s.setCode(this.request.getParameter("code"));

		String imgName = this.processUpload();
		s.setUrl(SystemGlobals.getValue(ConfigKeys.SMILIE_IMAGE_PATTERN).replaceAll("#IMAGE#", imgName));

		s.setDiskName(imgName);

		DataAccessDriver.getInstance().newSmilieDAO().addNew(s);

		SmiliesRepository.loadSmilies();
		this.list();
	}

	public void edit()
	{
		int id = 1;

		if (this.request.getParameter("id") != null) {
			id = this.request.getIntParameter("id");
		}

		this.setTemplateName(TemplateKeys.SMILIES_EDIT);
		this.context.put("smilie", DataAccessDriver.getInstance().newSmilieDAO().selectById(id));
		this.context.put("action", "editSave");
	}

	public void editSave()
	{
		Smilie s = DataAccessDriver.getInstance().newSmilieDAO().selectById(this.request.getIntParameter("id"));
		s.setCode(this.request.getParameter("code"));

		if (this.request.getObjectParameter("smilie_img") != null) {
			String imgName = this.processUpload();
			s.setUrl(SystemGlobals.getValue(ConfigKeys.SMILIE_IMAGE_PATTERN).replaceAll("#IMAGE#", imgName));
			s.setDiskName(imgName);
		}

		DataAccessDriver.getInstance().newSmilieDAO().update(s);

		SmiliesRepository.loadSmilies();
		this.list();
	}

	public void delete()
	{
		String[] ids = this.request.getParameterValues("id");

		if (ids != null) {
			SmilieDAO dao = DataAccessDriver.getInstance().newSmilieDAO();

			for (int i = 0; i < ids.length; i++) {
				int id = Integer.parseInt(ids[i]);

				Smilie s = dao.selectById(id);
				dao.delete(id);

				File f = new File(SystemGlobals.getApplicationPath()
						+ "/"
						+ SystemGlobals.getValue(ConfigKeys.SMILIE_IMAGE_DIR)
						+ "/"
						+ s.getDiskName());

				if (f.exists()) {
					f.delete();
				}
			}
		}

		SmiliesRepository.loadSmilies();
		this.list();
	}

	/**
	 * @see com.mob.forum.Command#list()
	 */
	public void list()
	{
		this.context.put("smilies", SmiliesRepository.getSmilies());
		this.setTemplateName(TemplateKeys.SMILIES_LIST);
	}
}
