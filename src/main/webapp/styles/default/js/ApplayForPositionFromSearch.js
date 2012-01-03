var defaultInputTextColor = "#000000";
var opportunityid;

function applyForPosition_pop_up(e,id,pop_up_id,location)
	{
	$("#profilesDiv").show();
	$("#applyforopportunity").show();	
	$("#interestedEmployeeid").val("");
	opportunityid=id;
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
			if (!isNaN(location[0])) x += mxy[0];
			if (!isNaN(location[1])) y += mxy[1];
			}
		else if (location[2] == "negoffset_mouse")
			{
			var mxy = getMouseXY(e);
			if (!isNaN(location[0])) x = mxy[0] - whe[0] - x;
			if (!isNaN(location[1])) y = mxy[1] - whe[1] - y;			
			}
		p.style.position = rel;
		p.style.left = Math.round(x)+"px";
		p.style.top = Math.round(y)+"px";
		}
	p.style.visibility = "visible";
	return false;
	}
	
 function applyforopportunity(divId)
 {
   var interestedemployeeid=$("#interestedEmployeeid").val();
   if(interestedemployeeid==""){
   $("#selectProfile_apply_job").show();
   }else{
     $("#progress").show();
	 $("#applyforopportunity").hide();
	 $.post("../search/applyForOpportunity.action",{opportunityid:opportunityid,interestedEmployee:interestedemployeeid},function(data)
	 {
	 if(data.result=="success"){
	   		//alert("Your application has been sent successfully");
	   		$("#profilesDiv").hide();	
           	$("#progress").hide();	
           	$("#success").show();
	   		}else{
	   		//alert("failure");
           	$("#profilesDiv").hide();	
           	$("#progress").hide();
           	$("#failure").show();	   		
	   		}
	 },"json");
  }
}	

function applyPosition_hide_pop_up(pop_up_id)
	{
	$("#progress").hide();
	$("#success").hide();
	$("#failure").hide();
	document.getElementById(pop_up_id).style.display = "none";
	return false;
	}
function chkSelectedProfile(){
 var interestedemployeeid=$("#interestedEmployeeid").val();
   if(interestedemployeeid!=""){
   $("#selectProfile_apply_job").hide();
  }
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

function getWidthHeightOfDocument()
	{
	var w = 0;
	var h = 0;
	if (window.clientWidth && window.clientHeight)
		{
		w = window.clientWidth;
		h = window.clientHeight;
		}
	else
		{
		var b = document.getElementsByTagName("body")[0];
		if (b.clientWidth && b.clientHeight)
			{
			w = b.clientWidth;
			h = b.clientHeight;			
			}
		}
	return [w,h];	
	}

function getWidthHeightOfWindow()
	{
	var w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth || 0;
	var h = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight || 0;
	return [w,h];	
	}

function getScrollHeight()
	{
	return window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;
	}

function getCenterOfScreen()
	{
	var scrollHeight = getScrollHeight();
	var wh_window = getWidthHeightOfWindow();
	var x = wh_window[0]/2;
	var y = wh_window[1]/2+scrollHeight;
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
