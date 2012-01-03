package com.mob.dao.hibernate;


import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mob.dao.HelpDao;
import com.mob.model.help.Help;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Oct 5, 2009
 * Time: 3:19:37 PM
 * To change this template use File | Settings | File Templates.
 */
public class HelpHibernateDao extends HibernateDaoSupport implements HelpDao {
    public Help findForKey(long key) {
        try{
            String hql = "from Help where id like ?";
            List<Help> helps = getHibernateTemplate().find(hql,key);
            if(helps != null && !helps.isEmpty()){
                return helps.get(0);
            }
            return null;
        }catch(Exception e){
           
            logger.error(e.getMessage());
            return null;
        }
    }
}
