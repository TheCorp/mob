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

public class OpportunityKeywordFilter extends org.apache.lucene.search.Filter {

	private String advancedKeyword;



	@Key
	public FilterKey getKey() {
		StandardFilterKey key = new StandardFilterKey();
		key.addParameter(advancedKeyword);
		return key;
	}

	public DocIdSet getDocIdSet(IndexReader reader) throws IOException {
		OpenBitSet bitSet = new OpenBitSet(reader.maxDoc());
		System.out.println("advancedKeyword:---"+advancedKeyword);
		TermDocs termDocs = reader.termDocs(new Term("title",
				advancedKeyword));
			while (termDocs.next()) {
			bitSet.set(termDocs.doc());
		}
		return bitSet;
	}

	public void setAdvancedKeyword(String advancedKeyword) {
		this.advancedKeyword = advancedKeyword;
	}

}
