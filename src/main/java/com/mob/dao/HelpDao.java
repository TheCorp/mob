package com.mob.dao;

import com.mob.model.help.Help;



/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Oct 5, 2009
 * Time: 3:18:53 PM
 * To change this template use File | Settings | File Templates.
 */
public interface HelpDao {
    Help findForKey(long key);
}
