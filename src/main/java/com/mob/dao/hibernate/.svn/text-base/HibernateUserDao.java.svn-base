package com.mob.dao.hibernate;

import java.util.List;

import org.acegisecurity.userdetails.UserDetails;
import org.acegisecurity.userdetails.UsernameNotFoundException;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mob.dao.UserDao;
import com.mob.model.User;
import com.mob.util.MOBLogger;

public class HibernateUserDao 
	extends HibernateDaoSupport
	implements UserDao {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(HibernateUserDao.class);


	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException, DataAccessException {
		// TODO Auto-generated method stub
        try{
            String query = "from User u join fetch u.roles where u.email like :email and u.flagdelete=false";
            List<User> users = getHibernateTemplate().
            	findByNamedParam(query,"email",username);  //To change body of implemented methods use File | Settings | File Templates.

            UserDetails user = null;
            if(users != null && !users.isEmpty()){
                user = users.get(0);
            }
            if(user == null){
            	LOGGER.info("Invalid User Name");
               // throw new UsernameNotFoundException("Invalid User Name");
            }
            return user;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
	}

}
