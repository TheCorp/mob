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
 * Created on Dec 29, 2004 1:29:52 PM
 * The JForum Project
 * http://www.jforum.net
 */
package com.mob.forum.dao.generic;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mob.forum.JForumExecutionContext;
import com.mob.forum.entities.Config;
import com.mob.forum.exceptions.DatabaseException;
import com.mob.forum.util.DbUtils;
import com.mob.forum.util.preferences.SystemGlobals;

/**
 * @author Rafael Steil
 * @version $Id: GenericConfigDAO.java,v 1.8 2006/08/23 02:13:42 rafaelsteil Exp $
 */
public class GenericConfigDAO implements com.mob.forum.dao.ConfigDAO
{
	/**
	 * @see com.mob.forum.dao.ConfigDAO#insert(com.mob.forum.entities.Config)
	 */
	public void insert(Config config)
	{
		PreparedStatement p = null;
		try {
			p = JForumExecutionContext.getConnection().prepareStatement(SystemGlobals.getSql("ConfigModel.insert"));
			p.setString(1, config.getName());
			p.setString(2, config.getValue());
			p.executeUpdate();
		}
		catch (SQLException e) {
			throw new DatabaseException(e);
		}
		finally {
			DbUtils.close(p);
		}
	}

	/**
	 * @see com.mob.forum.dao.ConfigDAO#update(com.mob.forum.entities.Config)
	 */
	public void update(Config config)
	{
		PreparedStatement p = null;
		try {
			p = JForumExecutionContext.getConnection().prepareStatement(SystemGlobals.getSql("ConfigModel.update"));
			p.setString(1, config.getValue());
			p.setString(2, config.getName());
			p.executeUpdate();
		}
		catch (SQLException e) {
			throw new DatabaseException(e);
		}
		finally {
			DbUtils.close(p);
		}
	}

	/**
	 * @see com.mob.forum.dao.ConfigDAO#delete(com.mob.forum.entities.Config)
	 */
	public void delete(Config config)
	{
		PreparedStatement p = null;
		try {
			p = JForumExecutionContext.getConnection().prepareStatement(SystemGlobals.getSql("ConfigModel.delete"));
			p.setInt(1, config.getId());
			p.executeUpdate();
		}
		catch (SQLException e) {
			throw new DatabaseException(e);
		}
		finally {
			DbUtils.close(p);
		}
	}

	/**
	 * @see com.mob.forum.dao.ConfigDAO#selectAll()
	 */
	public List selectAll()
	{
		List l = new ArrayList();

		PreparedStatement p = null;
		ResultSet rs = null;
		try {
			p = JForumExecutionContext.getConnection().prepareStatement(SystemGlobals.getSql("ConfigModel.selectAll"));
			rs = p.executeQuery();
			while (rs.next()) {
				l.add(this.makeConfig(rs));
			}

			return l;
		}
		catch (SQLException e) {
			throw new DatabaseException(e);
		}
		finally {
			DbUtils.close(rs, p);
		}
	}

	/**
	 * @see com.mob.forum.dao.ConfigDAO#selectByName(java.lang.String)
	 */
	public Config selectByName(String name)
	{
		PreparedStatement p = null;
		ResultSet rs = null;
		try {
			p = JForumExecutionContext.getConnection().prepareStatement(
					SystemGlobals.getSql("ConfigModel.selectByName"));
			p.setString(1, name);
			rs = p.executeQuery();
			Config c = null;

			if (rs.next()) {
				c = this.makeConfig(rs);
			}

			return c;
		}
		catch (SQLException e) {
			throw new DatabaseException(e);
		}
		finally {
			DbUtils.close(rs, p);
		}
	}

	protected Config makeConfig(ResultSet rs) throws SQLException
	{
		Config c = new Config();
		c.setId(rs.getInt("config_id"));
		c.setName(rs.getString("config_name"));
		c.setValue(rs.getString("config_value"));

		return c;
	}
}
