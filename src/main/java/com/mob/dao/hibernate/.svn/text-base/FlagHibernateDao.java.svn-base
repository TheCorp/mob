package com.mob.dao.hibernate;



import org.apache.log4j.Logger;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mob.dao.FlagDao;
import com.mob.model.flag.Flag;

import java.util.List;

public class FlagHibernateDao extends HibernateDaoSupport implements FlagDao {
	
    public Flag findForKey(String key) {
        try{
            String hql = "from Flag where key like ?";
            List<Flag> helps = getHibernateTemplate().find(hql,key);
            if(helps != null && !helps.isEmpty()){
                return helps.get(0);
            }
            return null;
        }catch(Exception e){
           
           e.printStackTrace();
            return null;
        }
    }

	
}
