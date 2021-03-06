/*
 * Copyright (c) JForum Team
 *
 * All rights reserved.
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
 * Created on 05/06/2004 14:49:22
 * The JForum Project
 * http://www.jforum.net
 */
package com.mob.forum.util.preferences;

import org.apache.log4j.Logger;

import com.mob.forum.util.FileChangeListener;
import com.mob.util.MOBLogger;

/**
 * @author Rafael Steil
 * @version $Id: QueriesFileListener.java,v 1.8 2006/08/23 02:13:57 rafaelsteil Exp $
 */
public class QueriesFileListener implements FileChangeListener
{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger logger =
        new MOBLogger(QueriesFileListener.class);


	/**
	 * @see com.mob.forum.util.FileChangeListener#fileChanged(java.lang.String)
	 */
	public void fileChanged(String filename)
	{
        logger.info("Reloading "+ filename);
        SystemGlobals.loadQueries(filename);

        String driverQueries = SystemGlobals.getValue(ConfigKeys.SQL_QUERIES_DRIVER);

        // Force reload of driver specific queries
        if (!filename.equals(driverQueries)) {
            SystemGlobals.loadQueries(driverQueries);
        }
	}

}
