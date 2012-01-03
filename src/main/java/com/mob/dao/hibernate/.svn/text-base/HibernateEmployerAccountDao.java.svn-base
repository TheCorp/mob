package com.mob.dao.hibernate;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mob.dao.EmployerAccountDao;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.util.MOBLogger;

public class HibernateEmployerAccountDao extends HibernateDaoSupport implements
		EmployerAccountDao {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(HibernateEmployerAccountDao.class);


	public Employer findByEmployerPrimaryKey(Employer employer, long id) {
		// TODO Auto-generated method stub
		return (Employer) getHibernateTemplate().get(employer.getClass(), id);

	}

	public void updateEmployerAccount(Employer employer) {
		// TODO Auto-generated method stub
		String hql = "update Employer set email=:email,culture=:culture,orgInfo=:orgInfo,additionalInfo=:additionalInfo,organizationName=:orgName,noOfEmployees=:noofemps,location=:loc,address=:address,zipcode=:zipcode,city=:city,state=:state where id = :id";

		Query query = getSession().createQuery(hql);
		query.setString("email", employer.getEmail());
		query.setString("culture", employer.getCulture());
		query.setString("orgInfo", employer.getOrgInfo());
		query.setString("additionalInfo",employer.getAdditionalInfo());
		query.setString("orgName", employer.getOrganizationName());
		query.setString("noofemps", employer.getNoOfEmployees());
		query.setString("loc", employer.getLocation());
		query.setString("address", employer.getAddress());		
		query.setString("zipcode", employer.getZipcode());
		query.setString("city", employer.getCity());
		query.setString("state", employer.getState());
		query.setLong("id", employer.getId());
		query.executeUpdate();
	}

	public void updateEmployerPassword(Employer employer, String newPassword) {
		String hql = "update Employer set password=:newPassword where id = :id";
		Query query = getSession().createQuery(hql);
		query.setString("newPassword",newPassword);
		query.setLong("id", employer.getId());
		query.executeUpdate();

		
	}

	public User findByUserName(User t, String email) {
		User user;
		String query = "from User where email like :email";
		List<User> users = getHibernateTemplate().findByNamedParam(query,"email", email);
		return (User) users.get(0);
	}

	public String findByEmprEmailValidation(Employer t, String email) {
		// TODO Auto-generated method stub
		LOGGER.info("Entering Method :findByEmprEmailValidation" );
		User user;
		String query = "from User where email like :email";
		List<User> users = getHibernateTemplate().findByNamedParam(query,"email", email);
		if(users.size()==0){
			LOGGER.info("user empty");
			return "true";
		}else{
			LOGGER.info("user already there");
			return "false";
		}
	}

	public String findByEmprContactValidation(long id, String nickName) {
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
