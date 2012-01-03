package com.mob.integration;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Feb 2, 2009
 * Time: 4:56:59 PM
 * To change this template use File | Settings | File Templates.
 */
public class IntegrationPoint {
    private List<IntegrationPointListener> listeners;

    public void setListeners(List<IntegrationPointListener> listeners) {
        this.listeners = listeners;
    }

    public void addListener(IntegrationPointListener listener){
        this.listeners.add(listener);
    }

    public List<IntegrationPointListener> getListeners(){
        return this.listeners;
    }
}
