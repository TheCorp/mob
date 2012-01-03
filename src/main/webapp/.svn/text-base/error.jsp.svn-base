 <%-- 
<%@ page language="java" isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/struts-tags" prefix="s" %>


    <div id="page">
        <div id="content" class="clearfix">
            <div id="main">
                <h1>Sorry, There was a problem while executing your request. Please try again.</h1>
                <p><s:actionerror/><s:actionmessage/></p>
                <% if (exception != null) { %>
                    <pre><% exception.printStackTrace(new java.io.PrintWriter(out)); %></pre>
                <% } else if (request.getAttribute("javax.servlet.error.exception") != null) { %>
                    <pre><% ((Exception)request.getAttribute("javax.servlet.error.exception"))
                                           .printStackTrace(new java.io.PrintWriter(out)); %></pre>
                <% } %>
            </div>
        </div>
    </div>


--%>
<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" isErrorPage="true" %>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<div id="bc_main_outer">
	<div id="bc_main_mid">
		<div class="bc_main_inner clear-both">
			<div id="bc_profile_sec" class="r_sel_prof">
				<div class="bc_light_box select_profile"><div class="bc_lb-tr"><div class="bc_lb-bl"><div class="bc_lb-br"><div class="bc_lb-content">
					<h2 class="prof_sub_header">There has been an error with your request</h2>
					<p class="prof_sub_header"><s:actionerror/><s:actionmessage/></p>
					<% if (exception != null) { %>
                    <pre><% exception.printStackTrace(new java.io.PrintWriter(out)); %></pre>
                <% } else if (request.getAttribute("javax.servlet.error.exception") != null) { %>
                    <pre><% ((Exception)request.getAttribute("javax.servlet.error.exception"))
                                           .printStackTrace(new java.io.PrintWriter(out)); %></pre>
                <% } %>
					<p class="prof_sub_header">Please send an email to <a href="mailto:admin@myownbriefcase.com">admin@myownbriefcase.com</a> with details about how this error occurred so we can determine the causes and fix it. Thanks! - MyOwnbriefcase Team</p>
				</div>
			</div>
		</div>
	</div>
</div>