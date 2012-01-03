var opportunityId;
function markasfavorite_pop_up(e,opportunityid,pop_up_id,location)
	{
	opportunityId=opportunityid;
	$("#profilesDivForMarkasFavorite").show();
	$("#markAsFavorite").show();
	$("#bookmarkedemployeeid").val("");
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
	
	
function markAsFavoriteThisOpp(divId){
 var bookmarkedEmployeeid=$("#bookmarkedemployeeid").val();
 if(bookmarkedEmployeeid==""){
	 $("#selectProfile_mark_favorite").show();
  }else{
	 $("#favorite_progress").show();
	$("#markAsFavorite").hide();
 $.post("../search/bookMarkeOpportunity.action",{opportunityId:opportunityId,bookmarkedEmployeeid:bookmarkedEmployeeid},function(data)
 {
 if(data.result=="success"){
   		//alert("Marked the opportunity as your favorite");
   		$("#profilesDivForMarkasFavorite").hide();	
        $("#favorite_progress").hide();	
        $("#favorite_success").show();
   		}else{
   		//alert("failure");
   		$("#profilesDivForMarkasFavorite").hide();	
        $("#favorite_progress").hide();
        $("#favorite_failure").show();	
   		}
 },"json");
 }
//markasfav_hide_pop_up(divId);
}
function markasfav_hide_pop_up(pop_up_id)
	{
	$("#favorite_progress").hide();
	$("#favorite_success").hide();
	$("#favorite_failure").hide();
	$("#selectProfile_mark_favorite").hide();
	document.getElementById(pop_up_id).style.display = "none";
	return false;
	}
function chkSeletedProfile(){
 var bookmarkedEmployeeid=$("#bookmarkedemployeeid").val();
 if(bookmarkedEmployeeid!=""){
 $("#selectProfile_mark_favorite").hide();
  }
}