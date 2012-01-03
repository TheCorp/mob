/* Start of employeeContacts.js */	
var defaultInputTextColor = "#000000";
var contactId=0;

/* Added for Edit contacts */

function editContactList(id,associatedProfileId){
    
    hide_pop_up("confirm_delete");
    hide_pop_up("confirm_delete2");
	var hiddenIdForEdit_id=$("#hiddenIdForEdit_id").val();
	
	if(hiddenIdForEdit_id!=0){
	
		var lablelName=$("#lblId"+hiddenIdForEdit_id).html();
	
		$("#lblId"+hiddenIdForEdit_id).show();
		$("#lblId1"+hiddenIdForEdit_id).show();	
		$("#imgIds"+hiddenIdForEdit_id).show();
		
		$("#nickName"+hiddenIdForEdit_id).hide();
		$("#contTypeID"+hiddenIdForEdit_id).hide();
		$("#imgIds1"+hiddenIdForEdit_id).hide();
		//$("#nickNames"+hiddenIdForEdit_id).val(lablelName);
	
	}
			$("#lblId"+id).show();
		//	$("#nickName"+id).show();		
			var ContactType=$("#lblId1"+id).html();
			$("#lblId1"+id).hide();	
			
			
			$.post("getContactTypeList.action",{'associatedProfileId':associatedProfileId},function (data)
  		    {                             
                  var htmlText = '<select id="contTypeIDs'+id+'"><option>'+ContactType+'</option> '
                  for(var i=0;i<data.contactTypes.length;i++)
                  {
                     if(data.contactTypes[i]!=ContactType)
                     {
				     htmlText += '<option value='+data.contactTypes[i]+'>' + data.contactTypes[i] + '</option>\n';
				     }
	              }
	                 htmlText += '</select>';         	
                	        
			     $("#contTypeID"+id).html(htmlText);
                 
           },"json"); 

			$("#contTypeID"+id).show();					
			$("#imgIds"+id).hide();
			$("#imgIds1"+id).show();
			$("#hiddenIdForEdit_id").val(id);
			
			
}
function updateContacts(id,profileID){
 
	var nickName=$("#lblId"+id).html();
	var contactType=$("#contTypeIDs"+id).val();
	
		 $.post("editEmployerContactsItems.action",{'contact.id' :id,'contact.nickName':nickName,'contact.contactType':contactType,'associatedProfileId':profileID},function (data)
  		 {      
  		   
            if(data.result =="success")
            {
             
	            // $("#nickName"+id).hide();
	             $("#lblId"+id).show();
	             $("#lblId"+id).html(data.nickName)
	             $("#lblId1"+id).show();
	             $("#lblId1"+id).html(data.contactType)
				 $("#contTypeID"+id).hide();				 
				 $("#imgIds"+id).show();
				 $("#imgIds1"+id).hide();
				 $("#modifiedDateId"+id).html(data.modifiedDate);
				// alert("updated Data sucessfully");
				bc_pop_up1('event',"confirm_delete2",["center",300])
				$("#success").show();
            }
            else
            {
               // alert("Not updated Data sucessfully");
                bc_pop_up1('event',"confirm_delete2",["center",300]);
				$("#success").hide();
				$("#failure").show();
            }                           
       
   },"json"); 
}

function cancelContactsAction(id){

            $("#lblId"+id).show();
			//$("#nickName"+id).hide();
			$("#lblId1"+id).show();	
			$("#contTypeID"+id).hide();
				         
			$("#imgIds"+id).show();
			$("#imgIds1"+id).hide();

}
/* End of Edit contacts */


/*Added for pop_up's */
function inputOnFocus(what)
	{
	if (!what.alreadyClicked)
		{
		what.value = "";
		what.style.color = defaultInputTextColor;
		what.alreadyClicked = true;
		}
	}


function contactpop_up(e,id,name,pop_up_id,location)
{
   
	hide_pop_up("confirm_delete2");
	var hiddenIdForEdit_id=$("#hiddenIdForEdit_id").val();
	if(hiddenIdForEdit_id!=0){
		$("#lblId"+hiddenIdForEdit_id).show();
		$("#lblId1"+hiddenIdForEdit_id).show();	
		$("#imgIds"+hiddenIdForEdit_id).show();
		
		$("#nickName"+hiddenIdForEdit_id).hide();
		$("#contTypeID"+hiddenIdForEdit_id).hide();
		$("#imgIds1"+hiddenIdForEdit_id).hide();
	
	}  
	
	
	contactId=id; 
	$("#contactName").html(name);
	
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
/*End of pop_up's */

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

/* End of employeeContacts.js*/	