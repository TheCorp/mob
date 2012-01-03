function checkForExistingGroup(){

   
   	var status=true;
	var groupNameId=$("#groupNameId").val();
	var selectedGrpType=$("#selectedGrpType").val();
	var profileId=$("#profileListId").val();
	var file = $("#uploadpic").val();
	if(groupNameId==""){
	
	   $("#groupNameSpanId").html("Please  enter group name");
	   status=false;
    }
    if(selectedGrpType==1){
	   $("#groupTypeSpanId").html("Please select group type");
	   status=false;
    }
    if(profileId==1){
	   $("#groupProfileSpanId").html("Please select profile");
	   status=false;
    }
     if(file!="")
	{
	  
	     extArray = new Array(".jpg", ".gif");
         allowSubmit = false;
    
         if (!file) return;
         while (file.indexOf("\\") != -1)
    
         file = file.slice(file.indexOf("\\") + 1);
         ext = file.slice(file.indexOf(".")).toLowerCase();
         for (var i = 0; i < extArray.length; i++) {
            if (extArray[i] == ext) {
                allowSubmit = true;
                break;
            }
         }
         if (!allowSubmit)
         {
          $("#picId").html('<h5>Please upload .jpg or .gif files');      
	        status=false;
	       
         }
        else
        {
           /* alert("Please only upload files that end in types:  "
                    + (extArray.join("  ")) + "\nPlease select a new "
                    + "file to upload and submit again."); */
             $("#picId").html('');
                   
               
       }        
	
	
	}
    if(status){
      return true;
    }else
    {
      return false;
    }
    

}

function  showTopicPopup(){

}


function hide_pop_up1(pop_up_id)
	{
	
	//var firstValue = document.getElementById("associatedProfileMsgId").options[0].value;
	//document.getElementById("associatedProfileMsgId").value=firstValue
	document.getElementById(pop_up_id).style.display = "none";
	return false;
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

var  grpId;
function showTopicPopup(e,groupid,groupname,pop_up_id,location)
{	
if(grpId!=0){
grpId=groupid
}
$("#groupId").val(grpId);
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
	
	
	
	
function createTopics(divid){
	
	var topics=$("#topicId").val();
	var description=$("#descId").val();
	var groupId=$("#groupId").val();
			$.post("createTopicsAction.action",
			{'topics': topics,'description': description,
			'group.id':groupId},function (data)
			{
			 
	                if(data.result=="success")
	                {
	                	
	                    $("#msgSuccess").show();
	                }
	                else
	                {
	                	alert("Unable  to  update the Topics!")
	                }        
			},"json");
	
}