package com.mob.browse.dao.hibernate;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.ResultTransformer;
import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mob.browse.action.CategoryItem;
import com.mob.browse.dao.BrowseDao;
import com.mob.browse.dao.SearchResult;
import com.mob.browse.model.ItemCount;
import com.mob.browse.service.EmployeeSearchCriteria;
import com.mob.browse.service.EmployerSearchCriteria;
import com.mob.browse.service.GroupSearchCriteria;
import com.mob.browse.service.OpportunitySearchCriteria;
import com.mob.model.employer.Employer;
import com.mob.model.employer.Opportunity;
import com.mob.model.group.Group;
import com.mob.model.profile.Education;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Industry;
import com.mob.model.profile.Profile;
import com.mob.model.profile.Salary;
import com.mob.model.profile.Skills;

public class HibernateBrowseDao extends HibernateDaoSupport 
	implements BrowseDao {

	public List<CategoryItem> listTopSearchedEducationForEmployees(boolean all,
			final int limit) {
		// TODO Auto-generated method stub
		if(!all){
			List<CategoryItem> employeeEdus = findForType(EMPLOYEE_EDU,limit);
			int counted = 0;
			if(employeeEdus!= null && !employeeEdus.isEmpty()){
				counted = employeeEdus.size();
			}else{
				employeeEdus = new ArrayList<CategoryItem>();
			}
			if(counted<limit){
				final int remItems = limit - counted;
				final String hql = "select distinct(e.degree) as name, e.degree as value, e.degree as display" +
						" from Education e where e.degree not in " +
				"(select c.searchTerm from ItemCount c where c.itemType like " + EMPLOYEE_EDU + ") " +
						"order by e.degree";
				List<CategoryItem> rem = (List<CategoryItem>) getHibernateTemplate().execute(new HibernateCallback() {
					@Override
					public Object doInHibernate(Session session) throws HibernateException,
							SQLException {
						// TODO Auto-generated method stub
						Query query = session.createQuery(hql);
						query.setResultTransformer(Transformers.aliasToBean(CategoryItem.class));
						query.setMaxResults(remItems);
						return query.list();
					}
				});
				employeeEdus.addAll(rem);
			}
		
			return employeeEdus;
		}else{
			final String hqlall = "select distinct(e.degree) as name, e.degree as value, e.degree as display " +
					"from Education e group by e.degree";
			List<CategoryItem> rem = (List<CategoryItem>) getHibernateTemplate().execute(new HibernateCallback() {
				@Override
				public Object doInHibernate(Session session) throws HibernateException,
						SQLException {
					// TODO Auto-generated method stub
					Query query = session.createQuery(hqlall);
					query.setResultTransformer(Transformers.aliasToBean(CategoryItem.class));
					return query.list();
				}
			});
			return rem;
		}
	}

	public List<CategoryItem> listTopSearchedLocationForEmployees(boolean all,
			final int limit) {
		// TODO Auto-generated method stub
		if(!all){
			List<CategoryItem> employeeLoc = findForType(EMPLOYEE_LOC,limit);
			int counted = 0;
			if(employeeLoc!= null && !employeeLoc.isEmpty()){
				counted = employeeLoc.size();
			}else{
				employeeLoc = new ArrayList<CategoryItem>();
			}

			if(counted<limit){
				final int remC = limit-counted;
				final String hql = "select distinct(e.city) as name, e.city as value, e.city as display" +
						" from User e where e.city not in " +
				"(select c.searchTerm from ItemCount c where c.itemType like " + EMPLOYEE_LOC + ") " +
						"order by e.city";
				List<CategoryItem> rem = (List<CategoryItem>) getHibernateTemplate().execute(new HibernateCallback() {
					@Override
					public Object doInHibernate(Session session) throws HibernateException,
							SQLException {
						// TODO Auto-generated method stub
						Query query = session.createQuery(hql);
						query.setResultTransformer(Transformers.aliasToBean(CategoryItem.class));
						query.setMaxResults(remC);
						return query.list();
					}
				});
				employeeLoc.addAll(rem);
			}
			return employeeLoc;
		}else{
			final String hqlall = "select distinct(e.city) as name, e.city as value, e.city as display" +
				" from User e order by e.city";
			List<CategoryItem> rem = (List<CategoryItem>) getHibernateTemplate().execute(new HibernateCallback() {
				@Override
				public Object doInHibernate(Session session) throws HibernateException,
						SQLException {
					// TODO Auto-generated method stub
					Query query = session.createQuery(hqlall);
					query.setResultTransformer(Transformers.aliasToBean(CategoryItem.class));
					return query.list();
				}
			});
			return rem;
		}
	}

	public List<CategoryItem> listTopSearchedSkillsForEmployees(boolean all, final int limit) {
		// TODO Auto-generated method stub

		if(!all){
			List<CategoryItem> employeeSkills = findForType(EMPLOYEE_SKILL,limit);
			int counted = 0;
			if(employeeSkills!= null && !employeeSkills.isEmpty()){
				counted = employeeSkills.size();
			}else{
				employeeSkills = new ArrayList<CategoryItem>();
			}

			if(counted<limit){
				final int remC = limit-counted;
				final String hql = "select distinct(e.skillName) as name, " +
						"e.skillName as value, e.skillName as display" +
						" from SkillsDetails e where e.skillName not in " +
				"(select c.searchTerm from ItemCount c where c.itemType like " + EMPLOYEE_SKILL + ") " +
						"order by e.skillName";
				List<CategoryItem> rem = (List<CategoryItem>) getHibernateTemplate().execute(
						new HibernateCallback() {
					@Override
					public Object doInHibernate(Session session) throws HibernateException,
							SQLException {
						// TODO Auto-generated method stub
						Query query = session.createQuery(hql);
						query.setResultTransformer(Transformers.aliasToBean(CategoryItem.class));
						query.setMaxResults(remC);
						return query.list();
					}
				});
				employeeSkills.addAll(rem);
			}
			
			return employeeSkills;
		}else{
			final String hqlall = "select distinct(e.skillName) as name, " +
					"e.skillName as value, e.skillName as display" +
				" from SkillsDetails e order by e.skillName";
			List<CategoryItem> rem = (List<CategoryItem>) getHibernateTemplate().execute(
					new HibernateCallback() {
				@Override
				public Object doInHibernate(Session session) throws HibernateException,
						SQLException {
					// TODO Auto-generated method stub
					Query query = session.createQuery(hqlall);
					query.setResultTransformer(Transformers.aliasToBean(CategoryItem.class));
					return query.list();
				}
			});
			return rem;
		}
	}

	public List<CategoryItem> listTopSearchedLocationForEmployers(boolean all,
			final int limit) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		if(!all){
			List<CategoryItem> employerLoc = findForType(EMPLOYER_LOC,limit);
			int counted = 0;
			if(employerLoc!= null && !employerLoc.isEmpty()){
				counted = employerLoc.size();
			}else{
				employerLoc = new ArrayList<CategoryItem>();
			}

			if(counted<limit){
				final int remC = limit-counted;
				final String hql = "select distinct(e.city) as name, e.city as value, e.city as display" +
						" from User e where e.city not in " +
				"(select c.searchTerm from ItemCount c where c.itemType like " + EMPLOYER_LOC + ") " +
						"order by e.city";
				List<CategoryItem> rem = (List<CategoryItem>) getHibernateTemplate().execute(
						new HibernateCallback() {
					@Override
					public Object doInHibernate(Session session) throws HibernateException,
							SQLException {
						// TODO Auto-generated method stub
						Query query = session.createQuery(hql);
						query.setResultTransformer(Transformers.aliasToBean(CategoryItem.class));
						query.setMaxResults(remC);
						return query.list();
					}
				});
				employerLoc.addAll(rem);
			}
			return employerLoc;
		}else{
			final String hqlall = "select distinct(e.city) as name, e.city as value, e.city as display" +
				" from User e order by e.city";
			List<CategoryItem> rem = (List<CategoryItem>) getHibernateTemplate().execute(new HibernateCallback() {
				@Override
				public Object doInHibernate(Session session) throws HibernateException,
						SQLException {
					// TODO Auto-generated method stub
					Query query = session.createQuery(hqlall);
					query.setResultTransformer(Transformers.aliasToBean(CategoryItem.class));
					return query.list();
				}
			});
			return rem;
		}
	}

	public List<CategoryItem> listTopSearchedIndustryForEmployers(boolean all,
			final int limit) {
		// TODO Auto-generated method stub
		if(!all){
			List<CategoryItem> employerInd = findForType(EMPLOYER_IND,limit);
			int counted = 0;
			if(employerInd!= null && !employerInd.isEmpty()){
				counted = employerInd.size();
			}else{
				employerInd = new ArrayList<CategoryItem>();
			}

			if(counted<limit){
				final int remC = limit-counted;
				final String hql = "select distinct(e.name) as name, e.name as value, e.name as display" +
						" from Industry e where e.name not in " +
				"(select c.searchTerm from ItemCount c where c.itemType like " + EMPLOYER_IND + ") " +
						"order by e.name";
				List<CategoryItem> rem = (List<CategoryItem>) getHibernateTemplate().execute(new HibernateCallback() {
					@Override
					public Object doInHibernate(Session session) throws HibernateException,
							SQLException {
						// TODO Auto-generated method stub
						Query query = session.createQuery(hql);
						query.setResultTransformer(Transformers.aliasToBean(CategoryItem.class));
						query.setMaxResults(remC);
						return query.list();
					}
				});
				employerInd.addAll(rem);
			}
			return employerInd;
		}else{
			final String hqlall = "select distinct(e.name) as name, e.name as value, e.name as display" +
				" from Industry e order by e.name";
			List<CategoryItem> rem = (List<CategoryItem>) getHibernateTemplate().execute(new HibernateCallback() {
				@Override
				public Object doInHibernate(Session session) throws HibernateException,
						SQLException {
					// TODO Auto-generated method stub
					Query query = session.createQuery(hqlall);
					query.setResultTransformer(Transformers.aliasToBean(CategoryItem.class));
					return query.list();
				}
			});
			return rem;
		}
	}

	public List<CategoryItem> listTopSearchedLocationForGroups(boolean all, final int limit) {
		// TODO Auto-generated method stub
		if(!all){
			List<CategoryItem> groupLoc = findForType(GROUP_LOC,limit);
			int counted = 0;
			if(groupLoc!= null && !groupLoc.isEmpty()){
				counted = groupLoc.size();
			}else{
				groupLoc = new ArrayList<CategoryItem>();
			}

			if(counted<limit){
				final int remC = limit-counted;
				final String hql = "select distinct(e.city) as name, e.city as value, e.city as display" +
						" from User e where e.city not in " +
				"(select c.searchTerm from ItemCount c where c.itemType like " + GROUP_LOC + ") " +
						"order by e.city";
				List<CategoryItem> rem = (List<CategoryItem>) getHibernateTemplate().execute(new HibernateCallback() {
					@Override
					public Object doInHibernate(Session session) throws HibernateException,
							SQLException {
						// TODO Auto-generated method stub
						Query query = session.createQuery(hql);
						query.setResultTransformer(Transformers.aliasToBean(CategoryItem.class));
						query.setMaxResults(remC);
						return query.list();
					}
				});
				groupLoc.addAll(rem);
			}
			return groupLoc;
		}else{
			final String hqlall = "select distinct(e.city) as name, e.city as value, e.city as display" +
				" from User e order by e.city";
			List<CategoryItem> rem = (List<CategoryItem>) getHibernateTemplate().execute(new HibernateCallback() {
				@Override
				public Object doInHibernate(Session session) throws HibernateException,
						SQLException {
					// TODO Auto-generated method stub
					Query query = session.createQuery(hqlall);
					query.setResultTransformer(Transformers.aliasToBean(CategoryItem.class));
					return query.list();
				}
			});
			return rem;
		}
	}


	public List<CategoryItem> listTopOpportunityProvider(boolean all, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<CategoryItem> listMostPopularGroups(boolean all, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<CategoryItem> listTopSearchedSkillsForOpportunities(boolean all,
			final int limit) {
		// TODO Auto-generated method stub
		if(!all){
			List<CategoryItem> employeeSkills = findForType(OPP_SKILLS,limit);
			int counted = 0;
			if(employeeSkills!= null && !employeeSkills.isEmpty()){
				counted = employeeSkills.size();
			}else{
				employeeSkills = new ArrayList<CategoryItem>();
			}

			if(counted<limit){
				final int remC = limit-counted;
				final String hql = "select distinct(e.skillsNeeded) as name, e.skillsNeeded as value, " +
						"e.skillsNeeded as display" +
						" from OpportunitySkills e where e.skillsNeeded not in " +
				"(select c.searchTerm from ItemCount c where c.itemType like " + OPP_SKILLS + ") " +
						"order by e.skillsNeeded";
				List<CategoryItem> rem = (List<CategoryItem>) getHibernateTemplate().execute(new HibernateCallback() {
					@Override
					public Object doInHibernate(Session session) throws HibernateException,
							SQLException {
						// TODO Auto-generated method stub
						Query query = session.createQuery(hql);
						query.setResultTransformer(Transformers.aliasToBean(CategoryItem.class));
						query.setMaxResults(remC);
						return query.list();
					}
				});
				employeeSkills.addAll(rem);
			}
			return employeeSkills;
		}else{
			final String hqlall = "select distinct(e.skillsNeeded) as name, e.skillsNeeded as value, " +
					"e.skillsNeeded as display" +
				" from OpportunitySkills e order by e.skillsNeeded";
			List<CategoryItem> rem = (List<CategoryItem>) getHibernateTemplate().execute(
					new HibernateCallback() {
				@Override
				public Object doInHibernate(Session session) throws HibernateException,
						SQLException {
					// TODO Auto-generated method stub
					Query query = session.createQuery(hqlall);
					query.setResultTransformer(Transformers.aliasToBean(CategoryItem.class));
					return query.list();
				}
			});
			return rem;
		}
	}

	public List<CategoryItem> listTopSearchedSalaryRangeForOpportunities(boolean all,
			final int limit) {
		// TODO Auto-generated method stub
		if(!all){
			List<CategoryItem> oppSal = findForType(OPP_SAL_RANGE,limit);
			int counted = 0;
			if(oppSal!= null && !oppSal.isEmpty()){
				counted = oppSal.size();
			}else{
				oppSal = new ArrayList<CategoryItem>();
			}

			if(counted<limit){
				final int remC = limit-counted;
				final String hql = "select distinct(e.range) as name, e.range as value, e.range as display" +
						" from Salary e where e.range not in " +
				"(select c.searchTerm from ItemCount c where c.itemType like " + OPP_SKILLS + ") " +
						"order by e.range";
				List<CategoryItem> rem = (List<CategoryItem>) getHibernateTemplate().execute(new HibernateCallback() {
					@Override
					public Object doInHibernate(Session session) throws HibernateException,
							SQLException {
						// TODO Auto-generated method stub
						Query query = session.createQuery(hql);
						query.setResultTransformer(Transformers.aliasToBean(CategoryItem.class));
						query.setMaxResults(remC);
						return query.list();
					}
				});
				oppSal.addAll(rem);
			}
			return oppSal;
		}else{
			final String hqlall = "select distinct(e.range) as name, e.range as value, e.range as display" +
				" from Salary e order by e.range";
			List<CategoryItem> rem = (List<CategoryItem>) getHibernateTemplate().execute(new HibernateCallback() {
				@Override
				public Object doInHibernate(Session session) throws HibernateException,
						SQLException {
					// TODO Auto-generated method stub
					Query query = session.createQuery(hqlall);
					query.setResultTransformer(Transformers.aliasToBean(CategoryItem.class));
					return query.list();
				}
			});
			return rem;
		}
	}

	public List<CategoryItem> listTopSearchedLocationForOpportunities(boolean all,
			final int limit) {
		// TODO Auto-generated method stub
		if(!all){
			List<CategoryItem> oppLoc = findForType(OPP_LOC,limit);
			int counted = 0;
			if(oppLoc!= null && !oppLoc.isEmpty()){
				counted = oppLoc.size();
			}else{
				oppLoc = new ArrayList<CategoryItem>();
			}
			if(counted<limit){
				final int remC = limit-counted;
				final String hql = "select distinct(e.city) as name, e.city as value, e.city as display" +
						" from User e where e.city not in " +
				"(select c.searchTerm from ItemCount c where c.itemType like " + OPP_LOC + ") " +
						"order by e.city";
				List<CategoryItem> rem = (List<CategoryItem>) getHibernateTemplate().execute(new HibernateCallback() {
					@Override
					public Object doInHibernate(Session session) throws HibernateException,
							SQLException {
						// TODO Auto-generated method stub
						Query query = session.createQuery(hql);
						query.setResultTransformer(Transformers.aliasToBean(CategoryItem.class));
						query.setMaxResults(remC);
						return query.list();
					}
				});
				oppLoc.addAll(rem);
			}
			return oppLoc;
		}else{
			final String hqlall = "select distinct(e.city) as name, e.city as value, e.city as display" +
				" from User e order by e.city";
			List<CategoryItem> rem = (List<CategoryItem>) getHibernateTemplate().execute(new HibernateCallback() {
				@Override
				public Object doInHibernate(Session session) throws HibernateException,
						SQLException {
					// TODO Auto-generated method stub
					Query query = session.createQuery(hqlall);
					query.setResultTransformer(Transformers.aliasToBean(CategoryItem.class));
					return query.list();
				}
			});
			return rem;
		}
	}

	public List<CategoryItem> listTopSearchedIndustryForOpportunities(boolean all,
			final int limit) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		if(!all){
			List<CategoryItem> employerInd = findForType(OPP_IND,limit);
			int counted = 0;
			if(employerInd!= null && !employerInd.isEmpty()){
				counted = employerInd.size();
			}else{
				employerInd = new ArrayList<CategoryItem>();
			}
			if(counted<limit){
				final int remC = limit-counted;
				final String hql = "select distinct(e.name) as name, e.name as value, e.name as display" +
						" from Industry e where e.name not in " +
				"(select c.searchTerm from ItemCount c where c.itemType like " + EMPLOYER_IND + ") " +
						"order by e.name";
				List<CategoryItem> rem = (List<CategoryItem>) getHibernateTemplate().execute(new HibernateCallback() {
					@Override
					public Object doInHibernate(Session session) throws HibernateException,
							SQLException {
						// TODO Auto-generated method stub
						Query query = session.createQuery(hql);
						query.setResultTransformer(Transformers.aliasToBean(CategoryItem.class));
						query.setMaxResults(remC);
						return query.list();
					}
				});
				employerInd.addAll(rem);
			}
			return employerInd;
		}else{
			final String hqlall = "select distinct(e.name) as name, e.name as value, e.name as display" +
				" from Industry e order by e.name";
			List<CategoryItem> rem = (List<CategoryItem>) getHibernateTemplate().execute(new HibernateCallback() {
				@Override
				public Object doInHibernate(Session session) throws HibernateException,
						SQLException {
					// TODO Auto-generated method stub
					Query query = session.createQuery(hqlall);
					query.setResultTransformer(Transformers.aliasToBean(CategoryItem.class));
					return query.list();
				}
			});
			return rem;
		}
	}

	public SearchResult listEmployeeProfileByCriteria(
			EmployeeSearchCriteria employeeCriteria, int startIndex, int endIndex) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Profile.class,"p");
		Conjunction searchCon = Restrictions.conjunction();
		criteria.createAlias("p.profileOwner", "u");
		criteria.createAlias("u.roles", "r");
		searchCon.add(Restrictions.like("r.name", "ROLE_EMPLOYEE"));
		if(employeeCriteria.isSearchByKeyword()){
			criteria.createAlias("p.industry", "i");
			Disjunction keyDis = Restrictions.disjunction();
			keyDis.add(Restrictions.like("p.name", "%"+employeeCriteria.getKeyword()+"%"));
			keyDis.add(Restrictions.like("i.name", "%"+employeeCriteria.getKeyword()+"%"));
			searchCon.add(keyDis);
		}
		
		if(employeeCriteria.isSearchByEducation()){
			criteria.createAlias("p.education", "edu");
			Disjunction eduDis = Restrictions.disjunction();
			for(String edu:employeeCriteria.getEducation()){
				eduDis.add(Restrictions.like("edu.degree", edu));
			}
			searchCon.add(eduDis);
		}
	
		if(employeeCriteria.isSearchByLocation()){
			Disjunction locDis = Restrictions.disjunction();
			for(String loc:employeeCriteria.
					getLocation()){
				locDis.add(Restrictions.like("u.city", loc));
			}
			searchCon.add(locDis);
		}
		if(employeeCriteria.isSearchBySkills()){
			criteria.createAlias("p.userSkills", "s");
			Conjunction sklCon = Restrictions.conjunction();
			for(String skill:employeeCriteria.getSkill()){
				sklCon.add(Restrictions.like("s.skillName", skill));
			}
			searchCon.add(sklCon);
		}
		criteria.add(searchCon);
		criteria.addOrder(Order.asc("p.name"));
		criteria.setProjection(Projections.rowCount());
		List<Integer> count = getHibernateTemplate().findByCriteria(criteria);
		int totalCount = count.get(0);
		
		criteria.setProjection( null );
		criteria.setResultTransformer( Criteria.ROOT_ENTITY );
		List<Profile> profiles = getHibernateTemplate().
			findByCriteria(criteria,startIndex, endIndex);
		return new SearchResult(totalCount,profiles);
	}

	public SearchResult listEmployerProfileByCriteria(
			EmployerSearchCriteria employerCriteria, int startIndex, int endIndex) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(EmployerProfile.class,"ep");
		criteria.createAlias("ep.employer", "e");
		Conjunction searchCon = Restrictions.conjunction();
		
		if(employerCriteria.isSearchByKeyword()){
			Disjunction keyDis = Restrictions.disjunction();
			keyDis.add(Restrictions.like("e.organizationName", "%"+employerCriteria.getKeyword()+"%"));
			searchCon.add(keyDis);
		}
		
		if(employerCriteria.isSearchByIndustry()){
			criteria.createAlias("e.industry", "i");
			Disjunction dis = Restrictions.disjunction();
			List<String> industries = employerCriteria.getIndustry();
			for(String industry:industries){
				dis.add(Restrictions.eq("i.name", industry));
			}
			searchCon.add(dis);
		}
		if(employerCriteria.isSearchByLocation()){
			Disjunction dis = Restrictions.disjunction();
			List<String> locations = employerCriteria.getLocation();
			for(String loc:locations){
				dis.add(Restrictions.eq("e.city", loc));
			}
			searchCon.add(dis);
		}
		if(employerCriteria.isSearchByOpportunities()){
			int count = employerCriteria.getOppCount();
			Disjunction oppDis = Restrictions.disjunction();
			
			switch(count){
				case 1:{
					Conjunction oppCon = Restrictions.conjunction();
					oppCon.add(Restrictions.sizeGe("ep.opportunities", 1));
					oppCon.add(Restrictions.sizeLe("ep.opportunities", 10));
					oppDis.add(oppCon);
					break;
				}
				case 2:{
					Conjunction oppCon = Restrictions.conjunction();
					oppCon.add(Restrictions.sizeGe("ep.opportunities", 11));
					oppCon.add(Restrictions.sizeLe("ep.opportunities", 20));
					oppDis.add(oppCon);
					break;
				}
				case 3:{
					Conjunction oppCon = Restrictions.conjunction();
					oppCon.add(Restrictions.sizeGe("ep.opportunities", 21));
					oppCon.add(Restrictions.sizeLe("ep.opportunities", 30));
					oppDis.add(oppCon);
					break;
				}
				case 4:{
					Conjunction oppCon = Restrictions.conjunction();
					oppCon.add(Restrictions.sizeGe("ep.opportunities", 30));
					oppDis.add(oppCon);
					break;
				}
			}
			searchCon.add(oppDis);
		}
		criteria.add(searchCon);
		criteria.setProjection(Projections.rowCount());
		List<Integer> count = getHibernateTemplate().findByCriteria(criteria);
		int totalCount = count.get(0);
		
		criteria.setProjection( null );
		criteria.setResultTransformer( Criteria.ROOT_ENTITY );
		List<EmployerProfile> profiles = getHibernateTemplate().
			findByCriteria(criteria,startIndex, endIndex);
		return new SearchResult(totalCount,profiles);
	}

	public SearchResult listGroupByCriteria(GroupSearchCriteria groupCriteria,
			int startIndex, int endIndex) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Group.class,"g");
		Conjunction searchCon = Restrictions.conjunction();
		if(groupCriteria.isSearchByKeyword()){
			Disjunction keyDis = Restrictions.disjunction();
			keyDis.add(Restrictions.like("g.name", "%"+groupCriteria.getKeyword()+"%"));
			searchCon.add(keyDis);
		}
		
		if(groupCriteria.isSearchByLocation()){
			criteria.createAlias("g.profile", "p");
			criteria.createAlias("p.profileOwner", "po");
			List<String> locations = groupCriteria.getLocation();
			Disjunction dis = Restrictions.disjunction();
			for(String loc:locations){
				dis.add(Restrictions.eq("po.city", loc));
			}
			searchCon.add(dis);
		}
		
		if(groupCriteria.isSearchByMembers()){
			int count = groupCriteria.getMemberCount();
			Disjunction memDis = Restrictions.disjunction();
			switch(count){
				case 1:{
					Conjunction memCon = Restrictions.conjunction();
					memCon.add(Restrictions.sizeGe("g.groupUsersProfiles", 1));
					memCon.add(Restrictions.sizeLe("g.groupUsersProfiles", 50));
					memDis.add(memCon);
					break;
				}
				case 2:{
					Conjunction memCon = Restrictions.conjunction();
					memCon.add(Restrictions.sizeGe("g.groupUsersProfiles", 51));
					memCon.add(Restrictions.sizeLe("g.groupUsersProfiles", 100));
					memDis.add(memCon);
					break;
				}
				case 3:{
					Conjunction memCon = Restrictions.conjunction();
					memCon.add(Restrictions.sizeGe("g.groupUsersProfiles", 100));
					memDis.add(memCon);
					break;
				}
			}
			searchCon.add(memDis);
		}
		criteria.add(searchCon);
		criteria.setProjection(Projections.rowCount());
		List<Integer> count = getHibernateTemplate().findByCriteria(criteria);
		int totalCount = count.get(0);
		
		criteria.setProjection( null );
		criteria.setResultTransformer( Criteria.ROOT_ENTITY );
		List<Group> groups = getHibernateTemplate().
			findByCriteria(criteria,startIndex, endIndex);
		return new SearchResult(totalCount,groups);
	}

	public SearchResult listOpportunitiesByCriteria(
			OpportunitySearchCriteria oppsCriteria, int startIndex, int endIndex) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Opportunity.class,"o");
		criteria.createAlias("profileOwner", "po");
		criteria.createAlias("po.employer", "e");

		Conjunction searchCon = Restrictions.conjunction();
		if(oppsCriteria.isSearchByKeyword()){
			Disjunction keyDis = Restrictions.disjunction();
			keyDis.add(Restrictions.like("o.title", "%"+oppsCriteria.getKeyword()+"%"));
			searchCon.add(keyDis);
		}

		if(oppsCriteria.isSearchByIndustry()){
			criteria.createAlias("e.industry", "i");
			Disjunction dis = Restrictions.disjunction();
			List<String> industries = oppsCriteria.getIndustry();
			for(String industry:industries){
				dis.add(Restrictions.eq("i.name", industry));
			}
			searchCon.add(dis);
		}
		if(oppsCriteria.isSearchByLocation()){
			List<String> locations = oppsCriteria.getLocations();
			Disjunction dis = Restrictions.disjunction();
			for(String loc:locations){
				dis.add(Restrictions.eq("e.city", loc));
			}
			searchCon.add(dis);
		}
		if(oppsCriteria.isSearchBySalaryRange()){
			List<String> ranges = oppsCriteria.getSalaryRange();
			Disjunction dis = Restrictions.disjunction();
			for(String range:ranges){
				dis.add(Restrictions.like("o.str_salary_range", range));
			}
			searchCon.add(dis);
		}
		if(oppsCriteria.isSearchBySkills()){
			criteria.createAlias("o.opportunitySkills", "sk");
			List<String> skills = oppsCriteria.getSkill();
			Disjunction sklDis = Restrictions.disjunction();
			for(String skill:skills){
				sklDis.add(Restrictions.like("sk.skillsNeeded", skill));
			}
			searchCon.add(sklDis);
		}
		criteria.add(searchCon);
		criteria.setProjection(Projections.rowCount());
		List<Integer> count = getHibernateTemplate().findByCriteria(criteria);
		int totalCount = count.get(0);
		
		criteria.setProjection( null );
		criteria.setResultTransformer( Criteria.ROOT_ENTITY );
		List<Opportunity> opportunities = getHibernateTemplate().
			findByCriteria(criteria,startIndex, endIndex);
		return new SearchResult(totalCount,opportunities);
	}

	public ItemCount findForSearchTermAndType(int type, String searchTerm) {
		// TODO Auto-generated method stub
		String hql = "from ItemCount where itemType like ? and searchTerm like ?";
		List<ItemCount> counts = getHibernateTemplate().find(hql,
				new Object[]{type,searchTerm});
		if(counts!=null && !counts.isEmpty()){
			return counts.get(0);
		}
		return null;
	}

	@Transactional (propagation=Propagation.REQUIRED,readOnly=false)
	public void save(ItemCount itemCount) {
		// TODO Auto-generated method stub
		getHibernateTemplate().save(itemCount);
	}

	@Transactional (propagation=Propagation.REQUIRED,readOnly=false)
	public void update(ItemCount itemCount) {
		// TODO Auto-generated method stub
		getHibernateTemplate().update(itemCount);
	}

	@Override
	public List<CategoryItem> findForType(final int type,final int limit) {
		// TODO Auto-generated method stub
		final String hql = "select i.searchTerm as name, i.searchTerm as value, i.searchTerm as display," +
				"i.count as count " +
				"from ItemCount i where i.itemType like ? order by i.count desc";
		return (List<CategoryItem>) getHibernateTemplate().execute(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				// TODO Auto-generated method stub
				Query query = session.createQuery(hql);
				query.setResultTransformer(Transformers.aliasToBean(CategoryItem.class));
				query.setInteger(0, type);
				query.setMaxResults(limit);
				return query.list();
			}
		});
	}

}
