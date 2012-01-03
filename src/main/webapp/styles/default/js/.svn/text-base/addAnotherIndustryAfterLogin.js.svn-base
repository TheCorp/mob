/*Start of addAnotherIndustryAfterLogin.js */	
var defaultInputTextColor = "#000000";
var contactId=0;
var categoryDivId;

function addAnotherIndustry()
	{
	   
	      
	      var name=$("#addIndustry").val();
	     
	      if(name==""){
		 //alert("Please enter industry")
		 $("#industryNameId").show();
		  return false;
		  }
		  else
		  {
		     $("#industryNameId").hide();
		     $("#progress").show();
		  }
	      
	        $.post("addIndusty.action",{'industry.name' :name},function (data)
            {      
			            if(data.result =="success")
			            {
			                            
			               $("#industryDetails").hide()
			                $("#progress").hide();
			               $("#success").show();
	                       $("#industry").val("")
			              $("#ajbx_industry").hide();
			            }
			            else
			            {
			             $("#industryDetails").hide()
			             $("#progress").hide();			                
			             $("#failure").show();
			             $("#industry").val("");
			            }                           
       
            },"json");
            
          // hide_pop_up_Industry();
	
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


function pop_up_industry(e,pop_up_id,location)
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
	
function hide_pop_up_Industry()
{
	$("#progress").hide();
	$("#success").hide();	
	$("#industryDetails").show();	
	$("#confirm_delete1").hide();
	$("#addIndustry").val("");
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
/*End of addAnotherIndustryAfterLogin.js */	