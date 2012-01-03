package com.mob.flag.services.impl;


import com.mob.dao.FlagDao;
import com.mob.flag.services.FlagService;
import com.mob.model.flag.Flag;

import java.util.List;


public class FlagServiceImpl implements FlagService {
	
    private FlagDao flagDao;

  

    public Flag getHelpForKey(String key) {
        Flag help = flagDao.findForKey(key);
        
        return help;
        //To change body of implemented methods use File | Settings | File Templates.
    }



	public FlagDao getFlagDao() {
		return flagDao;
	}



	public void setFlagDao(FlagDao flagDao) {
		this.flagDao = flagDao;
	}
}
