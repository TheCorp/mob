
<%@ include file="/common/taglib.jsp" %>
<script type="text/javascript" src="<c:url value='/styles/default/js/adminHelp.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/styles/default/css/mob.css'/>" />
<script type="text/javascript" src="<c:url value='/styles/default/js/adminpagination.js'/>"></script>
<script src="../tinymce/jscripts/tiny_mce/tiny_mce.js"
	type="text/javascript"></script>
	<script type="text/javascript">
    $(document).ready(function() {
       $("#pageNametxtId").val("");
       
       showHideAdminData();
    });
</script>
<script type="text/javascript">
	tinyMCE.init({
		// General options
		mode : "textareas",
		//theme : "advanced",
		skin : "o2k7", 
		width: "350px",
		skin_variant : "black",
		plugins : "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount",
		theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
		theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
	    theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
		theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
		theme_advanced_disable : "cleanup",
		theme_advanced_toolbar_location : "top",
		theme_advanced_path_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : false,
				// Example content CSS (should be your site CSS)
		content_css : "../tinymce/examples/css/content.css",

		// Drop lists for link/image/media/template dialogs
		template_external_list_url : "../tinymce/examples/lists/template_list.js",
		external_link_list_url : "../tinymce/examples/lists/link_list.js",
		external_image_list_url : "../tinymce/examples/lists/image_list.js",
		media_external_list_url : "../tinymce/examples/lists/media_list.js",

		// Replace values for the template plugin
		template_replace_values : {
			username : "Some User",
			staffid : "991234"
		}
	});

	function displayAllTextAreas() {
		var textAreas = document.getElementsByTagName("textarea");
		for(var i = 0; i < textAreas.length(); i++) {
			textAreas[i].visibility = "visible";
		}
	
	}	
</script>


<form action="" method="post" id="helpForm">
<input type="hidden" value="" name="help.id" id="hellpId"/>

<div class="admininfo">
	<div class="admintxt">
		<div class="adminlable">PageName</div>
		<div class="adminpagename">
		<s:property value='pageNametxtId'/>
		<s:textfield  name="help.pageName" id="pageNametxtId" cssStyle="width:350px;height:30px"></s:textfield><br>
		</div>
	</div>
	<div class="admintextarea">
			<div class="adminlable">Helpcontent</div>
			<div class="adminpagename"><s:textarea  name="help.value"  rows="5" id="helpTextareaId"></s:textarea></div>
	</div>
	<div class="adminsaveimage">
	<input id="" type="image" value="Submit" src="${ctx}/styles/default/images/save_profile_changes.png" alt="Submit" onclick="checkadminHelpId()"/>
	</div>
</div>
</form>

	
	
	 <div id="tableholder">
	        	<div id="paginator">
	               <div id="paginator">
	               
			                  	<span id="prev" style="cursor: pointer;" class="pagelink"> « Prev </span>
			                  	<span id="sep">|</span>  
			                  	<span id="next" style="cursor: pointer;" class="pagelink"> Next » </span>
			                  	<span id="count" class="pagelink"></span>
		          
	        	</div>
	        	</div>
				                <table cellspacing="0" width="100%">
				                <thead class="tableheader">
				                  <tr>
				                    <td class="flagcell"></td>
				                    <td class="checkcell"></td>
				                    <td class="textcell"><b>Page Name</b></td>
				                    <td class="textcell"><b>Helpcontent</b></td>
				                    <td class="cell5"></td>
				                    <td class="cell6"></td>
				                  </tr>
				                </thead>
			               
				                <tbody class="tablebody">				               
				                      <s:iterator value="listOfHelpConntent" status="row">
				                      <s:set name="number" value="(#row.count-1)/15"/>
						             
						                  <tr class="row1 number<s:property value="#number"/>">
							                    <td class="flagcell">
							                    </td>
							                    <td class="checkcell">
							                    <s:property value="id"/>
							                    
							                    <input type="hidden" value="<s:property value='id'/>"/>
							                   
							               
							                   </td>
							                    <td class="textcell">
							                    <input type="hidden" value="<s:property value='pageName'/>" id="pageNameId<s:property value='id'/>"/>
							                    <a href="#" onclick="editHelpContentInformation(<s:property value='id'/>)"><span style="color: #000000;"><s:property value="pageName"/></span></a>
								                 </td>
							                    <td class="cell4">
							             
							                    <input type="hidden" value="<s:property value='value'/>" id="valueId<s:property value='id'/>"/>
							                  
								                   <s:property value="value"/>
							                    </td>
							                    <td class="cell5"></td>
							                    <td class="cell6"></td>
						                  </tr>
										 
				                </s:iterator>
				                
                          </tbody>
			                </table>
			             
  </div>

