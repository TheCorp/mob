/*
 * Created on 09/10/2006 21:30:35
 */
package com.mob.forum.api.integration.mail.pop;

import java.text.ParseException;

import org.apache.log4j.Logger;
import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.impl.StdSchedulerFactory;

import com.mob.forum.ForumStartup;
import com.mob.forum.util.preferences.ConfigKeys;
import com.mob.forum.util.preferences.SystemGlobals;
import com.mob.util.MOBLogger;

/**
 * @author Rafael Steil
 * @version $Id: POPJobStarter.java,v 1.1 2006/10/10 00:40:53 rafaelsteil Exp $
 */
public class POPJobStarter
{
	private static boolean isStarted;
	private static Scheduler scheduler;
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger logger =
        new MOBLogger(POPJobStarter.class);


	public static void startJob() throws SchedulerException
	{
		boolean isEnabled = SystemGlobals.getBoolValue(ConfigKeys.MAIL_POP3_INTEGRATION_ENABLED);

		if (!isStarted && isEnabled) {
			String filename = SystemGlobals.getValue(ConfigKeys.QUARTZ_CONFIG);

			String cronExpression = SystemGlobals.getValue("org.quartz.context.mailintegration.cron.expression");
			scheduler = new StdSchedulerFactory(filename).getScheduler();

			Trigger trigger = null;

			try {
				trigger = new CronTrigger(POPListener.class.getName(), "pop3Integration", cronExpression);
				logger.info("Starting POP3 integration expression " + cronExpression);
				scheduler.scheduleJob(new JobDetail(POPListener.class.getName(),
					"pop3Integration", POPListener.class),trigger);
				scheduler.start();
			}
			catch (ParseException e) {
				e.printStackTrace();
			}
		}

		isStarted = true;
	}
}
