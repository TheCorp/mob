package com.mob.view.action.tag;

import com.mob.services.PrivacyGroupService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.util.ValueStack;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.Component;
import org.apache.struts2.views.annotations.StrutsTag;
import org.apache.struts2.views.annotations.StrutsTagAttribute;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import java.io.Writer;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Feb 19, 2009
 * Time: 1:03:11 AM
 * To change this template use File | Settings | File Templates.
 */
@StrutsTag(name = "privacy", tldTagClass = "com.mob.view.action.tag.PrivacyGroupTag",
        description = "Checks if a body of html should be rendered if allowed to the user viewing the item")
public class PrivacyGroupBean extends Component {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(PrivacyGroupBean.class);

    private String item;
    private String target;

    public PrivacyGroupBean(ValueStack stack) {
        super(stack);
        LOGGER.info("Opening PrivacyGroupBean");
    }

    @StrutsTagAttribute(description = "The item being viewed", type = "String", required = true)
    public void setItem(String item) {
        this.item = item;
    }

    @StrutsTagAttribute(description = "The id property of the user whose item is being viewed ", type = "String", required = true)
    public void setTarget(String target) {
        this.target = target;
    }

    /**
     * 
     * @param writer
     * @return
     */
    public boolean start(Writer writer) {
    	LOGGER.info("Inside start method");
        ApplicationContext appContext =
                WebApplicationContextUtils.
                        getWebApplicationContext
                                (ServletActionContext.getServletContext());
        PrivacyGroupService privacyService =
                (PrivacyGroupService) appContext.getBean("privacyService");
        Long profileId = (Long)ServletActionContext.getRequest().getSession().getAttribute("currentProfile");
        if(profileId==null){
            return false;
        }
        
        long itemViewerProfile = profileId;
        long targetProfileId = (Long)findValue(target, Long.class);

        if(itemViewerProfile == targetProfileId){
            return true;
        }

        try{
            return privacyService.isItemViewableByViewer(this.item,itemViewerProfile,targetProfileId);
        }catch(Exception e){
            LOGGER.error(e);
            return false;
        }
    }
}
