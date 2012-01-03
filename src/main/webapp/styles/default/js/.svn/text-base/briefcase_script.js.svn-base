var defaultInputTextColor = "#000000";
var contactId=0;
function inputOnFocus(what)
	{
	if (!what.alreadyClicked)
		{
		what.value = "";
		what.style.color = defaultInputTextColor;
		what.alreadyClicked = true;
		}
	}

/* PopUp1
location can be an x,y,rel coordinate array
where x and y are either a pixel coordinate or "center"
where rel is either "absolute" "relative" or "mouse"
examples:
pop_up(event,"my_popup",[200,300])
pop_up(event,"my_popup",["center",300])
pop_up(event,"my_popup",[-400,-200,"mouse"])
pop_up(event,"my_popup",[20,20,"negoffset_mouse"]) --> positions the box's lower right hand corner 20px up and left from the mouse
*/
function pop_up(e,id,name,spanid,pop_up_id,location)
	{
	
	
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
	
function deleteConactDetails()
{
 
 document.getElementById("delete").href= "deleteContact.action?contact.id="+contactId;
  
}	


function deleteBriefcaseDetails()
{
 
 document.getElementById("delete").href= "briefcaseitem.action?item.id="+contactId;
  
}	

function deleteEmployerBriefcaseDetails()
{
 
 document.getElementById("delete").href= "deleteEmployerBriefcaseDetails.action?item.id="+contactId;
  
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

function addItemToOpportunityList(parentFormID)
	{
	var tform = document.getElementById(parentFormID);
	var addToList = function(entry)
		{
		var getListLength = function()
			{
			var list = document.getElementById("opportunity_list");
			var divs = list.getElementsByTagName("div");
			var rows = new Array();
			for (var i=0;i<divs.length;i++)
				{
				if (checkClass(divs[i],"sel_prof_row")) rows.push(divs[i]);
				}
			return rows.length;
			}
		var list = document.getElementById("opportunity_list");
		var row = document.createElement("div");
		row.className = "sel_prof_row";
		var colClasses = ["spc_skillname","spc_numyears"];
		for (var i=0;i<colClasses.length&&i<entry.length;i++)
			{
			var col = document.createElement("div");
			col.className = "sel_prof_col "+colClasses[i];
			col.innerHTML = entry[i];
			row.appendChild(col);
			}
		var col = document.createElement("div");
		col.className = "sel_prof_col spc_actions";
		var a = document.createElement("a");
		a.innerHTML = '<img src="images/exp_entry-edit.gif" alt="Edit" />';
		a.href = "#";
		//a.onclick = function(){} //edit function
		col.appendChild(a);
		col.innerHTML = col.innerHTML + "&nbsp;&nbsp;";
		a = document.createElement("a");
		a.innerHTML = '<img src="images/mobc_redx.gif" alt="Remove" />';
		a.href = "#";
		a.parentEntry = row;
		a.parentEntry.index = getListLength();
		a.onclick = function()
			{
			removeItemFromOpportunityList(this.parentEntry.index);
			updateOpportunityListIndexes();
			}
		col.appendChild(a);
		row.appendChild(col);
		list.appendChild(row);
		}
	var j_name = tform.job_name.value || false;
	var num_y = tform.num_years.value || false;
	if (j_name && num_y) addToList([j_name,num_y+" years"]);
	return false;
	}

function updateOpportunityListIndexes()
	{
	var list = document.getElementById("opportunity_list");
	var divs = list.getElementsByTagName("div");
	var rows = new Array();
	for (var i=0;i<divs.length;i++)
		{
		if (checkClass(divs[i],"sel_prof_row")) rows.push(divs[i]);
		}
	for (var i=0;i<rows.length;i++) rows[i].index = i;
	}

function removeItemFromOpportunityList(index)
	{
	var list = document.getElementById("opportunity_list");
	var divs = list.getElementsByTagName("div");
	var rows = new Array();
	for (var i=0;i<divs.length;i++)
		{
		if (checkClass(divs[i],"sel_prof_row")) rows.push(divs[i]);
		}
	if (index < rows.length && list.removeChild) list.removeChild(rows[index]);
	return false;
	}

function setPercAnsweredTo(percentage)
	{
	var pA = document.getElementById("percAnswered");
	var total = pA.offsetWidth;
	var newWidth = Math.floor((percentage/100)*total);
	pA.getElementsByTagName("div")[0].style.width = newWidth+"px";
	document.getElementById("percExpl").innerHTML = percentage+"% of questions answered.";
	}
	
function bc_pop_up(e,pop_up_id,location)
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