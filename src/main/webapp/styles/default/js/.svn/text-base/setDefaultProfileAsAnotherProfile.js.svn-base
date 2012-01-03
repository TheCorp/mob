/*set default profile as another profile   */

function getProfilesList(){
	$("#defaultProfileForm").attr("action","loadEmployeeProfilesList.action");
	$("#defaultProfileForm").submit();
}
function deleteOldDefaultProfile(){
	$("#defaultProfileForm").submit();
}
function setAsDefaultProfile(divid){
$("#pleaseSelectId").hide();
		var newDefaultProfileId=$("#newDefaultProfileId").val();
		if(newDefaultProfileId==1){
		$("#pleaseSelectId").show();
		}else{
		$("#progress").show();
		$("#selContact").hide();
			$.post("setAsDefaultProfile.action",{'newDefaultProfile.id':newDefaultProfileId},function (data)
			{
	                if(data.result=="success")
	                {
	                	$("#contact_details").hide();	
	                  	$("#progress").hide();
	                  	$("#changeprofile").hide();	
	                  	$("#success").show();
	                  	$("#pleaseSelectId").show();
	                }
	                else
	                {
	                	$("#contact_details").hide();	
	                	$("#changeprofile").hide();	
	                	$("#progress").hide();
	                	$("#failure").show();
	                	$("#pleaseSelectId").show();
	                }        
			},"json");
		
	}	
}

function hide_pop_up(pop_up_id)
	{
	$("#progress").hide();
	$("#success").hide();
	$("#failure").hide();
	$("#selContact").show();
	$("#changeprofile").hide();	
	$("#pleaseSelectId").hide();
	//var firstValue = document.getElementById("selContactId").options[0].value;
	//document.getElementById("selContactId").value=firstValue
	document.getElementById(pop_up_id).style.display = "none";
	return false;
	}

function chkSelProfile(){
var newDefaultProfileId=$("#newDefaultProfileId").val();
if(newDefaultProfileId!=1){
$("#pleaseSelectId").hide();

}
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

function popup_delete_defaultProfile(e,profileId,pop_up_id,location)
	{
	$("#defaultProfileId").val(profileId);	
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
/* End of set default profile as another profile  */