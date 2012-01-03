package com.mob.view.action.tag;

import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.JspException;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Mar 20, 2009
 * Time: 4:15:27 PM
 * To change this template use File | Settings | File Templates.
 */
public class PrivateItemBlockedTag extends BodyTagSupport {

    public int doStartTag() throws JspException {
        boolean blocked = (Boolean) this.pageContext.getAttribute("BLOCKED");
        if (blocked) {
            this.pageContext.removeAttribute("BLOCKED");
            return EVAL_BODY_INCLUDE;
        } else {
            this.pageContext.removeAttribute("BLOCKED");
            return SKIP_BODY;
        }

    }
}
