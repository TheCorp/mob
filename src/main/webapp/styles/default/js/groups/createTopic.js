var  groupid;
var  profileId;
function pop_upForCreateTopic(e,id,name,spanid,pop_up_id,location){
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
		clearTextFields();
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
function storeFlagcomment(){

 

     var flagComment=$("#flagComment").val();
     var type=$("#type").val();
     var selectedFlagTypeName=$("#selectedFlagTypeId").val();
    
     $.post("storeFlagComment.action",{'flagItemId':flagItemId,'flagComment':flagComment,'type':type,'selectedFlagTypeName':selectedFlagTypeName},function (data)
	   {
		   	        
		   	       hide_pop_up('confirm_delete');   
       
       },"json");
}
function storeFlagcommentForProfile() {


     var flagComment=$("#flagComment").val();
     var type=$("#profileType").val();
     var selectedFlagTypeName=$("#selectedFlagTypeProfileId").val();
     
     $.post("storeFlagComment.action",{'flagItemId':flagItemId,'flagComment':flagComment,'type':type,'selectedFlagTypeName':selectedFlagTypeName},function (data)
	   {
		   	        
		   	       hide_pop_up('confirm_delete');   
       
       },"json");

}

var latestTopicID;
var  count=0;
function  saveTopics(){
$("#topicSpanId").hide();
$("#sucees_message").hide();
var groupId=$("#groupId").val();
var profileId=$("#profileId").val();
var topic=$("#topic").val();
var  description=$("#description").val();
var profileNameId=$("#profileNameId").val();

var now = new Date();

var  timeNow=now.format("hh:MM TT");

var currentTime = new Date()
	var month = currentTime.getMonth() + 1
	var day = currentTime.getDate()
	var year = currentTime.getFullYear()
	var time= currentTime.getTime()
	
	if(day<10){
	day="0"+day;
	}	
	if(month<10){
	month="0"+month;
	}	
if(topic==""){
	$("#topicSpanId").show();
	return false;
}else{
			 		
$.post("savegroupTopics.action",{'group.id' :groupId,'profile.id' :profileId,'objTopics.topic' :topic,'objTopics.description' :description},
	
	            function(data)
	            {
	                if (data.result == "success") {
	                latestTopicID =data.newTopicId;
	                count= count+1;
	                var  countMod=count%2;
	                if(countMod==0){
			                var htmlText=""+
				            "<div class='odd'>&nbsp;&nbsp;<a href='postTopics.action?topic.id="+latestTopicID+"&profile.id="+profileId+"&group.id="+groupId+"'>"+topic+"</a><br><span class='grey'>&nbsp;&nbsp;No Posts in this Topic</span>"+
							"</div><div style='margin-left: 680px;margin-top: -22px'><div>"+profileNameId+"<br><span class='grey'>Created on "+day+"-" + month + "-" + year+ " at " + timeNow+"</span></div>"+
							"<div align='' style='margin-left: 890px;margin-top:-15px'>0</div>"
						  }else{	
							 var htmlText=""+
				            "<div class='even'>&nbsp;&nbsp;<a href='postTopics.action?topic.id="+latestTopicID+"&profile.id="+profileId+"&group.id="+groupId+"'>"+topic+"</a><br><span class='grey'>&nbsp;&nbsp;No Posts in this Topic</span>"+
							"</div><div style='margin-left: 680px;margin-top: -22px'><div>"+profileNameId+"<br><span class='grey'>Created on "+day+"-" + month + "-" + year+ " at " + timeNow+"</span></div>"+
							"<div align='' style='margin-left: 890px;margin-top:-15px'>0</div>"
					  	  }		
				            $("#addtopicsList").prepend(htmlText);
				            $("#sucees_message").show();
	                        $("#sucees_message").html("<h6 fontcolor='green'>Topics posted sucessfully</h6>").fadeOut(5000);
	                        hide_pop_up('confirm_delete');
	                		$("#description").val("");
							$("#topic").val("");
					}
	            }, "json");
 } 
 
}
function postCommentValidations(){
  var groupdiscussionId=$("#groupdiscussionId").val();
  var profileListId=$("#profileListId").val();
  if(groupdiscussionId==""){
	$("#groupdiscussionSpanId").show();
	 $("#failureMsgId").html("<h5>Please enter description</h5>");
     return false;
  
  }else if(profileListId=="1"){
	  $("#failureMsgId").html("");
	  $("#groupdiscussionSpanId").show("");
	  $("#failureMsgId").html("<h5>Please select profile</h5>");
	   return false;
  }else{
    $("#groupdiscussionId").val(groupdiscussionId);

    return true;
  
  }

}


function clearTextFields(){
	$("#topicSpanId").hide();
	$("#sucees_message").hide();
	$("#description").val("");
	$("#topic").val("");
}

function lineBreak() {
	var taskDescrptionDivs = $("[name=taskDescrptionDiv]");
	taskDescrptionDivs.each (
			function(index, rmDelDivObj) {
				var id = rmDelDivObj.getAttribute('id');
				var text = $("#" + id).html();
				text = text.replace(/\n/g, "<br/>");
				$("#" + id).html(text);
			}
	);
	
}




/*
 * Date Format 1.2.3
 * (c) 2007-2009 Steven Levithan <stevenlevithan.com>
 * MIT license
 *
 * Includes enhancements by Scott Trenda <scott.trenda.net>
 * and Kris Kowal <cixar.com/~kris.kowal/>
 *
 * Accepts a date, a mask, or a date and a mask.
 * Returns a formatted version of the given date.
 * The date defaults to the current date/time.
 * The mask defaults to dateFormat.masks.default.
 */

var dateFormat = function () {
	var	token = /d{1,4}|m{1,4}|yy(?:yy)?|([HhMsTt])\1?|[LloSZ]|"[^"]*"|'[^']*'/g,
		timezone = /\b(?:[PMCEA][SDP]T|(?:Pacific|Mountain|Central|Eastern|Atlantic) (?:Standard|Daylight|Prevailing) Time|(?:GMT|UTC)(?:[-+]\d{4})?)\b/g,
		timezoneClip = /[^-+\dA-Z]/g,
		pad = function (val, len) {
			val = String(val);
			len = len || 2;
			while (val.length < len) val = "0" + val;
			return val;
		};

	// Regexes and supporting functions are cached through closure
	return function (date, mask, utc) {
		var dF = dateFormat;

		// You can't provide utc if you skip other args (use the "UTC:" mask prefix)
		if (arguments.length == 1 && Object.prototype.toString.call(date) == "[object String]" && !/\d/.test(date)) {
			mask = date;
			date = undefined;
		}

		// Passing date through Date applies Date.parse, if necessary
		date = date ? new Date(date) : new Date;
		if (isNaN(date)) throw SyntaxError("invalid date");

		mask = String(dF.masks[mask] || mask || dF.masks["default"]);

		// Allow setting the utc argument via the mask
		if (mask.slice(0, 4) == "UTC:") {
			mask = mask.slice(4);
			utc = true;
		}

		var	_ = utc ? "getUTC" : "get",
			d = date[_ + "Date"](),
			D = date[_ + "Day"](),
			m = date[_ + "Month"](),
			y = date[_ + "FullYear"](),
			H = date[_ + "Hours"](),
			M = date[_ + "Minutes"](),
			s = date[_ + "Seconds"](),
			L = date[_ + "Milliseconds"](),
			o = utc ? 0 : date.getTimezoneOffset(),
			flags = {
				d:    d,
				dd:   pad(d),
				ddd:  dF.i18n.dayNames[D],
				dddd: dF.i18n.dayNames[D + 7],
				m:    m + 1,
				mm:   pad(m + 1),
				mmm:  dF.i18n.monthNames[m],
				mmmm: dF.i18n.monthNames[m + 12],
				yy:   String(y).slice(2),
				yyyy: y,
				h:    H % 12 || 12,
				hh:   pad(H % 12 || 12),
				H:    H,
				HH:   pad(H),
				M:    M,
				MM:   pad(M),
				s:    s,
				ss:   pad(s),
				l:    pad(L, 3),
				L:    pad(L > 99 ? Math.round(L / 10) : L),
				t:    H < 12 ? "a"  : "p",
				tt:   H < 12 ? "am" : "pm",
				T:    H < 12 ? "A"  : "P",
				TT:   H < 12 ? "AM" : "PM",
				Z:    utc ? "UTC" : (String(date).match(timezone) || [""]).pop().replace(timezoneClip, ""),
				o:    (o > 0 ? "-" : "+") + pad(Math.floor(Math.abs(o) / 60) * 100 + Math.abs(o) % 60, 4),
				S:    ["th", "st", "nd", "rd"][d % 10 > 3 ? 0 : (d % 100 - d % 10 != 10) * d % 10]
			};

		return mask.replace(token, function ($0) {
			return $0 in flags ? flags[$0] : $0.slice(1, $0.length - 1);
		});
	};
}();

// Some common format strings
dateFormat.masks = {
	"default":      "ddd mmm dd yyyy HH:MM:ss",
	shortDate:      "m/d/yy",
	mediumDate:     "mmm d, yyyy",
	longDate:       "mmmm d, yyyy",
	fullDate:       "dddd, mmmm d, yyyy",
	shortTime:      "h:MM TT",
	mediumTime:     "h:MM:ss TT",
	longTime:       "h:MM:ss TT Z",
	isoDate:        "yyyy-mm-dd",
	isoTime:        "HH:MM:ss",
	isoDateTime:    "yyyy-mm-dd'T'HH:MM:ss",
	isoUtcDateTime: "UTC:yyyy-mm-dd'T'HH:MM:ss'Z'"
};

// Internationalization strings
dateFormat.i18n = {
	dayNames: [
		"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat",
		"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
	],
	monthNames: [
		"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
		"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
	]
};

// For convenience...
Date.prototype.format = function (mask, utc) {
	return dateFormat(this, mask, utc);
};
