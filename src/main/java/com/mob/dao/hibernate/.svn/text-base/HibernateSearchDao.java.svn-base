package com.mob.dao.hibernate;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.ParseException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.search.FullTextQuery;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mob.dao.SearchDao;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.employer.Opportunity;
import com.mob.model.group.Group;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Profile;
import com.mob.model.profile.WorkExperience;
import com.mob.util.MOBLogger;

public class HibernateSearchDao extends HibernateDaoSupport implements
		SearchDao {
	/**
	 * Logger for logging messages.
	 */
	private static final MOBLogger LOGGER = new MOBLogger(
			HibernateSearchDao.class);

	public List<Opportunity> findOpportunities(String position,
			String location, String skills, String additionalKeyword,
			String additionalSkillNames) {

		List OpportunityList = new ArrayList();
		SessionFactory sessionFactory = getHibernateTemplate()
				.getSessionFactory();
		Session session = sessionFactory.openSession();
		FullTextSession fullTextSession = Search.getFullTextSession(session);
		Transaction tx1 = fullTextSession.beginTransaction();
		List<Opportunity> opportunities = session.createQuery(
				"from Opportunity").list();
		for (Opportunity opportunity1 : opportunities) {
			fullTextSession.index(opportunity1);
		}

		MultiFieldQueryParser parser = new MultiFieldQueryParser(new String[] {
				"title", "skillsNeeded", "str_location" },
				new StandardAnalyzer());

		org.apache.lucene.search.Query q = null;

		if (!position.equals("") && !skills.equals("") && !location.equals("")) {//when all the values are present
			try {
				q = parser
						.parse(new String[] { position, location, skills },
								new String[] { "title", "str_location",
										"skillsNeeded" },
								new StandardAnalyzer());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			org.hibernate.Query hibQuery = fullTextSession.createFullTextQuery(
					q, Opportunity.class);
			List result = hibQuery.list();
			OpportunityList = result;
		} else if (!position.equals("") && !location.equals("")
				&& skills.equals("")) {//when only skill value is not present

			try {
				q = parser.parse(new String[] { position, location },
						new String[] { "title", "str_location" },
						new StandardAnalyzer());

			} catch (ParseException e) {
				e.printStackTrace();
			}

			org.hibernate.Query hibQuery = fullTextSession.createFullTextQuery(
					q, Opportunity.class);
			List result = hibQuery.list();
			OpportunityList = result;

		} else if (!position.equals("") && location.equals("")
				&& !skills.equals("")) {
			//search wrt position and skills

			try {
				q = parser.parse(new String[] { position, skills },
						new String[] { "title", "skillsNeeded" },
						new StandardAnalyzer());

			} catch (ParseException e) {
				e.printStackTrace();
			}
			org.hibernate.Query hibQuery = fullTextSession.createFullTextQuery(
					q, Opportunity.class);
			List result = hibQuery.list();
			OpportunityList = result;
		} else if (position.equals("") && !location.equals("")
				&& !skills.equals("")) {//search wrt location and skills

			try {
				q = parser.parse(new String[] { location, skills },
						new String[] { "str_location", "skillsNeeded" },
						new StandardAnalyzer());

			} catch (ParseException e) {
				e.printStackTrace();
			}
			org.hibernate.Query hibQuery = fullTextSession.createFullTextQuery(
					q, Opportunity.class);
			List result = hibQuery.list();
			OpportunityList = result;

		} else if (!position.equals("") && location.equals("")
				&& skills.equals("")) {//search for position

			try {
				//q = parser.parse(new String[] { position },new String[] { "title" }, new StandardAnalyzer());
				String titles = position + "*";
				q = parser.parse("title:" + titles);

			} catch (ParseException e) {
				e.printStackTrace();
			}
			if (additionalKeyword.equals("")) {
				org.hibernate.Query hibQuery = fullTextSession
						.createFullTextQuery(q, Opportunity.class);
				List result = hibQuery.list();
				OpportunityList = result;
			} else {

				try {
					FullTextQuery hibQuery = fullTextSession
							.createFullTextQuery(q, Opportunity.class);
					List list = hibQuery.list();

					hibQuery.enableFullTextFilter("keyword").setParameter(
							"advancedKeyword", additionalKeyword);
					List filterList = hibQuery.list();

					if (list != null) {
						list.removeAll(filterList);
						filterList.addAll(list);
						list = filterList;
					} else {
						list = filterList;
					}

					OpportunityList = list;

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} else if (position.equals("") && !location.equals("")
				&& skills.equals("")) {//search for location

			try {
				q = parser
						.parse(new String[] { location },
								new String[] { "str_location" },
								new StandardAnalyzer());

			} catch (ParseException e) {
				e.printStackTrace();
			}
			org.hibernate.Query hibQuery = fullTextSession.createFullTextQuery(
					q, Opportunity.class);
			List result = hibQuery.list();
			OpportunityList = result;

		} else if (position.equals("") && location.equals("")
				&& !skills.equals("")) {

			List result = new ArrayList();
			String strSkill = null;

			if (skills.contains(",")) {

				strSkill = skills.replaceAll(",", " ");

			} else {
				strSkill = skills;

			}

			try {
				q = parser.parse("skillsNeeded:" + strSkill);

			} catch (ParseException e) {

				e.printStackTrace();
			}

			try {

				if (additionalSkillNames.equals("")) {

					FullTextQuery hibQuery = fullTextSession
							.createFullTextQuery(q, Opportunity.class);
					List list = hibQuery.list();
					result.addAll(list);
				} else {
					FullTextQuery hibQuery = fullTextSession
							.createFullTextQuery(q, Opportunity.class);
					List list = hibQuery.list();
					hibQuery.enableFullTextFilter("skills").setParameter(
							"advancedSkills", additionalSkillNames);
					List filterList = hibQuery.list();
					List<Opportunity> result1 = list;
					if (list != null) {
						list.removeAll(filterList);
						filterList.addAll(list);
						list = filterList;
					} else {
						list = filterList;
					}

					result.addAll(list);

				}

				OpportunityList = result;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		tx1.commit();
		session.close();

		return OpportunityList;
	}

	public List<Opportunity> findOpportunitySkills(long id) {
		String queryString = "from OpportunitySkills oppSkill where oppSkill.opprtunityOwner.id= :id ";
		return getHibernateTemplate().findByNamedParam(queryString, "id", id);
	}

	public List findByAllProfiles() {

		String queryString = "from Profile";
		List pl = getHibernateTemplate().find(queryString);

		return pl;
	}

	public List findListOfEmployees(String profileName, String location) {
	
		String[] paramNames=null;
		Object[] paramValues=null;
		StringBuffer querySb=new StringBuffer("select p from User u join u.profiles p join u.roles r left join p.industry i " +
				"where r.name like 'ROLE_EMPLOYEE'");
		
		if(!profileName.equalsIgnoreCase("") && !location.equalsIgnoreCase("")){
			
			querySb.append(" and (u.city like :location or (p.name like :profileName or i.name like :industryName))");
			paramNames=new String[]{"location","profileName","industryName"};
			paramValues=new Object[]{"%" + location + "%", "%" + profileName + "%","%" + profileName + "%"};
		}else if(!location.equalsIgnoreCase("")){
			
			querySb.append(" and u.city like :location");
			paramNames=new String[]{"location"};
			paramValues=new Object[]{"%" + location + "%"};
		}else if(!profileName.equalsIgnoreCase("")){
			
			querySb.append(" and (p.name like :profileName or i.name like :industryName)");
			paramNames=new String[]{"profileName","industryName"};
			paramValues=new Object[]{"%" + profileName + "%","%" + profileName + "%"};
		}else{
			paramNames=new String[]{};
			paramValues=new Object[]{};
		}
		
		List<Profile> result = getHibernateTemplate().findByNamedParam(querySb.toString(),paramNames,paramValues);
		
		return result;
	}

	public List findListOfEmployers(String profileName, String location) {
		/*LOGGER.info("employer locastion:"+employerLocation);

		  String queryString = "from Employer employer where employer.organizationName=:employerName or employer.city=:employerLocation";

		  return getHibernateTemplate().findByNamedParam(queryString,new String[]{"employerName","employerLocation"},new Object[]{employerName,employerLocation});*/
		/*SessionFactory sessionFactory = getHibernateTemplate()
				.getSessionFactory();
		Session session = sessionFactory.openSession();
		// Query query = session.createQuery("from Employer e where e.organizationName like? or e.city= :employerLocation");
		Query query = session
				.createQuery("select p from User u join u.profiles p join u.roles r where " +
						"r.name like 'ROLE_EMPLOYER' and (u.city like :location or p.name like :profileName)");
		query.setString("profileName", "%" + profileName + "%");
		query.setString("location", "%" + location + "%");
		// query.setString(0, "%" + employerName + "%");
		//query.setString("employerLocation", employerLocation);
		List<Profile> result = query.list();
		System.out.println("employer result " + result);
		session.close();*/
		
		
		String[] paramNames=null;
		Object[] paramValues=null;
		StringBuffer querySb=new StringBuffer("select p from Employer u join u.employerProfile p join u.roles r where r.name like 'ROLE_EMPLOYER'");
		
		if(!profileName.equalsIgnoreCase("") && !location.equalsIgnoreCase("")){
			
			querySb.append(" and (u.city like :location or p.name like :profileName)");
			paramNames=new String[]{"location","profileName"};
			paramValues=new Object[]{"%" + location + "%", "%" + profileName + "%"};
		}else if(!location.equalsIgnoreCase("")){
			
			querySb.append(" and u.city like :location");
			paramNames=new String[]{"location"};
			paramValues=new Object[]{"%" + location + "%"};
		}else if(!profileName.equalsIgnoreCase("")){
			
			querySb.append(" and p.name like :profileName");
			paramNames=new String[]{"profileName"};
			paramValues=new Object[]{"%" + profileName + "%"};
		}else{
			paramNames=new String[]{};
			paramValues=new Object[]{};
		}
		
		List<Profile> result = getHibernateTemplate().findByNamedParam(querySb.toString(),paramNames,paramValues);
		return result;

	}

	public List findListOfEmployerProfiles(EmployerProfile employerProfile,
			long id) {

		String queryString = "from EmployerProfile e where e.employer.id= :id ";
		return getHibernateTemplate().findByNamedParam(queryString, "id", id);

	}

	public List findListOfEmployeeProfiles(Profile employeeProfile, long id) {

		String queryString = "from Profile p where p.profileOwner.id= :id ";
		return getHibernateTemplate().findByNamedParam(queryString, "id", id);
	}

	public List findEmployeeWorkExperience(WorkExperience experience, long id) {
		String queryString = "from WorkExperience w where w.workExperienceProfile.id= :id ";
		return getHibernateTemplate().findByNamedParam(queryString, "id", id);

	}

	public List findListContacts(long id) {

		String queryString = "from Contact c where c.profileOwner.id= :id ";
		return getHibernateTemplate().findByNamedParam(queryString, "id", id);
	}

	public List findContactsForProfile(Profile profile) {
		String queryString = "from Contact c where c.associatedProfile= :profile ";
		return getHibernateTemplate().findByNamedParam(queryString, "profile",
				profile);
	}

	public List<EmployerProfile> findAllEmployer(String name) {
		SessionFactory sessionFactory = getHibernateTemplate()
				.getSessionFactory();
		Session session = sessionFactory.openSession();
		Query query = session
				.createQuery("from EmployerProfile e where e.name like? and e.name is not null order by e.name asc ");
		query.setString(0, "%" + name + "%");
		List<EmployerProfile> result = query.list();
		System.out.println("employer Result:----------" + result.size());
		session.close();
		return result;
	}

	public List<Employer> findAllEmployerList(String name) {
		SessionFactory sessionFactory = getHibernateTemplate()
				.getSessionFactory();
		Session session = sessionFactory.openSession();
		Query query = session
				.createQuery("from Employer e where e.organizationName like? and e.organizationName is not null order by e.organizationName asc ");
		query.setString(0, "%" + name + "%");
		List<Employer> result = query.list();
		System.out.println("employer Result:----------" + result.size());
		session.close();
		return result;
	}
	public List<Opportunity> findAllOpportunities(String name) {
		SessionFactory sessionFactory = getHibernateTemplate()
				.getSessionFactory();
		Session session = sessionFactory.openSession();
		String queryString = "from Opportunity o where o.title like? and o.title is not null order by o.title asc ";
		Query query = session.createQuery(queryString);
		if(name!=""){
			name=name.trim();
		}
		query.setString(0, "%" + name + "%");
		List<Opportunity> result = query.list();
		session.close();
		return result;
	}

	/* public List<User> findAllEmployees(String name) {
	     SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from User u where u.firstName like :name or u.lastName like :name");
	     query.setString("name", "%" + name + "%");
	     List<User> result = query.list();
	     session.close();
	     return result;
	 }*/

	public List<Profile> findAllEmployeeProfilesFromSearch(String name) {

		SessionFactory sessionFactory = getHibernateTemplate()
				.getSessionFactory();
		Session session = sessionFactory.openSession();
		//Query query = session.createQuery("from Profile p where p.name like :name");
		Query query = session
				.createQuery("select p from User u join u.profiles p join u.roles r left join p.industry i " +
						"where r.name like 'ROLE_EMPLOYEE' and (p.name like :name or i.name like :industryName) and p.flagdelete=false and p.name is not null order by p.name asc");
		query.setString("name", "%" + name + "%");
		query.setString("industryName", "%" + name + "%");
		
		List<Profile> result = query.list();
		session.close();
		return result;
	}

	public List<Opportunity> findEmployerOpportunities(long id) {
		String queryString = "from Opportunity o where o.profileOwner.id= :id";
		return getHibernateTemplate().findByNamedParam(queryString, "id", id);

	}

	
	public List<Group> findAllGroupsFromSearch(String search,User user) {
		
		SessionFactory sessionFactory = getHibernateTemplate()
		.getSessionFactory();
		Session session = sessionFactory.openSession();
		String queryString = "select distinct (g) from Group g where g.name like? and g.name is not null order by g.name asc";
		Query query = session.createQuery(queryString);
		query.setString(0, "%" + search + "%");
		List<Group> result = query.list();


		List<Group> groupList=new ArrayList<Group>();
		if(result!=null && result.size()!=0){

		for(Group group:result){
			long GroupMember=0;
			long groupPrivateMember=0;
				if(group.getGroupUsersProfiles()!=null && group.getGroupUsersProfiles().size()!=0){
					
					 String queryStringForGroup = "select distinct (g) from Group g left join fetch g.groupUsersProfiles gp " +
					  "where g.id=:groupId and gp.profileOwner.id=:profileOwnerId";
					List<Group> newgroupList=getHibernateTemplate().findByNamedParam(queryStringForGroup, 
							new String[]{"groupId", "profileOwnerId"}, new Object[]{group.getId(), user.getId()});
					if(newgroupList!=null && newgroupList.size()!=0){
						GroupMember=1;
						//group.setGroupMember(GroupMember);
						//groupList.add(group);
					}
				}
					else {
				
					if(group.getGroupInvitationProfiles()!=null && group.getGroupInvitationProfiles().size()!=0){
									
						String queryStringForGroupInvitation = "select distinct (gi) from Group gi left join fetch gi.groupInvitationProfiles gpi " +
					  "where gi.id=:groupId and gpi.profileOwner.id=:profileOwnerId";
						List<Group> inviGroupList=getHibernateTemplate().findByNamedParam(queryStringForGroupInvitation, 
								new String[]{"groupId", "profileOwnerId"}, new Object[]{group.getId(), user.getId()});
							if(inviGroupList!=null && inviGroupList.size()!=0){
								groupPrivateMember=1;
								//group.setGroupPrivateMember(groupPrivateMember);
								System.out.println("Groprivate member"+groupPrivateMember);
								//groupList.add(group);
							}
					}
						
					}						
					
				
					group.setGroupPrivateMember(groupPrivateMember);
					group.setGroupMember(GroupMember);
					groupList.add(group);
				
			}
		}
		
		
		session.close();
		return groupList;

	}
}
