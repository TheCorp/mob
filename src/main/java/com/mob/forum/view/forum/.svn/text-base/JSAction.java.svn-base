/*
 * Created on 27/06/2005 00:20:38
 */
package com.mob.forum.view.forum;

import com.mob.forum.Command;
import com.mob.forum.JForumExecutionContext;
/**
 * Loads and parse javascript files with FTL statements.
 *
 * @author Rafael Steil
 * @version $Id: JSAction.java,v 1.5 2006/08/20 12:19:16 sergemaslyukov Exp $
 */
public class JSAction extends Command
{
	/**
	 * Loads and parses a javascript file.
	 * The filename should be into the "js" directory and should
	 * have the extension ".js".
	 * @see com.mob.forum.Command#list()
	 */
	public void list()
	{
		JForumExecutionContext.setContentType("text/javascript");

		String filename = this.request.getParameter("js");

		this.templateName = "js/" + filename + ".js";
	}
}
