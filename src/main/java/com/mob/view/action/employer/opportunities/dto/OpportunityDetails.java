package com.mob.view.action.employer.opportunities.dto;

import com.mob.model.employer.Opportunity;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Apr 3, 2009
 * Time: 1:12:34 PM
 * To change this template use File | Settings | File Templates.
 */
public class OpportunityDetails {
    private Opportunity opportunity;
    private int interests;
    private int bookmarks;

    public int getBookmarks() {
        return bookmarks;
    }

    public void setBookmarks(int bookmarks) {
        this.bookmarks = bookmarks;
    }

    public int getInterests() {
        return interests;
    }

    public void setInterests(int interests) {
        this.interests = interests;
    }

    public Opportunity getOpportunity() {
        return opportunity;
    }

    public void setOpportunity(Opportunity opportunity) {
        this.opportunity = opportunity;
    }
}
