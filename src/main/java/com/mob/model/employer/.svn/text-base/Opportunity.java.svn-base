package com.mob.model.employer;

import com.mob.model.User;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Profile;
import com.mob.view.action.search.filter.OpportunityKeywordFilter;
import com.mob.view.action.search.filter.OpportunitySkillsFilter;

import org.apache.lucene.index.memory.PatternAnalyzer;
import org.apache.solr.analysis.LowerCaseFilterFactory;
import org.apache.solr.analysis.PatternTokenizerFactory;
import org.apache.solr.analysis.SnowballPorterFilterFactory;
import org.apache.solr.analysis.StandardTokenizerFactory;
import org.hibernate.search.annotations.Analyzer;
import org.hibernate.search.annotations.AnalyzerDef;
import org.hibernate.search.annotations.FilterCacheModeType;
import org.hibernate.search.annotations.FullTextFilterDef;
import org.hibernate.search.annotations.FullTextFilterDefs;
import org.hibernate.search.annotations.TokenizerDef;
import org.hibernate.search.annotations.TokenFilterDef;
import org.hibernate.search.annotations.Parameter;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.Store;

import javax.persistence.*;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Indexed(index = "Opportunity")
@Table(name = "opportunity")
@AnalyzerDef(name = "customanalyzer", tokenizer = @TokenizerDef(factory = PatternTokenizerFactory.class, params = { @Parameter(name = "pattern", value = ",") }), filters = { @TokenFilterDef(factory = LowerCaseFilterFactory.class) })
/*
 * @FullTextFilterDefs( { @FullTextFilterDef(name = "skills", impl =
 * OpportunitySkillsFilter.class) })
 */
//@FullTextFilterDef(name = "skills", impl = OpportunitySkillsFilter.class, cache = FilterCacheModeType.INSTANCE_AND_DOCIDSETRESULTS)
//@FullTextFilterDef(name = "keyword", impl = OpportunityKeywordFilter.class, cache = FilterCacheModeType.INSTANCE_AND_DOCIDSETRESULTS)
@FullTextFilterDefs( 
		{ @FullTextFilterDef(name = "skills",
				             impl = OpportunitySkillsFilter.class, cache = FilterCacheModeType.INSTANCE_AND_DOCIDSETRESULTS),
		  @FullTextFilterDef(name = "keyword", 
		                     impl = OpportunityKeywordFilter.class, cache = FilterCacheModeType.INSTANCE_AND_DOCIDSETRESULTS )
		})

public class Opportunity {

	private User creator;
	private Set<User> interestedUsers = new HashSet<User>();
	private Set<SearchCriteria> criterias = new HashSet<SearchCriteria>();

	private EmployerProfile profileOwner;

	private Set<Profile> interestedEmployeeProfileOwner = new HashSet<Profile>();
	private Set<Profile> bookMarkEmployeeProfileOwner = new HashSet<Profile>();

	private Category category = new Category();
	private long id;
	@Field(index = Index.TOKENIZED, store = Store.YES)	
	private String title;
	private String description;
	private Date createdDate;
	private String str_job_name;
	@Field(index = Index.TOKENIZED, store = Store.NO)
	private String str_location;
	private String str_type_of_work;
	private String str_education_requirment;

	private String str_salary_range;
	private String str_job_type;
	private String str_skills;

	private String str_benefits;

	// private int int_working_hours;
	private String workingHours;

	private int int_no_of_years;
	private String str_job_application_criteria;

	private Set<OpportunitySkills> opportunitySkills = new HashSet<OpportunitySkills>();

	@Field(index = Index.TOKENIZED, store = Store.YES)
	@Analyzer(definition = "customanalyzer")
	private String skillsNeeded;

	private long interestCount;
	private long bookMarkCount;
	private long viewOppCount;
	private String contactperson;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@Column(name = "position_title")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "job_name")
	public String getStr_job_name() {
		return str_job_name;
	}

	public void setStr_job_name(String str_job_name) {
		this.str_job_name = str_job_name;
	}

	@Column(name = "location")
	public String getStr_location() {
		return str_location;
	}

	public void setStr_location(String str_location) {
		this.str_location = str_location;
	}

	@Column(name = "type_of_work")
	public String getStr_type_of_work() {
		return str_type_of_work;
	}

	public void setStr_type_of_work(String str_type_of_work) {
		this.str_type_of_work = str_type_of_work;
	}

	@Column(name = "education_requirment")
	public String getStr_education_requirment() {
		return str_education_requirment;
	}

	public void setStr_education_requirment(String str_education_requirment) {
		this.str_education_requirment = str_education_requirment;
	}

	@Column(name = "benefits")
	public String getStr_benefits() {
		return str_benefits;
	}

	public void setStr_benefits(String str_benefits) {
		this.str_benefits = str_benefits;
	}

	/*
	 * @Column(name="working_hours") public int getInt_working_hours() { return
	 * int_working_hours; } public void setInt_working_hours(int
	 * int_working_hours) { this.int_working_hours = int_working_hours; }
	 */

	@Column(name = "no_of_years")
	public int getInt_no_of_years() {
		return int_no_of_years;
	}

	public void setInt_no_of_years(int int_no_of_years) {
		this.int_no_of_years = int_no_of_years;
	}

	@Column(name = "job_application_criteria")
	public String getStr_job_application_criteria() {
		return str_job_application_criteria;
	}

	public void setStr_job_application_criteria(
			String str_job_application_criteria) {
		this.str_job_application_criteria = str_job_application_criteria;
	}

	// End of Added by Jyoti for Create Opportunity Design Integration 24
	// N0v-2008

	@Column(name = "start_date")
	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Column(name = "description")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	// @ManyToOne
	// @JoinColumn(name="category_id")
	@Transient
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "employer_profileid")
	public EmployerProfile getProfileOwner() {
		return profileOwner;
	}

	public void setProfileOwner(EmployerProfile profileOwner) {
		this.profileOwner = profileOwner;
	}

	@Column(name = "salary_range")
	public String getStr_salary_range() {
		return str_salary_range;
	}

	public void setStr_salary_range(String str_salary_range) {
		this.str_salary_range = str_salary_range;
	}

	@Column(name = "employer_jobType")
	public String getStr_job_type() {
		return str_job_type;
	}

	public void setStr_job_type(String str_job_type) {
		this.str_job_type = str_job_type;
	}

	@Column(name = "employer_skill")
	public String getStr_skills() {
		return str_skills;
	}

	public void setStr_skills(String str_skills) {
		this.str_skills = str_skills;
	}

	@OneToMany
	@JoinColumn(name = "opportunity_id")
	public Set<OpportunitySkills> getOpportunitySkills() {
		return opportunitySkills;
	}

	public void setOpportunitySkills(Set<OpportunitySkills> opportunitySkills) {
		this.opportunitySkills = opportunitySkills;
	}

	@Column(name = "working_hours")
	public String getWorkingHours() {
		return workingHours;
	}

	public void setWorkingHours(String workingHours) {
		this.workingHours = workingHours;
	}

	@Column(name = "skillNeeded")
	public String getSkillsNeeded() {
		return skillsNeeded;
	}

	public void setSkillsNeeded(String skillsNeeded) {
		this.skillsNeeded = skillsNeeded;
	}

	@Column(name = "viewoppcount")
	public long getViewOppCount() {
		return viewOppCount;
	}

	public void setViewOppCount(long viewOppCount) {
		this.viewOppCount = viewOppCount;
	}

	@Column(name = "interestcount")
	public long getInterestCount() {
		return interestCount;
	}

	public void setInterestCount(long interestCount) {
		this.interestCount = interestCount;
	}

	@Column(name = "bookmarkcount")
	public long getBookMarkCount() {
		return bookMarkCount;
	}

	public void setBookMarkCount(long bookMarkCount) {
		this.bookMarkCount = bookMarkCount;
	}

	@ManyToMany
	@JoinTable(name = "user_interest", joinColumns = { @JoinColumn(name = "opportunity_id", referencedColumnName = "id") }, inverseJoinColumns = { @JoinColumn(name = "profile_id", referencedColumnName = "id") })
	public Set<Profile> getInterestedEmployeeProfileOwner() {
		return interestedEmployeeProfileOwner;
	}

	public void setInterestedEmployeeProfileOwner(
			Set<Profile> interestedEmployeeProfileOwner) {
		this.interestedEmployeeProfileOwner = interestedEmployeeProfileOwner;
	}

	@ManyToMany
	@JoinTable(name = "user_bookmark", joinColumns = { @JoinColumn(name = "opportunity_id", referencedColumnName = "id") }, inverseJoinColumns = { @JoinColumn(name = "profile_id", referencedColumnName = "id") })
	public Set<Profile> getBookMarkEmployeeProfileOwner() {
		return bookMarkEmployeeProfileOwner;
	}

	public void setBookMarkEmployeeProfileOwner(
			Set<Profile> bookMarkEmployeeProfileOwner) {
		this.bookMarkEmployeeProfileOwner = bookMarkEmployeeProfileOwner;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		} else {
			if (obj instanceof Opportunity) {
				if (((Opportunity) obj).id == this.id) {
					return true;
				} else {
					return false;
				}
			}
		}
		return false;
	}
	@Column(name = "contactperson")
	public String getContactperson() {
		return contactperson;
	}

	public void setContactperson(String contactperson) {
		this.contactperson = contactperson;
	}
}
