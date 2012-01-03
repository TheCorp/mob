
/*employer Briefcase*/

var defaultInputTextColor = "#000000";
var contactId=0;


/* Added for Add Briefcase Item*/
function hideEditableFields(){
    var hiddenIdForEdit_id=$("#hiddenIdForEdit_id").val();
	if(hiddenIdForEdit_id!=0){
		$("#name"+hiddenIdForEdit_id).show();
		$("#category"+hiddenIdForEdit_id).show();	
		$("#privacySetting"+hiddenIdForEdit_id).show();
		$("#actionId"+hiddenIdForEdit_id).show();
		
		$("#name1"+hiddenIdForEdit_id).hide();
		$("#category1"+hiddenIdForEdit_id).hide();
		$("#privacySetting1"+hiddenIdForEdit_id).hide();
		$("#actionId1"+hiddenIdForEdit_id).hide();
	}
	
}

function addEmployerBriefcaseDocument()
{
    $("#nameId").hide();
    $("#nameId1").hide();
    $("#privacyId").hide();
	$("#fileId").hide();
    $("#validDocumentId").hide();
 	var nameOfItem=$("#nameid").val();
	if(nameOfItem==""){
	//alert("Please enter Name of Item");
	$("#nameId").show();
	return false;
	}
    if(nameOfItem.length>45){
	//alert("Please enter Name of Item");
	$("#nameId").hide();
	$("#nameId1").show();
	return false;
	}

	var privacySetting=$("#privacySettingId").val();
	if(privacySetting==1){
	//alert("Please select privacy Setting");
	$("#nameId").hide();
	$("#nameId1").hide();	
	$("#privacyId").show();
	return false;
	}
	/*
	var category=$("#categoryId").val();
	if(category==1){
	alert("Please select category");
	return false;
	}
	*/
	var file = $("#fileItem").val();
	if(file==""){
	//alert("Please upload a file");	
	$("#nameId").hide();
	$("#nameId1").hide();
	$("#privacyId").hide();
	$("#fileId").show();
	return false;
	}
	
   
    extArray = new Array(".txt",".doc",".dot",".pps",".ppt",".pot",".docx",".xls",".xla",".xlc","xlm",".pdf");
     
    allowSubmit = false;
    if (!file) return;
    while (file.indexOf("\\") != -1)
    file = file.slice(file.indexOf("\\") + 1);
    ext = file.slice(file.indexOf(".")).toLowerCase();
    for (var i = 0; i < extArray.length; i++) {
    if (extArray[i] == ext) { allowSubmit = true; break; }
    }
    if (allowSubmit) return true;
    else
   // alert("Sorry, this is not a valid document type");
     $("#nameId").hide();
     $("#nameId1").hide();
	$("#privacyId").hide();
	$("#fileId").hide();
     $("#validDocumentId").show();
    return false;

}
function validateNameOfItem()
{
    var nameOfItem=$("#nameid").val();
	if(nameOfItem==""){
		$("#nameId").show();
		$("#nameid").focus();
	    return false;
	}
	else
	{
	   $("#nameId").hide();
	   $("#privacySettingId").focus();
	   return false;
	}

     
}
function validatePrivacySetting()
{
     $("#nameId").hide();
      var nameOfItem=$("#nameid").val();
  if(nameOfItem=="")
  {  
        $("#nameId").show();
		$("#nameid").focus();
	    return false;
  }
  else
  {	    
    var privacySetting=$("#privacySettingId").val();
	if(privacySetting==1)
	{
	  $("#privacyId").show();
	  $("#privacySettingId").focus();
	  return false;
	}
	else
    { 
      $("#privacyId").hide();
	  return false;
    }
    
    
}
}


function addEmployerBriefcasePhoto()
{
    $("#nameId").hide();
    $("#nameId1").hide();
    $("#privacyId").hide();
	$("#fileId").hide();
    $("#validDocumentId").hide();
    
	var nameOfItem=$("#nameid").val();
	if(nameOfItem==""){
	//alert("Please enter Name of Item");
	$("#nameId").show();
	return false;
	}
     if(nameOfItem.length>45){
	//alert("Please enter Name of Item");
	$("#nameId").hide();	
	$("#nameId1").show();
	return false;
	}

	var privacySetting=$("#privacySettingId").val();
	if(privacySetting==1){
	//alert("Please select privacy Setting");
	$("#nameId").hide();
	 $("#nameId1").hide();	
	$("#privacyId").show();
	return false;
	}
	/*
	var category=$("#categoryId").val();
	if(category==1){
	alert("Please select category");
	return false;
	}
	*/
	var file = $("#fileItem").val();
	if(file==""){
	//alert("Please upload a file");
	$("#nameId").hide();
	 $("#nameId1").hide();
	$("#privacyId").hide();
	$("#fileId").show();
	return false;
	}
	
    
    extArray = new Array(".jpg");
    allowSubmit = false;
    if (!file) return;
    while (file.indexOf("\\") != -1)
    file = file.slice(file.indexOf("\\") + 1);
    ext = file.slice(file.indexOf(".")).toLowerCase();
    for (var i = 0; i < extArray.length; i++) {
    if (extArray[i] == ext) { allowSubmit = true; break; }
    }
    if (allowSubmit) return true;
    else
   // alert("Please only upload files that end in types:  "
    //+ (extArray.join("  ")) + "\nPlease select a new "
    //+ "file to upload and submit again.");
    var htmlText="<h6>Please only upload files that end in types:  "
    + (extArray.join("  ")) + "\nPlease select a new "
    + "file to upload and submit again.</h6>"
    $("#nameId").hide();
     $("#nameId1").hide();
	$("#privacyId").hide();
	$("#fileId").hide();
    $("#validDocumentId").html(htmlText);
    $("#validDocumentId").show();
    return false;
}

function audioOrVideo()
{
   $("#categoryTypeId").hide();
   var category1=$("#categoryId").val()
   var category="Video";	
	if(category1==category)
	{
	  $("#audioDiv").hide();
	  $("#videoDiv").show();
	
	}
	else
	{
	  $("#videoDiv").hide();
	  $("#audioDiv").show();
	 
	
	}
	
}
function validateAudioOrVideo()
{
   $("#nameId").hide();
    $("#nameId1").hide();
      var nameOfItem=$("#nameid").val();
      if(nameOfItem.length>45)
      {  
        $("#nameId").hide();
        $("#nameId1").show();
		$("#nameid").focus();
	    return false;
     }
  if(nameOfItem=="")
  {  
        $("#nameId1").hide();
        $("#nameId").show();
		$("#nameid").focus();
	    return false;
  }
  else
  {
   var privacySetting=$("#privacySettingId").val();
	if(privacySetting==1)
	{
	   $("#nameId").hide();
	   $("#nameId1").hide();
	  $("#privacyId").show();	
	  $("#privacySettingId").focus();  
	  return false;
	}
	else
    { 
      $("#privacyId").hide();
	  return false;
    }
}
}
function validateCategoryType()
{
 $("#nameId").hide();
      var nameOfItem=$("#nameid").val();
  if(nameOfItem=="")
  {  
        $("#nameId").show();
		$("#nameid").focus();
	    return false;
  }
  else
  {
    var category=$("#categoryId").val();
	if(category==1){
	$("#privacyId").hide();	
	$("#categoryTypeId").show();
	$("#categoryId").focus();
	return false;
	}
	else
	{
	  $("#categoryTypeId").hide();
	  return false;
	}
}
}

function addEmployerBriefcaseAudioVedio() 
{
    $("#nameId").hide();
    $("#nameId1").hide();
    $("#privacyId").hide();
	$("#fileId").hide();
	$("#categoryTypeId").hide();
	$("#urlId").hide();
    $("#validDocumentId").hide();
 
    var nameOfItem=$("#nameid").val();
	if(nameOfItem==""){
	//alert("Please enter Name of Item");
	$("#nameId").show();
	 $("#nameId1").hide();
	return false;
	}
      if(nameOfItem.length>45){
	//alert("Please enter Name of Item");
	$("#nameId").hide();	
	$("#nameId1").show();
	return false;
	}

	var privacySetting=$("#privacySettingId").val();
	if(privacySetting==1){
	//alert("Please select privacy Setting");
	$("#nameId").hide();
	 $("#nameId1").hide();	
	$("#privacyId").show();
	return false;
	}
	
	var category=$("#categoryId").val();
	if(category==1){
	//alert("Please select category");
	$("#nameId").hide();
	 $("#nameId1").hide();	
	$("#privacyId").hide();
	$("#categoryTypeId").show();
	return false;
	}
	
	var category1=$("#categoryId").val()
   	var category="Video";	
   	var category2="Audio";
	if(category1==category)
	{
	   var videourl=$("#videoUrl").val();
	   if(videourl==""){
	  // alert("Please provide Video URL");
	  $("#nameId").hide();	
	   $("#nameId1").hide();
	  $("#privacyId").hide();
	  $("#categoryTypeId").hide();
	  $("#urlId").show();
	   return false;
	   }
	}
	else if(category1==category2){
	 	var file = $("#fileItem").val();
		if(file==""){
		//alert("Please upload a file");
		$("#nameId").hide();
		 $("#nameId1").hide();
	    $("#privacyId").hide();
	     $("#categoryTypeId").hide();
	     $("#urlId").hide();
	    $("#fileId").show();
		return false;
		}
	else{
	extArray = new Array(".ra",".ram",".dss",".msv",".dvf",".mp4",".m4a",".gsm",".dct",".vox",".aac",".Xvid",".aac",".aif",".iff",".mp3",".mpa",".ra",".wav",".wma",".3g2",".3gp",".asf",".asx",".avi",".flv",".mov",".mpg",".rm",".swf",".vob",".wmv");
	allowSubmit = false;
    if (!file) return;
    while (file.indexOf("\\") != -1)
    file = file.slice(file.indexOf("\\") + 1);
    ext = file.slice(file.indexOf(".")).toLowerCase();
    for (var i = 0; i < extArray.length; i++) {
    if (extArray[i] == ext) { allowSubmit = true; break; }
    }
    if (allowSubmit) return true;
    else
   // alert("Please only upload files that end in type:  "
    //+ (extArray.join("  ")) + "\nPlease select a new "
    //+ "file to upload and submit again.");
     var htmlText="<h6>Please only upload files that end in type:  "
    + (extArray.join("  ")) + "\n<br><br>Please select a new "
    + "file to upload and submit again.</h6>"
    $("#nameId").hide();
     $("#nameId1").hide();
	$("#privacyId").hide();
	$("#fileId").hide();
    $("#categoryTypeId").hide();
	$("#urlId").hide();
    $("#validDocumentId").html(htmlText);
    $("#validDocumentId").show();
    return false;
    }	
   
	
	}

	
}
/* End of Add Briefcase Item*/


/* Added for Edit Briefcase Item*/
function editEmprBreifcaseListItems(id){

	hide_pop_up("confirm_delete");
	hide_pop_up("confirm_delete2");
    hide_pop_up("add_item");
   
 	var hiddenIdForEdit_id=$("#hiddenIdForEdit_id").val();
	if(hiddenIdForEdit_id!=0){
		$("#name"+hiddenIdForEdit_id).show();
		$("#category"+hiddenIdForEdit_id).show();	
		$("#privacySetting"+hiddenIdForEdit_id).show();
		$("#actionId"+hiddenIdForEdit_id).show();
		
		$("#name1"+hiddenIdForEdit_id).hide();
		$("#category1"+hiddenIdForEdit_id).hide();
		$("#privacySetting1"+hiddenIdForEdit_id).hide();
		$("#actionId1"+hiddenIdForEdit_id).hide();
		
	
	}
        $("#name"+id).hide();
		$("#name1"+id).show();
		$("#category"+id).hide();
		$("#category1"+id).show();
		var category=$("#category"+id).html();
		
		$("#privacySetting"+id).hide();
		$("#privacySetting1"+id).show();
		var privacySetting=$("#privacySetting"+id).html();
		$.post("getEmployerPrivacySettingList.action",{},function (data)
  		    {           
  		                         
                  var htmlText = '<select id="selprivacySetting'+id+'"><option>'+privacySetting+'</option> '
                  for(var i=0;i<data.privacySettingList.length;i++)
                  {
                     if(data.privacySettingList[i]!=privacySetting)
                     {
				     htmlText += '<option value='+data.privacySettingList[i]+'>' + data.privacySettingList[i] + '</option>\n';
				     }
	              }
	                 htmlText += '</select>';         	
                	        
			     $("#privacySetting1"+id).html(htmlText);
                 
           },"json");
		
		$("#actionId"+id).hide();
		$("#actionId1"+id).show();
		
		$("#hiddenIdForEdit_id").val(id);
}

function editEmployerBriefcaseDetails(id)
{
     
    
     var  itemName = $("#txtname"+id).val();
     if(itemName.length>45)
     {
      // alert("Should have less than 45 characters")
       bc_pop_up1('event',"confirm_delete2",["center",300]);
       $("#success").hide();
        $("#failure").hide();
       $("#validateTitleName").show();
       return false;
     }
    //var  itemCategory = $('#selcategory'+id+' :selected').text();  
    var  itemPrivacySetting = $("#selprivacySetting"+id).val(); 
    
    $.post("editEmployerBriefcaseItems.action",{'item.id' :id,'name':itemName,'privacySetting':itemPrivacySetting},function (data)
   {       
            
            if(data.result =="success")
            {
             
				$("#name1"+id).hide();
				$("#name"+id).show();
				$("#name"+id).html(data.name);
				
				$("#category1"+id).hide();
				$("#category"+id).show();
			//	$("#category"+id).html(data.category);
				
				$("#privacySetting"+id).show();
				$("#privacySetting"+id).html(data.privacySetting);
				$("#privacySetting1"+id).hide();
				
				$("#actionId"+id).show();
				$("#actionId1"+id).hide();
			// alert("updated Data sucessfully");
			bc_pop_up1('event',"confirm_delete2",["center",300])
			$("#validateTitleName").hide();
              $("#success").show();
            }else{
            //alert("Not updated Data sucessfully");
            bc_pop_up1('event',"confirm_delete2",["center",300])
            $("#success").hide();
            $("#validateTitleName").hide();
            $("#failure").show();
          }                           
       
   },"json");
  
}
function cancelBriefcaseDetails(id){
 hide_pop_up("confirm_delete2");
        $("#name"+id).show();
		$("#name1"+id).hide();
		$("#category"+id).show();
		$("#category1"+id).hide();
		$("#privacySetting"+id).show();
		$("#privacySetting1"+id).hide();
		$("#actionId"+id).show();
		$("#actionId1"+id).hide();

}





function inputOnFocus(what)
	{
	if (!what.alreadyClicked)
		{
		what.value = "";
		what.style.color = defaultInputTextColor;
		what.alreadyClicked = true;
		}
	}

/* End of Edit Briefcase Item*/

/* Added for Delete Briefcase Item*/
function deleteEmployerBriefcaseDocument()
{
 
 document.getElementById("delete").href= "deleteEmployerBriefcaseDocument.action?item.id="+contactId;
  
}	

function deleteEmployerBriefcasePhoto(){

	document.getElementById("delete").href= "deleteEmployerBriefcasePhoto.action?item.id="+contactId;
}


function deleteEmployerBriefcaseAudioOrVideo(){

	document.getElementById("delete").href= "deleteEmployerBriefcaseAudioOrVideo.action?item.id="+contactId;
}

function deleteEmployerBriefcaseURL(){

	document.getElementById("delete").href= "deleteEmployerBriefcaseURL.action?item.id="+contactId;
}

/* End of Delete Briefcase Item*/


/* Added for Briefcase pop_up's */
function bc_pop_up(e,pop_up_id,location)
	{
	 $("#nameId").hide();
     $("#privacyId").hide();
	 $("#fileId").hide();
	  $("#validDocumentId").hide();
	hide_pop_up("confirm_delete");
	hide_pop_up("confirm_delete2");
	if (!e) var e = window.event;
	var p = document.getElementById(pop_up_id);
	p.style.visibility = "hidden";
	p.style.display = "block"; // have to display the element to grab its width + height
	if (location)
		{
		var x = 0;
		var y = 0;
		var rel;
		var ctr = getCenterOfScreen();
		var whe = getWidthHeightOf(p);
		switch(location[2])
			{
			case "absolute" : rel = "absolute";break;
			case "relative" : rel = "relative";break;
			case "mouse" : rel = "absolute";break;
			case "offset_mouse" : rel = "absolute";break;
			default : rel = "absolute";
			}
		if (!isNaN(location[0])) x = location[0];
		else if (location[0] == "center" || location[0] == "middle") x = ctr[0]-whe[0]/2;
		if (!isNaN(location[1])) y = location[1];
		else if (location[1] == "center" || location[1] == "middle") y = ctr[1]-whe[1]/2;
		if (location[2] == "mouse")
			{
			var mxy = getMouseXY(e);
			x += mxy[0];
			y += mxy[1];
			}
		else if (location[2] == "negoffset_mouse")
			{
			var mxy = getMouseXY(e);
			x = mxy[0] - whe[0] - x;
			y = mxy[1] - whe[1] - y;			
			}
		p.style.position = rel;
		p.style.left = Math.round(x)+"px";
		p.style.top = Math.round(y)+"px";
		}
	p.style.visibility = "visible";
	return false;
	}


function pop_up(e,id,name,spanid,pop_up_id,location)
	{
	$("#briefcaseName").html(name);
	hide_pop_up("add_item");
	hide_pop_up("confirm_delete2");
	 var hiddenIdForEdit_id=$("#hiddenIdForEdit_id").val();
		if(hiddenIdForEdit_id!=0){
		$("#name"+hiddenIdForEdit_id).show();
		$("#category"+hiddenIdForEdit_id).show();	
		$("#privacySetting"+hiddenIdForEdit_id).show();
		$("#actionId"+hiddenIdForEdit_id).show();
		
		$("#name1"+hiddenIdForEdit_id).hide();
		$("#category1"+hiddenIdForEdit_id).hide();
		$("#privacySetting1"+hiddenIdForEdit_id).hide();
		$("#actionId1"+hiddenIdForEdit_id).hide();
	}
	
	
	contactId=id; 
	var name=document.getElementById("name"+id).innerText
	document.getElementById(spanid).innerText=name
	
	if (!e) var e = window.event;
	var p = document.getElementById(pop_up_id);
	p.style.visibility = "hidden";
	p.style.display = "block"; // have to display the element to grab its width + height
	if (location)
		{
		var x = 0;
		var y = 0;
		var rel;
		var ctr = getCenterOfScreen();
		var whe = getWidthHeightOf(p);
		switch(location[2])
			{
			case "absolute" : rel = "absolute";break;
			case "relative" : rel = "relative";break;
			case "mouse" : rel = "absolute";break;
			case "offset_mouse" : rel = "absolute";break;
			default : rel = "absolute";
			}
		if (!isNaN(location[0])) x = location[0];
		else if (location[0] == "center" || location[0] == "middle") x = ctr[0]-whe[0]/2;
		if (!isNaN(location[1])) y = location[1];
		else if (location[1] == "center" || location[1] == "middle") y = ctr[1]-whe[1]/2;
		if (location[2] == "mouse")
			{
			var mxy = getMouseXY(e);
			x += mxy[0];
			y += mxy[1];
			}
		else if (location[2] == "negoffset_mouse")
			{
			var mxy = getMouseXY(e);
			x = mxy[0] - whe[0] - x;
			y = mxy[1] - whe[1] - y;			
			}
		p.style.position = rel;
		p.style.left = Math.round(x)+"px";
		p.style.top = Math.round(y)+"px";
		}
	    p.style.visibility = "visible";
	    return false;
	}
	
		
function hide_pop_up(pop_up_id)
	{
	
	document.getElementById(pop_up_id).style.display = "none";
	return false;
	}
function getWidthHeightOf(element)
	{
	var w = 0;
	var h = 0;
	if (element.clientWidth && element.clientHeight)
		{
		w = element.clientWidth;
		h = element.clientHeight;
		}
	return [w,h];
	}

function getCenterOfScreen()
	{
	var x = 0;
	var y = 0;
	if (window.clientWidth && window.clientHeight)
		{
		x = window.clientWidth/2;
		y = window.clientHeight/2;
		}
	else
		{
		var b = document.getElementsByTagName("body")[0];
		if (b.clientWidth && b.clientHeight)
			{
			x = b.clientWidth/2;
			y = b.clientHeight/2;			
			}
		}
	return [x,y];
	}

function getMouseXY(e)
	{
	var x = 0;
	var y = 0;
	if (e.pageX && e.pageY)
		{
		x = e.pageX;
		y = e.pageY;
		}
	else if (e.clientX && e.clientY)
		{
		x = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
		y = e.clientY + document.body.scrollTop + document.documentElement.scrollTop;
		}
	return [x,y];
	}

function addOnloadEvent(func)
	{
	if (window.addEventListener) window.addEventListener("load",func,false);
	else if (window.attachEvent) window.attachEvent("onload",func);
	}

function checkClass(element,name)
	{
	var names = name.split(" ");
	for (var i=0;i<names.length;i++)
		{
		if (element.attributes["class"] && element.attributes["class"].value == names[i]) return true;
		else if (element.className && element.className == names[i]) return true;
		else if (element.getAttribute && element.getAttribute("class") == names[i]) return true;
		}
	return false;
	}
/* End of Briefcase pop_up's */

/* popup for displaing messagebox  */
function bc_pop_up1(e,pop_up_id,location)
	{
	
	if (!e) var e = window.event;
	var p = document.getElementById(pop_up_id);
	p.style.visibility = "hidden";
	p.style.display = "block"; // have to display the element to grab its width + height
	if (location)
		{
		var x = 0;
		var y = 0;
		var rel;
		var ctr = getCenterOfScreen();
		var whe = getWidthHeightOf(p);
		switch(location[2])
			{
			case "absolute" : rel = "absolute";break;
			case "relative" : rel = "relative";break;
			case "mouse" : rel = "absolute";break;
			case "offset_mouse" : rel = "absolute";break;
			default : rel = "absolute";
			}
		if (!isNaN(location[0])) x = location[0];
		else if (location[0] == "center" || location[0] == "middle") x = ctr[0]-whe[0]/2;
		if (!isNaN(location[1])) y = location[1];
		else if (location[1] == "center" || location[1] == "middle") y = ctr[1]-whe[1]/2;
		if (location[2] == "mouse")
			{
			var mxy = getMouseXY(e);
			x += mxy[0];
			y += mxy[1];
			}
		else if (location[2] == "negoffset_mouse")
			{
			var mxy = getMouseXY(e);
			x = mxy[0] - whe[0] - x;
			y = mxy[1] - whe[1] - y;			
			}
		p.style.position = rel;
		p.style.left = Math.round(x)+"px";
		p.style.top = Math.round(y)+"px";
		}
	p.style.visibility = "visible";
	
	return false;
	}
/* End of employerBriefcase*/


/* Start of ibox.js */
var iBox=function(){var _pub={close_label:"Close",padding:100,inherit_frames:false,fade_in_speed:0,attribute_name:"rel",tags_to_hide:["select","embed","object"],default_width:450,is_opera:navigator.userAgent.indexOf("Opera/9")!=-1,is_ie:navigator.userAgent.indexOf("MSIE ")!=-1,is_ie6:false
/*@cc_on || @_jscript_version < 5.7 @*/
,is_firefox:navigator.appName=="Netscape"&&navigator.userAgent.indexOf("Gecko")!=-1&&navigator.userAgent.indexOf("Netscape")==-1,is_mac:navigator.userAgent.indexOf("Macintosh")!=-1,base_url:"",setPath:function(path){_pub.base_url=path},bind:function(fn){var args=[];for(var n=1;n<arguments.length;n++){args.push(arguments[n])}return function(e){return fn.apply(this,[e].concat(args))}},html:function(content,params){if(content===undefined){return els.content}if(cancelled){return }_pub.clear();els.wrapper.style.display="block";els.wrapper.style.visibility="hidden";els.content.style.height="auto";if(typeof (content)=="string"){els.content.innerHTML=content}else{els.content.appendChild(content)}var elemSize=_pub.getElementSize(els.content);var pageSize=_pub.getPageSize();if(params.can_resize===undefined){params.can_resize=true}if(params.fade_in===undefined){params.use_fade=true}if(params.width){var width=parseInt(params.width)}else{var width=_pub.default_width}if(params.height){var height=parseInt(params.height)}else{var height=elemSize.height}els.wrapper.style.width=width+"px";els.wrapper.style.height=height+"px";if(!params.height){var elemSize=_pub.getElementSize(els.content);var height=elemSize.height}if(params.can_resize){_pub.resizeObjectToScreen(els.content,width,height,params.constrain)}else{els.content.style.width=width+"px";els.content.style.height=height+"px"}var elemSize=_pub.getElementSize(els.content);els.wrapper.style.width=elemSize.width+"px";els.wrapper.style.height=elemSize.height+"px";_pub.reposition();els.wrapper.style.visibility="visible";_pub.fadeIn(els.wrapper,10,params.fade_in?_pub.fade_in_speed:0)},clear:function(){els.loading.style.display="none";while(els.content.firstChild){els.content.removeChild(els.content.firstChild)}},show:function(text,title,params){_pub.hide();showInit(title,params,function(){_pub.html(text,params)})},showURL:function(url,title,params){showInit(title,params,function(){cancelled=false;for(var i=0;i<_pub.plugins.list.length;i++){var plugin=_pub.plugins.list[i];if(plugin.match(url)){active_plugin=plugin;plugin.render(url,params);break}}})},hide:function(){if(active_plugin){if(active_plugin.unload){active_plugin.unload()}active_plugin=null}window.onscroll=null;_pub.clear();for(var i=0;i<_pub.tags_to_hide.length;i++){showTags(_pub.tags_to_hide[i])}els.loading.style.display="none";els.overlay.style.display="none";els.wrapper.style.display="none";_pub.fireEvent("hide")},resizeObjectToScreen:function(obj,width,height,constrain){var pagesize=_pub.getPageSize();var x=pagesize.width-_pub.padding;var y=pagesize.height-_pub.padding;if(!height){var height=obj.height}if(!width){var width=obj.width}if(width>x){if(constrain){height=height*(x/width)}width=x}if(height>y){if(constrain){width=width*(y/height)}height=y}obj.style.width=width+"px";obj.style.height=height+"px"},reposition:function(e){_pub.center(els.loading);_pub.center(els.wrapper);var pageSize=_pub.getPageSize();var scrollPos=_pub.getScrollPos();if(_pub.is_ie6){els.overlay.style.width=document.documentElement.clientWidth+"px"}var height=Math.max(document.documentElement.clientHeight,document.body.clientHeight);els.overlay.style.height=height+"px"},center:function(obj){var pageSize=_pub.getPageSize();var scrollPos=_pub.getScrollPos();var emSize=_pub.getElementSize(obj);var x=Math.round((pageSize.width-emSize.width)/2+scrollPos.scrollX);var y=Math.round((pageSize.height-emSize.height)/2+scrollPos.scrollY);obj.style.left=x+"px";obj.style.top=y+"px"},getStyle:function(obj,styleProp){if(obj.currentStyle){return obj.currentStyle[styleProp]}else{if(window.getComputedStyle){return document.defaultView.getComputedStyle(obj,null).getPropertyValue(styleProp)}}},getScrollPos:function(){var docElem=document.documentElement;return{scrollX:document.body.scrollLeft||window.pageXOffset||(docElem&&docElem.scrollLeft),scrollY:document.body.scrollTop||window.pageYOffset||(docElem&&docElem.scrollTop)}},getPageSize:function(){return{width:window.innerWidth||(document.documentElement&&document.documentElement.clientWidth)||document.body.clientWidth,height:window.innerHeight||(document.documentElement&&document.documentElement.clientHeight)||document.body.clientHeight}},getElementSize:function(obj){return{width:obj.offsetWidth||obj.style.pixelWidth,height:obj.offsetHeight||obj.style.pixelHeight}},fadeIn:function(obj,level,speed,callback){if(level===undefined){var level=100}if(speed===undefined){var speed=70}if(!speed){_pub.setOpacity(null,obj,level*10);if(callback){callback()}return }_pub.setOpacity(null,obj,0);for(var i=0;i<=level;i++){setTimeout(_pub.bind(_pub.setOpacity,obj,i*10),speed*i)}if(callback){setTimeout(callback,speed*(i+1))}},setOpacity:function(e,obj,value){obj.style.opacity=value/100;obj.style.filter="alpha(opacity="+value+")"},createXMLHttpRequest:function(){var http;if(window.XMLHttpRequest){http=new XMLHttpRequest();if(http.overrideMimeType){http.overrideMimeType("text/html")}}else{if(window.ActiveXObject){try{http=new ActiveXObject("Msxml2.XMLHTTP")}catch(e){try{http=new ActiveXObject("Microsoft.XMLHTTP")}catch(e){}}}}if(!http){alert("Cannot create XMLHTTP instance");return false}return http},addEvent:function(obj,evType,fn){if(obj.addEventListener){obj.addEventListener(evType,fn,false);return true}else{if(obj.attachEvent){var r=obj.attachEvent("on"+evType,fn);return r}else{return false}}},addEventListener:function(name,callback){if(!events[name]){events[name]=new Array()}events[name].push(callback)},fireEvent:function(name){if(events[name]&&events[name].length){for(var i=0;i<events[name].length;i++){var args=[];for(var n=1;n<arguments.length;n++){args.push(arguments[n])}if(events[name][i](args)===false){break}}}},parseQuery:function(query){var params=new Object();if(!query){return params}var pairs=query.split(/[;&]/);var end_token;for(var i=0;i<pairs.length;i++){var keyval=pairs[i].split("=");if(!keyval||keyval.length!=2){continue}var key=unescape(keyval[0]);var val=unescape(keyval[1]);val=val.replace(/\+/g," ");if(val[0]=='"'){var token='"'}else{if(val[0]=="'"){var token="'"}else{var token=null}}if(token){if(val[val.length-1]!=token){do{i+=1;val+="&"+pairs[i]}while((end_token=pairs[i][pairs[i].length-1])!=token)}val=val.substr(1,val.length-2)}params[key]=val}return params},handleTag:function(e){var t=this.getAttribute("rel");var params=_pub.parseQuery(t.substr(5,999));if(params.target){var url=params.target}else{if(this.target&&!params.ignore_target){var url=this.target}else{var url=this.href}}var title=this.title;if(_pub.inherit_frames&&window.parent){window.parent.iBox.showURL(url,title,params)}else{_pub.showURL(url,title,params)}return false},plugins:{list:new Array(),register:function(func,last){if(!last){_pub.plugins.list=_pub.plugins.list.concat([func],_pub.plugins.list)}else{_pub.plugins.list.push(func)}}}};var cancelled=false;var active_plugin=null;var events={};var els={wrapper:null,footer:null,content:null,overlay:null,loading:null};var create=function(elem){var container=document.createElement("div");container.id="ibox";container.style.display="block";els.overlay=document.createElement("div");els.overlay.style.display="none";els.overlay.id="ibox_overlay";els.overlay.onclick=_pub.hide;container.appendChild(els.overlay);els.loading=document.createElement("div");els.loading.id="ibox_loading";els.loading.innerHTML="Loading...";els.loading.style.display="none";els.loading.onclick=function(){_pub.hide();cancelled=true};container.appendChild(els.loading);els.wrapper=document.createElement("div");els.wrapper.id="ibox_wrapper";els.wrapper.style.display="none";els.content=document.createElement("div");els.content.id="ibox_content";els.wrapper.appendChild(els.content);var child=document.createElement("div");child.id="ibox_footer_wrapper";var child2=document.createElement("a");child2.innerHTML=_pub.close_label;child2.href="javascript:void(0)";child2.onclick=_pub.hide;child.appendChild(child2);els.footer=document.createElement("div");els.footer.id="ibox_footer";els.footer.innerHTML="&nbsp;";child.appendChild(els.footer);els.wrapper.appendChild(child);container.appendChild(els.wrapper);elem.appendChild(container);return container};var hideTags=function(tag){var list=document.getElementsByTagName(tag);for(var i=0;i<list.length;i++){if(_pub.getStyle(list[i],"visibility")!="hidden"&&list[i].style.display!="none"){list[i].style.visibility="hidden";list[i].wasHidden=true}}};var showTags=function(tag){var list=document.getElementsByTagName(tag);for(var i=0;i<list.length;i++){if(list[i].wasHidden){list[i].style.visibility="visible";list[i].wasHidden=null}}};var showInit=function(title,params,callback){els.loading.style.display="block";_pub.center(els.loading);_pub.reposition();if(!_pub.is_firefox){var amount=8}else{var amount=10}for(var i=0;i<_pub.tags_to_hide.length;i++){hideTags(_pub.tags_to_hide[i])}window.onscroll=_pub.reposition;els.footer.innerHTML=title||"&nbsp;";els.overlay.style.display="block";els.overlay.style.backgroundImage="url('"+_pub.base_url+"images/bg.png')";_pub.fadeIn(els.overlay,amount,_pub.fade_in_speed,callback);_pub.fireEvent("show")};var drawCSS=function(){var core_styles="#ibox {z-index:1000000;} #ibox_overlay {position:absolute;top:0;left:0;right:0;z-index:1000000;} #ibox_loading {position:absolute;z-index:1000001;} #ibox_wrapper {position:absolute;top:0;left:0;z-index:1000001;padding:25px 10px 10px 10px;} #ibox_content {z-index:1000002;overflow:auto;height:100%;position:relative;padding:2px;text-align:left;} #ibox_content object { display:block;} #ibox_content .ibox_image {width:100%;height:100%;margin:0;padding:0;border:0;display:block;} #ibox_footer_wrapper a {float:right;display:block;outline:0;margin:0;padding:0;} #ibox_footer_wrapper {text-align:left;position:absolute;top:5px;right:10px;left:10px;white-space:nowrap;overflow:hidden;}";var default_skin="#ibox_footer_wrapper {font-weight:bold;}#ibox_footer_wrapper a {text-decoration:underline;color:darkblue;text-transform:lowercase;font-weight:normal;font-family:Verdana, Arial, Helvetica, sans-serif;font-size:12px;}#ibox_footer_wrapper {font-size:12px;font-family:Verdana, Arial, Helvetica, sans-serif;}#ibox_wrapper {border:1px solid #ccc;}#ibox_wrapper, #ibox_footer_wrapper a {background-color:#999;}#ibox_content {background-color:#fff;border:1px solid #666;}#ibox_loading {padding:50px; background:#000;color:#fff;font-size:16px;font-weight:bold;}";var head=document.getElementsByTagName("head")[0];var htmDiv=document.createElement("div");htmDiv.innerHTML='<p>x</p><style type="text/css">'+default_skin+"</style>";head.insertBefore(htmDiv.childNodes[1],head.firstChild);htmDiv.innerHTML='<p>x</p><style type="text/css">'+core_styles+"</style>";head.insertBefore(htmDiv.childNodes[1],head.firstChild)};var initialize=function(){drawCSS();var els=document.getElementsByTagName("a");for(var i=0;i<els.length;i++){if(els[i].getAttribute(_pub.attribute_name)){var t=els[i].getAttribute(_pub.attribute_name);if((t.indexOf("ibox")!=-1)||t.toLowerCase()=="ibox"){els[i].onclick=_pub.handleTag}}}create(document.body);_pub.http=_pub.createXMLHttpRequest()};_pub.addEvent(window,"keypress",function(e){if(e.keyCode==(window.event?27:e.DOM_VK_ESCAPE)){iBox.hide()}});_pub.addEvent(window,"resize",_pub.reposition);_pub.addEvent(window,"load",initialize);var iBoxPlugin_Container=function(){var was_error=false;var original_wrapper=null;return{match:function(url){return url.indexOf("#")!=-1},unload:function(){if(was_error){return }var elemSrc=_pub.html().firstChild;elemSrc.style.display="none";original_wrapper.appendChild(elemSrc)},render:function(url,params){was_error=false;var elemSrcId=url.substr(url.indexOf("#")+1);var elemSrc=document.getElementById(elemSrcId);if(!elemSrc){was_error=true;_pub.html(document.createTextNode("There was an error loading the document."),params)}else{original_wrapper=elemSrc.parentNode;elemSrc.style.display="block";_pub.html(elemSrc,params)}}}}();_pub.plugins.register(iBoxPlugin_Container,true);var iBoxPlugin_Image=function(){var image_types=/\.jpg|\.jpeg|\.png|\.gif/gi;return{match:function(url){return url.match(image_types)},render:function(url,params){var img=document.createElement("img");img.onclick=_pub.hide;img.className="ibox_image";img.style.cursor="pointer";img.onload=function(){_pub.html(img,{height:img.height,width:img.width,constrain:true})};img.onerror=function(){_pub.html(document.createTextNode("There was an error loading the document."),params)};img.src=url}}}();_pub.plugins.register(iBoxPlugin_Image);var iBoxPlugin_YouTube=function(){var youtube_url=/(?:http:\/\/)?(?:www\d*\.)?(youtube\.(?:[a-z]+))\/(?:v\/|(?:watch(?:\.php)?)?\?(?:.+&)?v=)([^&]+).*/;return{match:function(url){return url.match(youtube_url)},render:function(url,params){var _match=url.match(youtube_url);var domain=_match[1];var id=_match[2];params.width=425;params.height=355;params.can_resize=false;var html='<div><object width="425" height="355"><param name="movie" value="http://www.'+domain+"/v/"+id+'"/><param name="wmode" value="transparent"/><embed src="http://www.'+domain+"/v/"+id+'" type="application/x-shockwave-flash" wmode="transparent" width="425" height="355"></embed></object></div>';_pub.html(html,params)}}}();_pub.plugins.register(iBoxPlugin_YouTube);var iBoxPlugin_Document=function(){return{match:function(url){return true},render:function(url,params){_pub.http.open("get",url,true);_pub.http.onreadystatechange=function(){if(_pub.http.readyState==4){if(_pub.http.status==200||_pub.http.status==0){_pub.html(_pub.http.responseText,params)}else{_pub.html(document.createTextNode("There was an error loading the document."),params)}}};_pub.http.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");_pub.http.send(null)}}}();_pub.plugins.register(iBoxPlugin_Document);return _pub}();
/* End of ibox.js */




function addEmployerBriefcaseURL(){
	
	$("#nameId").hide();
    $("#nameId1").hide();
    $("#privacyId").hide();
	$("#fileId").hide();
	$("#categoryTypeId").hide();
	$("#urlId").hide();
    $("#validDocumentId").hide();
    
    var title=$("#name").val();
    var nameOfURL=$("#nameURL").val();
    var checkURL=nameOfURL.startsWith("http://www.");
	var checkURL2=nameOfURL.startsWith("www.");
	
	if(title==""){
		$("#nameId").show();
		$("#nameId").html("<h5>Please enter name of URL.</h5>");
		return false;
	}else if(nameOfURL==""){
		$("#nameId").show();
		$("#nameId").html("<h5>Please enter name of URL.</h5>");
		return false;
	}else if((checkURL==false)&&(checkURL2==false)){
		$("#nameId").show();
		$("#nameId").html("<h5>Please  enter valid URL.</h5>");
		return false;
	}
	var privacySetting=$("#privacySettingId").val();
	if(privacySetting==1){
		$("#nameId").hide();
		$("#nameId1").hide();	
		$("#privacyId").show();
		return false;
	}
}


function editEmployerBriefcaseDetailsURL(id){

	var  title=$("#txtname"+id).val();
	var  itemName = $("#txtURL"+id).val();
    var  itemPrivacySetting = $("#selprivacySetting"+id).val(); 
    //var checkURL=itemName.startsWith("http://www.");
	//var checkURL2=itemName.startsWith("www.");
   
    if(title=="")
    {
       bc_pop_up1('event',"confirm_delete2",["center",300]);
       $("#success").hide();
       $("#failure").hide();
       $("#failureMsg").html("<h6>Please enter URL </h6>");
       $("#validateTitleName").show();
      return false;
    }else if((itemPrivacySetting==1)){
        $("#failureMsg").html("");
        bc_pop_up1('event',"confirm_delete2",["center",300]);
        $("#success").hide();
        $("#failure").hide();
        $("#failureMsg").html("<h6>Please select privacy setting.</h6>");
        $("#validateTitleName").show();
        return false;
   }
   
   $.post("editEmployerBriefcaseURLItems.action",{'item.id' :id,'name':title,'itemURL':itemName,'privacySetting':itemPrivacySetting},function (data)
   {      
          
            if(data.result =="success")
            {
				$("#name1"+id).hide();
				$("#name"+id).show();
				$("#name"+id).html('<a target=\"_blank\" class="briefCaseLink" href='+data.itemURL+'>' +data.name+'</a>');
				
				$("#category1"+id).hide();
				$("#category"+id).show();
				//$("#category"+id).html(data.category);
				
				$("#privacySetting"+id).show();
				$("#privacySetting"+id).html(data.privacySetting);
				$("#privacySetting1"+id).hide();
				
				$("#actionId"+id).show();
				$("#actionId1"+id).hide();
			 //alert("updated Data sucessfully");
			    
			    
			    bc_pop_up1('event',"confirm_delete2",["center",300]);
			    $("#validateTitleName").hide();
			     $("#success").show();
            }else{
            //alert("Not updated Data sucessfully");
             bc_pop_up1('event',"confirm_delete2",["center",300]);
             $("#success").hide();
             $("#validateTitleName").hide();
            $("#failure").show();
          }                           
       
   },"json");
}

String.prototype.startsWith = function(str)

{return (this.match("^"+str)==str)}