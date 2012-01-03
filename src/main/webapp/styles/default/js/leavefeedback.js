var defaultInputTextColor = "#000000";

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
function pop_up(e,pop_up_id,location)
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


	
function storeEmployeeFeedback(divid)
{
        document.getElementById("spanid").innerText=250;
	    var feedbac = document.getElementById("textareaId").value
	   
	   
	    var id = document.getElementById("profileid").value
	    var profileownerid = document.getElementById("profileownerid").value
	    
	     $.post("feedbackForEmployeeFromSearch.action",{'feedbac':feedbac,'profile.id':id,'profileOwner.id':profileownerid},function (data)
            {      
			            if(data.result=="success")
			            {
			              
			              alert("Feedback Added Successfully");
			              var positive = data.positive;			             
			              $("#positiveid").html(positive);
			              
			              var allProfileFeedbacks = data.allProfileFeedbacks;			             
			              $("#allfeedbacksid").html(allProfileFeedbacks);
			              
			            }
			            else
			            {
			            alert("Feedback Cannot be More Than 250 Charaters");
			            }                           
       
            },"json");
           hiding_pop_up(divid);
	    
}	
	
	function hiding_pop_up(pop_up_id)
	{
	    
	    document.getElementById("spanid").innerText=250;
	    document.getElementById("textareaId").value="";
	    document.getElementById(pop_up_id).style.display = "none";
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
	
function storeEmployerFeedback(divid)
{

 alert("In Employer  Leave feedback:-");
       document.getElementById("spanid").innerText=250;
	    var feedbac = document.getElementById("textareaId").value
	   
	   
	    var id = document.getElementById("profileid").value
	    
	    var profileownerid = document.getElementById("profileownerid").value
	    
	     $.post("feedbackForEmployerFromSearch.action",{'feedbac':feedbac,'profile.id':id,'profileOwner.id':profileownerid},function (data)
            {      
			            if(data.result=="success")
			            {
			              
			              alert("Feedback Added Successfully");
			              var feedback = data.feedback;			             
			             // document.getElementById("positiveid").innerText=positive;
			              $("#feedBackCount").html(feedback)
			            }
			            else
			            {
			            alert("Feedback Cannot be More Than 250 Charaters");
			            }                           
       
            },"json");
           hiding_pop_up(divid); 
	    
}	