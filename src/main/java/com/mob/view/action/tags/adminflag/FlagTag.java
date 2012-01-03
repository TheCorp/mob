package com.mob.view.action.tags.adminflag;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.mob.flag.services.FlagService;
import com.mob.model.flag.Flag;

import javax.servlet.ServletException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.io.Writer;
import java.io.IOException;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Mar 20, 2009
 * Time: 4:15:27 PM
 * To change this template use File | Settings | File Templates.
 */
public class FlagTag extends BodyTagSupport {

    private String key;
    private String src;
    private String imgalign = "";
    private String cssClass = "helpText";
    
    
    /**
	 * @param cssClass the cssClass to set
	 */
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	public void setSrc(String src) {
        this.src = src;
    }

    public void setKey(String key) {
        this.key = key;
    }

    /**
	 * @param imgalign the imgalign to set
	 */
	public void setImgalign(String imgalign) {
		this.imgalign = imgalign;
	}

	@Override
    public void doInitBody() throws JspException {
		System.out.println("Got help");
         ApplicationContext appContext =
                WebApplicationContextUtils.
                        getWebApplicationContext
                                (ServletActionContext.getServletContext());
         
        FlagService flagService = (FlagService) appContext.getBean("flagService");
        Flag helpForKey = flagService.getHelpForKey(key);
        if(helpForKey != null){
            try {
                Writer writer = getBodyContent().getEnclosingWriter();
	            addControl(writer,helpForKey);
                addJs(writer);
                writer.write("</span>");
                writer.flush();
           } catch (Exception e) {
				// TODO Auto-generated catch block
				
			}
        } 
    }

    private void addControl(Writer writer,Flag helpForKey) throws IOException {
    	System.out.println("Got help");
    	cssClass = cssClass == null || "".equals(cssClass) ? "helpText" : cssClass;
    	
        //To change body of created methods use File | Settings | File Templates.
        String helpDiv = "<div class='" + cssClass + "' id='" + key + "'>" +
        					"<span class='closeFlag' title='close' id='close" + key + "'>X</span>" +
        					"<span id='content"+ key + "'></span>" +
        				"</div>";
        String imageSpan = "<span class='" + ("".equals(imgalign) ? "helpButtonWithoutOrientation" : (imgalign.equalsIgnoreCase("right") ? "helpButtonRight" : "helpButtonLeft")) + "' onclick=loadFlag('"+key+"','"+helpForKey.getValue()+"')>";
        String image = "<img src='" + src + "'/>";
        writer.write(helpDiv);
        writer.write(imageSpan);
        writer.write(image);
        writer.flush();
}

    private void addJs(Writer writer) throws IOException {
        //To change body of created methods use File | Settings | File Templates.
        Boolean added = (Boolean) this.pageContext.getAttribute("HELPSCRIPTADDED");
        if(added == null || !added){
        	try {
        		writer.write("<script type='text/javascript'>");
        		writer.flush();
				ServletActionContext.getServletContext().
					getRequestDispatcher("/styles/default/js/flag.js").
					include(ServletActionContext.getRequest(), ServletActionContext.getResponse());
				
				writer.write("</script>");
				writer.write("<style>");
				writer.flush();
				ServletActionContext.getServletContext().
				getRequestDispatcher("/styles/default/css/flag.css").
				include(ServletActionContext.getRequest(), ServletActionContext.getResponse());
				writer.write("</style>");
        	} catch (ServletException e) {
				// TODO Auto-generated catch block
				
				throw new IOException();
			}
        	
        	this.pageContext.setAttribute("HELPSCRIPTADDED",true);
        }
    }

   
}
