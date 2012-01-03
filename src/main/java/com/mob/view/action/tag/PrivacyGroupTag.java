package com.mob.view.action.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;

import org.apache.struts2.components.Component;
import org.apache.struts2.views.jsp.ComponentTagSupport;

import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.util.ValueStack;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Feb 19, 2009
 * Time: 1:05:35 AM
 * To change this template use File | Settings | File Templates.
 */
public class PrivacyGroupTag extends ComponentTagSupport {

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(PrivacyGroupTag.class);

	private String item;
    private String target;

    public PrivacyGroupTag() {
        LOGGER.info("Opening PrivacyGroupTag");
    }

    public Component getBean(ValueStack valueStack,
                             HttpServletRequest httpServletRequest,
                             HttpServletResponse httpServletResponse) {
        return new PrivacyGroupBean(valueStack);
        //To change body of implemented methods use File | Settings | File Templates.
    }

    protected void populateParams() {
        super.populateParams();    //To change body of overridden methods use File | Settings | File Templates.
        ((PrivacyGroupBean)getComponent()).setItem(this.item);
        ((PrivacyGroupBean)getComponent()).setTarget(this.target);
    }

    public void setItem(String item) {
            this.item = item;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public int doStartTag() throws JspException {
        try{
        	LOGGER.info("doStartTag called");
            int result = super.doStartTag();
            switch(result){
                case(SKIP_BODY):{
                   this.pageContext.setAttribute("BLOCKED",true);
                   break;
                }
                default:{
                   this.pageContext.setAttribute("BLOCKED",false); 
                }
            }
            return result;
            //To change body of overridden methods use File | Settings | File Templates.
        }catch(Exception e){
            LOGGER.error(e);
            return EVAL_PAGE;
        }
    }
}
