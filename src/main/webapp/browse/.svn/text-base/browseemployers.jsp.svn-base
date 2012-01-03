<%@ include file="/common/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/styles/default/css/browse/browse.css" />

 <div id="bc_main_outer">
  <div id="bc_main_mid">
   <div id="body_container">
   <h2>Employer Search</h2>
    <div class="browsecontent">
      <div class="sub_links">
        <ul id="crumbcontainer">
          <li><a href="#"><span><small>All</small></span></a></li>
          <s:if test="keyword != null">
          <li>
          	<a href="#"><span><small><s:property value="keyword"/></small>
          	<img alt="" src="${ctx}/styles/default/images/browse/close.gif" title="Education Level"  id="keyclosecrumb">
          	</span></a>
         </li>
         </s:if>
        </ul>
      </div>
      <div id="left_content">
        <h3>FILTER BY CATEGORY</h3>
		<s:include value="categories.jsp"></s:include>
      </div>

	  <div id="browse_right_content">
        <div class="head_sec">
          <s:include value="keyword.jsp"></s:include>
          <div class="right_box">
			<s:include value="pagination.jsp"></s:include>
          </div>
        </div>
        <div class="list_section">
          <ul>
            <li class="none">
              <div class="name">Name</div>
              <div class="details">Details</div>
            </li>
			<div id="page">
			<s:include value="browseemployerpage.jsp"></s:include>			
				</div>
          </ul>
        </div>
      </div>
    
	<div>
		<div class="popup" id="popup" style="display:none;">
	</div>
	  </div>
		  </div>
</div>
		<div id="searchtype" style="display:none">Employer</div>
</div>
<br class=clear-both"/>

<script type="text/javascript" src="${ctx}/styles/default/js/jquery.livequery.min.js">
</script>
<script type="text/javascript" src="${ctx}/styles/default/js/browse/browse.js">
</script>
