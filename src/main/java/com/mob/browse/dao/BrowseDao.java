package com.mob.browse.dao;

import java.util.List;

import com.mob.browse.action.CategoryItem;
import com.mob.browse.model.ItemCount;
import com.mob.browse.service.EmployeeSearchCriteria;
import com.mob.browse.service.EmployerSearchCriteria;
import com.mob.browse.service.GroupSearchCriteria;
import com.mob.browse.service.OpportunitySearchCriteria;
import com.mob.model.employer.Employer;
import com.mob.model.group.Group;
import com.mob.model.profile.Education;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Industry;
import com.mob.model.profile.Profile;
import com.mob.model.profile.Salary;
import com.mob.model.profile.Skills;

public interface BrowseDao {
	List<CategoryItem> listTopSearchedEducationForEmployees(boolean all, int limit);
	List<CategoryItem> listTopSearchedLocationForEmployees(boolean all, int limit);
	List<CategoryItem> listTopSearchedSkillsForEmployees(boolean all, int limit);
	
	List<CategoryItem> listTopSearchedLocationForEmployers(boolean all, int limit);
	List<CategoryItem> listTopSearchedIndustryForEmployers(boolean all, int limit);
	List<CategoryItem> listTopOpportunityProvider(boolean all, int limit);
	
	List<CategoryItem> listMostPopularGroups(boolean all, int limit);
	List<CategoryItem> listTopSearchedLocationForGroups(boolean all, int limit);
	
	List<CategoryItem> listTopSearchedSkillsForOpportunities(boolean all, int limit);
	List<CategoryItem> listTopSearchedSalaryRangeForOpportunities(boolean all, int limit);
	List<CategoryItem> listTopSearchedLocationForOpportunities(boolean all, int limit);
	List<CategoryItem> listTopSearchedIndustryForOpportunities(boolean all, int limit);
	
	
	SearchResult listEmployeeProfileByCriteria(EmployeeSearchCriteria criteria,int startIndex, int endIndex);
	SearchResult listEmployerProfileByCriteria(EmployerSearchCriteria criteria,int startIndex, int endIndex);	
	SearchResult listGroupByCriteria(GroupSearchCriteria criteria,int startIndex, int endIndex);
	SearchResult listOpportunitiesByCriteria(OpportunitySearchCriteria criteria, int startIndex, int endIndex);
	
	ItemCount findForSearchTermAndType(int type,String searchTerm);
	void save(ItemCount itemCount);
	void update(ItemCount itemCount);
	List<CategoryItem> findForType(int type, int limit);
	
	public static final int EMPLOYEE_EDU = 1;
	public static final int EMPLOYEE_LOC = 2;
	public static final int EMPLOYEE_SKILL = 3;

	public static final int EMPLOYER_IND = 4;
	public static final int EMPLOYER_LOC = 5;
	public static final int EMPLOYER_OPP_COUNT = 6;

	public static final int GROUP_LOC = 7;
	public static final int GROUP_NO_MEM = 8;
	
	public static final int OPP_IND = 9;
	public static final int OPP_LOC = 10;
	public static final int OPP_SAL_RANGE = 11;
	public static final int OPP_SKILLS = 12;
	

}
