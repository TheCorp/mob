
<%@ include file="/common/taglib.jsp" %>
<script type="text/javascript" src="<c:url value='/styles/default/js/groups/addTopics.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/styles/default/css/mob.css'/>" />
<script src="../tinymce/jscripts/tiny_mce/tiny_mce.js"
	type="text/javascript"></script>
	<script type="text/javascript">
    $(document).ready(function() {
       $("#pageNametxtId").val("");
       
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


<form action="${ctx}/search/savegroupTopics.action" method="post">

<s:hidden name="group.id"/>
<div class="groupinfo">
	<div class="grouptxt">
	
	<div class="grouptextarea">
			<div class="grouplable">Enter a Topic  </div>
			<div class="grouppagename"><s:textarea  name="objTopics.topic"  rows="5" id="groupTextareaId"></s:textarea></div>
	</div>

		<div class="grouplable">Additional Details: </div>
		<div class="groupname">
		<s:textfield  name="objTopics.description" id="pageNametxtId" cssStyle="width:350px;height:50px"></s:textfield><br>
		</div>
	</div>
	<div class="groupsaveimage">
	<input id="" type="image" value="Submit" src="/MyOwnBriefcase/styles/default/images/save_profile_changes.png" alt="Submit" onclick="SaveTopicsId()"/>
	</div>

</div>
</form>
	