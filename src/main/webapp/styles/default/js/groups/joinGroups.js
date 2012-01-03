
var  groupid;
var groupType;
var context = 'mob';
function  joinToGroup(){


$("#failureMsg").hide();
var profileId=$("#profileId").val();
var  message=$("#messageId").val();

if(profileId==""){
	$("#failureMsg").show();
	return false;
}else{

 /* Setting  hidden field  values  for submitting  request*/
 
$("#myGroupId").val(groupid)
$("#profilID").val(profileId)
$("#mygroupTitle").val(groupType)
$("#joinGrpForm").attr("action", "/" + context + "/search/joinGroupAction.action");
$("#joinGrpForm").submit();
return true;

	/* $.post("joinGroupAction.action",{'group.id' :groupid,'profile.id' :profileId,'message' :message, 'group.title' :groupType},
	
	            function(data)
	            {
	                if (data.result == "success") {
	             	 //$("#joinRowId"+groupid).remove();
	                 $("#imageId").hide();
	                 $("#contact_msg_details").hide()
	                 $("#selMsgContact").hide()
	                 $("#msgSuccess").show();
					}
	            }, "json");
 } */
}
}

function pop_up_join_group(e,grpid,grpType,pop_up_id,location)
{	
	$("#failureMsg").hide();
	$("#profileId").val("");
	$("#messageId").val("");
	$("#msgSuccess").hide();
	$("#imageId").show();
	$("#contact_msg_details").show()
	$("#selMsgContact").show()

	if(grpType=="Public"){
		$("#messageSpanID").hide();
	 }else{
		 $("#messageSpanID").show();
	 }
groupid=grpid;
groupType=grpType;
	hide_pop_up1(pop_up_id);
	
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
function hide_pop_up1(pop_up_id)
	{
	
	//var firstValue = document.getElementById("associatedProfileMsgId").options[0].value;
	//document.getElementById("associatedProfileMsgId").value=firstValue
	document.getElementById(pop_up_id).style.display = "none";
	return false;
	}