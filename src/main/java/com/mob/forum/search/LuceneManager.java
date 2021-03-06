/*
 * Copyright (c) JForum Team
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms,
 * with or without modification, are permitted provided
 * that the following conditions are met:
 *
 * 1) Redistributions of source code must retain the above
 * copyright notice, this list of conditions and the
 * following  disclaimer.
 * 2)  Redistributions in binary form must reproduce the
 * above copyright notice, this list of conditions and
 * the following disclaimer in the documentation and/or
 * other materials provided with the distribution.
 * 3) Neither the name of "Rafael Steil" nor
 * the names of its contributors may be used to endorse
 * or promote products derived from this software without
 * specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT
 * HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
 * BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 * THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
 * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
 * IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE
 *
 * Created on 24/07/2007 12:23:05
 *
 * The JForum Project
 * http://www.jforum.net
 */
package com.mob.forum.search;

import java.io.IOException;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.index.IndexReader;

import com.mob.forum.entities.Post;
import com.mob.forum.exceptions.ForumException;
import com.mob.forum.util.preferences.ConfigKeys;
import com.mob.forum.util.preferences.SystemGlobals;

/**
 * @author Rafael Steil
 * @version $Id: LuceneManager.java,v 1.16 2007/09/09 22:53:35 rafaelsteil Exp $
 */
public class LuceneManager implements SearchManager
{
	private LuceneSearch search;
	private LuceneSettings settings;
	private LuceneIndexer indexer;

	/**
	 * @see com.mob.forum.search.SearchManager#init()
	 */
	public void init()
	{
		try {
			Analyzer analyzer = (Analyzer)Class.forName(SystemGlobals.getValue(
				ConfigKeys.LUCENE_ANALYZER)).newInstance();

			this.settings = new LuceneSettings(analyzer);

			this.settings.useFSDirectory(SystemGlobals.getValue(ConfigKeys.LUCENE_INDEX_WRITE_PATH));

			this.removeLockFile();

			this.indexer = new LuceneIndexer(this.settings);

			this.search = new LuceneSearch(this.settings,
				new LuceneContentCollector(this.settings));

			this.indexer.watchNewDocuDocumentAdded(this.search);

			SystemGlobals.setObjectValue(ConfigKeys.LUCENE_SETTINGS, this.settings);
		}

		catch (Exception e) {
			throw new ForumException(e);
		}
	}

	public LuceneSearch luceneSearch()
	{
		return this.search;
	}

	public LuceneIndexer luceneIndexer()
	{
		return this.indexer;
	}

	public void removeLockFile()
	{
		try {
			if (IndexReader.isLocked(this.settings.directory())) {
				IndexReader.unlock(this.settings.directory());
			}
		}
		catch (IOException e) {
			throw new ForumException(e);
		}
	}

	/**
	 * @see com.mob.forum.search.SearchManager#create(com.mob.forum.entities.Post)
	 */
	public void create(Post post)
	{
		this.indexer.create(post);
	}

	/**
	 * @see com.mob.forum.search.SearchManager#update(com.mob.forum.entities.Post)
	 */
	public void update(Post post)
	{
		this.indexer.update(post);
	}

	/**
	 * @see com.mob.forum.search.SearchManager#search(com.mob.forum.search.SearchArgs)
	 */
	public SearchResult search(SearchArgs args)
	{
		return this.search.search(args);
	}

	/**
	 * @see com.mob.forum.search.SearchManager#delete(com.mob.forum.entities.Post)
	 */
	public void delete(Post p)
	{
		this.indexer.delete(p);
	}
}
