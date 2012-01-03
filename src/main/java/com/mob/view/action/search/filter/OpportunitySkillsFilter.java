package com.mob.view.action.search.filter;

import java.io.IOException;

import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.Term;
import org.apache.lucene.index.TermDocs;
import org.apache.lucene.index.TermEnum;
import org.apache.lucene.search.DocIdSet;
import org.apache.lucene.search.Filter;
import org.apache.lucene.util.OpenBitSet;

import org.hibernate.search.annotations.Key;
import org.hibernate.search.filter.FilterKey;
import org.hibernate.search.filter.StandardFilterKey;

public class OpportunitySkillsFilter extends org.apache.lucene.search.Filter {

	private String advancedSkills;

	public void setAdvancedSkills(String advancedSkills) {
		this.advancedSkills = advancedSkills;
	}

	@Key
	public FilterKey getKey() {
		StandardFilterKey key = new StandardFilterKey();
		key.addParameter(advancedSkills);
		return key;
	}

	public DocIdSet getDocIdSet(IndexReader reader) throws IOException {
		OpenBitSet bitSet = new OpenBitSet(reader.maxDoc());
		System.out.println("advancedSkills:---"+advancedSkills);
		TermDocs termDocs = reader.termDocs(new Term("skillsNeeded",
				advancedSkills));
			while (termDocs.next()) {
			bitSet.set(termDocs.doc());
		}
		return bitSet;
	}

}
