/*
 * Copyright (c) JForum Team
 * All rights reserved.

 * Redistribution and use in source and binary forms,
 * with or without modification, are permitted provided
 * that the following conditions are met:

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
 * Created on 24/05/2004 22:36:07
 * The JForum Project
 * http://www.jforum.net
 */
package com.mob.forum.dao.sqlserver;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import com.mob.forum.JForumExecutionContext;
import com.mob.forum.exceptions.DatabaseException;
import com.mob.forum.util.DbUtils;
import com.mob.forum.util.preferences.SystemGlobals;
import com.mob.util.MOBLogger;


/**
 * @author Andre de Andrade da Silva - andre.de.andrade@gmail.com
 * @author Dirk Rasmussen - d.rasmussen@bevis.de (2007/02/19, modifs for MS SqlServer 2005)
 * @see WEB-INF\config\database\sqlserver\sqlserver.sql (2007/02/19, MS SqlServer 2005 specific version!)
 * @version $Id: SqlServerUserDAO.java,v 1.11 2007/03/03 18:33:45 rafaelsteil Exp $
 */
public class SqlServerUserDAO extends com.mob.forum.dao.generic.GenericUserDAO
{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger logger =
        new MOBLogger(SqlServerUserDAO.class);


	/**
	 * @see com.mob.forum.dao.UserDAO#selectAll(int, int)
	 */
	public List selectAll(int startFrom, int count)
	{
		PreparedStatement p = null;
		ResultSet rs = null;
		String sqlStmnt = null;

		try {
			if (count > 0) {
				sqlStmnt = SystemGlobals.getSql("UserModel.selectAllByLimit");
					logger.debug("selectAll("+startFrom+","+count+")..., sqlStmnt="+sqlStmnt);
				p = JForumExecutionContext.getConnection().prepareStatement(sqlStmnt);
				p.setInt(1, startFrom);
				p.setInt(2, startFrom+count);
			}
			else {
				sqlStmnt = SystemGlobals.getSql("UserModel.selectAll");
					logger.debug("selectAll("+startFrom+","+count+")..., sqlStmnt="+sqlStmnt);
				p = JForumExecutionContext.getConnection().prepareStatement(sqlStmnt);
			}

			rs = p.executeQuery();

			return super.processSelectAll(rs);
		}
		catch (SQLException e) {
			logger.error(sqlStmnt);
			throw new DatabaseException(e);
		}
		finally {
			DbUtils.close(rs, p);
		}
	}

	/**
	 * @see com.mob.forum.dao.UserDAO#selectAllByGroup(int, int, int)
	 */
	public List selectAllByGroup(int groupId, int startFrom, int count)
	{
		PreparedStatement p = null;
		ResultSet rs = null;
		String sqlStmnt = SystemGlobals.getSql("UserModel.selectAllByGroup");
			logger.debug("selectAllByGroup("+groupId+","+startFrom+","+count+")..., sqlStmnt="+sqlStmnt);

		try {
			p = JForumExecutionContext.getConnection().prepareStatement(sqlStmnt);
			p.setInt(1, groupId);
			p.setInt(2, startFrom);
			p.setInt(3, count);

			rs = p.executeQuery();

			return this.processSelectAll(rs);
		}
		catch (SQLException e) {
			throw new DatabaseException(e);
		}
		finally {
			DbUtils.close(rs, p);
		}
	}


	/**
	 * @see com.mob.forum.dao.UserDAO#selectAllWithKarma(int, int)
	 */
	public List selectAllWithKarma(int startFrom, int count)
	{
		return super.loadKarma(this.selectAll(startFrom, count));
	}
}
