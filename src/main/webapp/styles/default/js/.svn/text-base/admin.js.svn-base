var flagItemIds=[];
function validationsForAdmin()
{
var count = 0;
var	chkCnt=$("input:checkbox");
	for (i=0;i<chkCnt.length;++ i)
	  {
	  if (chkCnt[i].checked)
	    {
	       count++;
	    }
	  }
	  
	  if(count==0)
   {
    $("#confirm_deleteadmin").hide();
      $("#selectedFlagNameSpanId").html("Please select any check box");
      $("#selectedFlagNameSpanId").show();
     return false;
   } 
	 $("#countId").html(count);
   var selectedValue = $("#selectedFlagNameId").val();
   if(selectedValue==1)
   {
    $("#confirm_deleteadmin").hide();
      $("#selectedFlagNameSpanId").html("Please select an action");
      $("#selectedFlagNameSpanId").show();
     return false;
   }
   else if(selectedValue=="Flag")
   {
    $("#confirm_deleteadmin").show();
     return false;
   }else {
    $("#confirm_deleteadmin").hide();
     return true;
   
   
   }
   
}
function storeFlagcommentForAdmin() {
var count=0;
var	chkCnt=$("input:checkbox");
	for (i=0;i<chkCnt.length;++ i)
	  {
	  if (chkCnt[i].checked)
	    {
	    flagItemIds.push(chkCnt[i].value);
	    count++;
	    }
	  }
	  
	
     var flagComment=$("#flagComment").val();
     var type=$("#selectedFlagtypeId").val();
     var selectedFlagTypeName=$("#selectedFlagType").val();
    $.post("storeFlagCommentForAdmin.action",{'flagItemIds':flagItemIds,'flagComment':flagComment,'type':type,'selectedFlagTypeName':selectedFlagTypeName},function (data)
	   {
		   	     hide_pop_up('confirm_deleteadmin');  
		   	    $("#confirm_deleteadmin").hide();
		   	       
       },"json");       

}
function validationsForPopUp(){
 $("#confirm_deleteadmin").hide();
}
function validationForSearch()
{

     var selectedValue = $("#selectedFlagtypeId").val();
      
   if(selectedValue!="")
   {
       var selectedValue = $("#selectedFlagtypeId").val();
       if(selectedValue==1)
       {
		      $("#selectedFlagtypeSpanId").html("Please make a selection from the list below");
		      $("#selectedFlagtypeSpanId").show();
		      return false;
       }
   }
   else
   {
     return true;
   
   }
}


function bc_adminPop_up(e,pop_up_id,location)
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
/*popup For showing Flag comments*/
var commentsList;
function pop_upForShowingFlagComments(id){
var comments;
var catgoryTypes;
  

    hide_pop_up('confirm_delete5');
    $("#comment").html("");
	var temp="";
	var flagId=id;
	
	
	var commentyJSON=$("#commentsId").html();
		
	flagDataList = eval('(' + commentyJSON + ')').commentslist;
    var text = "<table>"
					+ "<tr>"
						+ "<th>"
							+"Category"
						+ "</th>"
						+ "<th>"
							+"Comment"
						+ "</th>"
					+ "</tr>";
				
    for(var i=0; i <flagDataList.length ; i++){
		var flagData = flagDataList[i];
		currentId = flagData.id;
		 comments = flagData.comments;
		 catgoryTypes=flagData.catogoryTypes;
		var noOfcatgoryTypes = catgoryTypes.length;
		var noOfComments = comments.length;
		for(var j=0; j<noOfComments;j++){
		   if(flagId==currentId){
		 	  text += "<tr>"
		 	  			+ "<td>"
		 	  				+ catgoryTypes[j].flagType
		 	  			+ "&nbsp;&nbsp;</td>"
		 	  			
		 	  			+ "<td>"
		 	  				+ comments[j].comment
		 	  			+ "</td>"
		 	  		+ "</tr>";
		    
		   }		  
		  
		}
   	}
   	
   	text += "</table>";
   	
   	  $("#comment").append(text);
   	    pop_upForFlagComment('event','confirm_delete5',['center',500]);
   
}
/* For admin popup */


function pop_upForFlagComment(e,pop_up_id,location)
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

function validationForFlagDataSearch(){

var selectedFlagDataId=$("#selectedFlagDataId").val();

$("#selectedFlagDataIdVal").val(selectedFlagDataId);
  if(selectedFlagDataId!="")
   {
       var selectedFlagValue = $("#selectedFlagDataId").val();
       if(selectedFlagValue==1)
       {
		      $("#selectedFlagedDataSpanId").html("Please make a selection from the list below");
		      $("#selectedFlagedDataSpanId").show();
		      return false;
       }
   }
   else
   {
     return true;
   
   }
 
 
 
}

function deleteFlaggedData()
{
  
   var selectedDeleteValue = $("#selectedFlagDeleteNameId").val();
   if(selectedDeleteValue==1)
   {
      $("#selectedFlagedDeleteSpanId").html("Please select an action");
      $("#selectedFlagedDeleteSpanId").show();
     return false;
   }
   else
   {
     return true;
   
   }

}

