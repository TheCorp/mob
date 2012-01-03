package com.mob.services.help.impl;


import java.util.List;

import com.mob.dao.HelpDao;
import com.mob.model.help.Help;
import com.mob.services.help.HelpService;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Oct 2, 2009
 * Time: 4:58:53 PM
 * To change this template use File | Settings | File Templates.
 */
public class HelpServiceImpl implements HelpService {
    private HelpDao helpDao;

    public void setHelpDao(HelpDao helpDao) {
        this.helpDao = helpDao;
    }

    public Help getHelpForKey(String key) {
        Help help = helpDao.findForKey(new Long(key));
        
        return help;
        //To change body of implemented methods use File | Settings | File Templates.
    }
}
