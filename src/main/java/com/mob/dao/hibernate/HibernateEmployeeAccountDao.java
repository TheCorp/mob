package com.mob.dao.hibernate;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mob.dao.EmployeeAccountDao;
import com.mob.model.User;
import com.mob.util.MOBLogger;

public class HibernateEmployeeAccountDao extends HibernateDaoSupport implements EmployeeAccountDao {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(HibernateEmployeeAccountDao.class);

	public User findByEmployeePrimaryKey(User user, long id) {
		// TODO Auto-generated method stub
		LOGGER.info("HibernateEmployerImpl" );
		return (User) getHibernateTemplate().get(user.getClass(), id);
	}

	public void updateEmployeeAccount(User user) {
		// TODO Auto-generated method stub
		LOGGER.info("username in DAO" + user.getEmail());
		String hql = "update User set firstName=:firstName,lastName=:lastName , email=:email, city =:city, state =:state, sex=:sex,dob =:dob, address =:address where id = :id";

		Query query = getSession().createQuery(hql);
		query.setString("firstName", user.getFirstName());
		query.setString("lastName", user.getLastName());
		query.setString("email", user.getEmail());
		query.setString("city", user.getCity());
		query.setString("state", user.getState());
		query.setString("sex", user.getSex());
		query.setDate("dob", user.getDob());
		query.setString("address", user.getAddress());
		
		
		query.setLong("id", user.getId());
		query.executeUpdate();

	}

	public String findByEmailValidation(User t, String email) {
		User user;
		String query = "from User where email like :email";
		List<User> users = getHibernateTemplate().findByNamedParam(query,"email", email);
		if(users.size()==0){
			//System.out.println("user empty");
			return "true";
		}else{
		//	System.out.println("user already there");
			return "false";
		}
	}

	
	public List<User> findByEmailValidationForEdit(String email) {
		
		String query = "from User where email like :email";
		
		List<User> users = getHibernateTemplate().findByNamedParam(query,"email", email);
		
		return users;
	}

	public String findByEmpContactValidation(long id, String nickName) {
		// TODO Auto-generated method stub
		String queryString = "from Contact  c where c.nickName like  :nickName and  c.profileOwner.id= :id";
		
		List<User> users = getHibernateTemplate().findByNamedParam(queryString, new String[]{"nickName", "id"},new Object[]{nickName, id});
		if(users.size()==0){
			LOGGER.info("Conatct empty");
			return "true";
		}else{
			LOGGER.info("Contact already there");
			return "false";
		}
	}

	

}
