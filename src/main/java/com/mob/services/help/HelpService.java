package com.mob.services.help;

import com.mob.model.help.Help;



/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Oct 2, 2009
 * Time: 4:55:41 PM
 * To change this template use File | Settings | File Templates.
 */
public interface HelpService {
    Help getHelpForKey(String key);
}
