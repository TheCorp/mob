package com.mob.dao;

import com.mob.model.flag.Flag;




public interface FlagDao {
    Flag findForKey(String key);
}
