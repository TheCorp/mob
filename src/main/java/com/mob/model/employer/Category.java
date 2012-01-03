package com.mob.model.employer;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "category")
public class Category {
	private long id;
	private String name;
	private Set<Opportunity> opportunities = new HashSet<Opportunity>();
	
	
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	public long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	@OneToMany
	@JoinColumn(name="category_id")
	public Set<Opportunity> getOpportunities() {
		return opportunities;
	}
	public void setOpportunities(Set<Opportunity> opportunities) {
		this.opportunities = opportunities;
	}

}
