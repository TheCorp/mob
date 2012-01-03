package com.mob.dao.hibernate;

import com.mob.dao.ProfileDao;
import com.mob.model.User;
import com.mob.model.profile.Education;
import com.mob.model.profile.Profile;
import com.mob.model.profile.WorkExperience;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.sql.SQLException;
import java.util.List;

public class HibernateProfileDao extends HibernateDaoSupport implements ProfileDao {

	public Profile findByProfilePrimaryKey(Profile profile, long id) {
		return (Profile) getHibernateTemplate().get(profile.getClass(), id);
	}

	public void updateEmployeePersonalDetails(Profile profile) {
		
		String hql = "update Profile set nickName=:nickName,phoneNumber=:phoneNumber,workTimeframe=:workTimeframe,daysavailable=:daysavailable,hoursavailable=:hoursavailable,skills=:skills,location=:location,occupation=:occupation where id = :id";

		Query query = getSession().createQuery(hql);
		query.setString("nickName", profile.getNickName());
		query.setString("phoneNumber", profile.getPhoneNumber());
		query.setString("occupation", profile.getOccupation());
		query.setString("workTimeframe",profile.getWorkTimeframe());
		query.setString("daysavailable", profile.getDaysavailable());
		query.setString("hoursavailable", profile.getHoursavailable());
		query.setString("skills", profile.getSkills());
		query.setString("location", profile.getLocation());
		query.setLong("id", profile.getId());
		query.executeUpdate();

	}

	public void delete(Profile profile) {
		getHibernateTemplate().delete(profile);
		
	}

    public User findProfileOwner(final Profile profile) {
        User user = (User) getHibernateTemplate().execute(new HibernateCallback(){

            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                session.lock(profile, LockMode.READ);
                User owner = profile.getProfileOwner();
                return owner;
            }
        });
        return user;
    }

    public void updateEducationDetails(Education education) {
		/*String hql = "update Education set degree=:degree,institutionName=:institutionName where id = :id";

		Query query = getSession().createQuery(hql);
		query.setString("degree", education.getDegree());
		query.setString("institutionName", education.getInstitutionName());
		query.setLong("id", education.getId());
		query.executeUpdate();*/
		
	}

	public void updateWorkExperienceDetails(WorkExperience workExperience) {
		
		String hql = "update WorkExperience set jobType=:jobType,description=:description where id = :id";

		Query query = getSession().createQuery(hql);
		query.setString("jobType", workExperience.getJobType());
		query.setString("description", workExperience.getDescription());
		query.setLong("id", workExperience.getId());
		query.executeUpdate();
	}

	public void deleteEducationDetails(Education education, long id) {
		String hql = "delete from Education where id=:id";
		Query query = getSession().createQuery(hql);
		query.setLong("id", id);
		query.executeUpdate();
	}

	public void deleteWorkExperience(WorkExperience experience, long id) {
		
		String hql = "delete from WorkExperience where id=:id";
		Query query = getSession().createQuery(hql);
		query.setLong("id", id);
		query.executeUpdate();
	}

    public Profile findProfileWithExperienceDetails(long profileId) {
        String hql = "from Profile p join fetch p.experience e where p.id like ?";
        List<Profile> profiles = getHibernateTemplate().find(hql,profileId);
        if(profiles != null && !profiles.isEmpty()){
            return profiles.get(0);
        }else{
            return null;
        }
    }

}
