/* Start of editskills.js */


var count=0
var Edit=0
var idForEdit;


$(document).ready(function(){
var industryIDval=$("#industryIDval").val();
   $("#industry").val(industryIDval); 
   //setPercAnsweredTo(70);
  // $("#addbtn_skills").click(addSkills);
});


function checkIndustry(){
var  industryVal=$("#industry").val();
	if(industryVal==null||industryVal==0){
	$("#selectIndustryId").html("<h5><font color='red'>Please select Industry</font></h5>");
	 return false;
	}else{
	 return  true;
	}
}
function loadEditSkills(id){
$("#editskillsId").html("");

    var skillName=$("#skillname"+id).val()
	var experience=$("#experience"+id).val()
	var level=$("#level"+id).val()
	var notes=$("#notes"+id).val()
	var categoryname=$("#categoryname"+id).val()
	
	
	/* Fetching data for Edit functionality */
  	$("#skills").val(skillName)
    $("#experience").val(experience)
    $("#skill_level").val(level)
    $("#notes").val(notes)
    $("#skillscategory").val(categoryname);
    
  
 
    $("#addbtn_skills").unbind();
    idForEdit=id
    $("#addbtn_skills").click(editskills);
    
}

function loadNewEditSkills(id){
$("#editskillsId").html("");
    var skillName=$("#skillfromlist1"+id).val()
	var experience=$("#experiencenew"+id).val()
	var level=$("#levelnew"+id).val()
	var notes=$("#notesnew"+id).val()
   var categoryname=$("#categorynamenew"+id).val()
  	 /* Fetching data for Edit functionality */
  	 
  	$("#skills").val(skillName)
    $("#experience").val(experience)
    $("#skill_level").val(level)
    $("#notes").val(notes)
    $("#skillscategory").val(categoryname);
    
    $("#addbtn_skills").unbind();
    idForEdit=id
    $("#addbtn_skills").click(editNewskills);
}
function editskills(){

     $("#editskillsId").html(""); 
			    
	var skillname_tb=$("#skills").val()
	var experience_tb=$("#experience").val()
	var level_tb=$("#skill_level").val()
	var notes_tb=$("#notes").val()
  	var category_tb=$("#skillscategory").val()
		if(skillname_tb=="1")
		{
			//alert('Please select Skills');
			$("#editskillsId").html("<h5>Please select skills</h5>"); 
			return;	
		}	
		if(experience_tb=="")
		{
			//alert('Please enter years of experience');
			$("#editskillsId").html("<h5>Please enter years of experience</h5>");
			return;	
		}
		if(experience_tb.length>45)
		{
			//alert('Please enter years of experience');
			$("#editskillsId").html("<h5>Should have less than 45 characters</h5>");
			return;	
		}	
		if(notes_tb.length>45)
		{
			//alert('Please enter years of experience');
			$("#editskillsId").html("<h5>Should have less than 45 characters</h5>");
			return;	
		}			
				
		if(level_tb=="1")
		{	
			//alert('Please select skill level');
			$("#editskillsId").html("<h5>Please select skill level</h5>");
			return;	
		}	
		if(category_tb=="")
		{	
			//alert('Please select skill level');
			$("#editskillsId").html("<h5>Please enter Category</h5>");
			return;	
		}	
		
		
		
		$("#skillname"+idForEdit).val(skillname_tb)
		$("#experience"+idForEdit).val(experience_tb)
		$("#level"+idForEdit).val(level_tb)
		$("#notes"+idForEdit).val(notes_tb)
		$("#categoryname"+idForEdit).val(category_tb)
		
		$("#skillname_div"+idForEdit).html(skillname_tb)
		$("#experience_div"+idForEdit).html(experience_tb)
		$("#level_div"+idForEdit).html(level_tb)
		$("#notes_div"+idForEdit).html(notes_tb)
		$("#category_div"+idForEdit).html(category_tb)
		
		
		$("#skills").val("")
	    $("#experience").val("")
	    $("#skill_level").val("1")
	    $("#notes").val("")
	    //$("#industry").val("");
        $("#skillscategory").val("");
	    
	    $("#addbtn_skills").unbind();
        $("#addbtn_skills").click(addSkills);

}

function editNewskills(){

	$("#editskillsId").html(""); 
	var skillname_tb=$("#skills").val()
	var experience_tb=$("#experience").val()
	var level_tb=$("#skill_level").val()
	var notes_tb=$("#notes").val()
	var category_tb=$("#skillscategory").val()
	
		if(category_tb=="")
		{	
				$("#editskillsId").html("<h5>Please enter a category</h5>");
			return;	
		}	
		if(skillname_tb=="")
		{
			$("#editskillsId").html("<h5>Please select a skill</h5>"); 
			return;	
		}	
		if(experience_tb=="")
		{
			$("#editskillsId").html("<h5>Please select years of experience</h5>");
			return;	
		}
		if(experience_tb.length>45)
		{
			$("#editskillsId").html("<h5>Should have less than 45 characters</h5>");
			return;	
		}	
		if(notes_tb.length>45)
		{
			$("#editskillsId").html("<h5>Should have less than 45 characters</h5>");
			return;	
		}			
				
		if(level_tb=="1")
		{	
				$("#editskillsId").html("<h5>Please select a skill level</h5>");
			return;	
		}
		
		$("#skillnamenew"+idForEdit).val(skillname_tb)
		$("#experiencenew"+idForEdit).val(experience_tb)
		$("#levelnew"+idForEdit).val(level_tb)
		$("#notesnew"+idForEdit).val(notes_tb)
		$("#categorynamenew"+idForEdit).val(category_tb);
		
		$("#skillname_divnew"+idForEdit).html(skillname_tb)
		$("#experience_divnew"+idForEdit).html(experience_tb)
		$("#level_divnew"+idForEdit).html(level_tb)
		$("#notes_divnew"+idForEdit).html(notes_tb)
		$("#category_divnew"+idForEdit).html(category_tb)
		

		$("#skills").val("")
	    $("#experience").val("")
	    $("#skill_level").val("1")
	    $("#notes").val("")
	   // $("#industry").val("");
        $("#skillscategory").val("");
	    
	    $("#addbtn_skills").unbind();
        $("#addbtn_skills").click(addSkills);

}
function addSkills(){
	$("#editskillsId").html(""); 
	
	var skillname_tb=$("#skillfromlist1").val()
	var experience_tb=$("#experience").val()
	var level_tb=$("#skill_level").val()
	var notes_tb=$("#notes").val()
	var category_tb=$("#skillscategory").val()
	  
  		if(category_tb=="")
		{	
			$("#editskillsId").html("<h5>Please enter a category name</h5>");
			return;	
		}
		if(skillname_tb=="1")
		{
			$("#editskillsId").html("<h5>Please enter a skill</h5>"); 
			return;	
		}	
		if(experience_tb=="")
		{
			$("#editskillsId").html("<h5>Please enter years of experience</h5>");
			return;	
		}
		if(experience_tb.length>45)
		{
			$("#editskillsId").html("<h5>Should have less than 45 characters</h5>");
			return;	
		}
		if(notes_tb.length>45)
		{
			$("#editskillsId").html("<h5>Should have less than 45 characters</h5>");
			return;	
		}				
				
		if(level_tb=="1")
		{	
			$("#editskillsId").html("<h5>Please select skill level</h5>");
			return;	
		}

			
		
		
		count=count+1;
	  	var htmlText= 	"<div class='signupEducationRow' id='skillsdivnew" + count + "'>" + 
	  						"<div class='category' id='categorynamenew"+count+"'>" + category_tb + "</div>" +
	  						"<div class='skillName' id='skillnamenew"+count+"'>" + skillname_tb + "</div>" +
	  						"<div class='yearsExp' id='experiencenew"+count+"'>" + experience_tb + "</div>" +
	  						"<div class='skillLevel' id='levelnew"+count+"'>" + level_tb + "</div>" +
	  						"<div class='notes' id='notesnew"+count+"'>" + notes_tb + "&nbsp;</div>" +
	  						"<img class='workExperienceIcon' src='../styles/default/images/exp_entry-remove.gif' onclick=deleteNewSkills('"+count+"')>" +
	  						"<input type='hidden' id='categorynamenew"+count+"' name='newCategoryName' value='"+category_tb+"'/>" + 
							"<input type='hidden' id='skillnamenew"+count+"' name='newSkillName' value='"+skillname_tb+"'/>" + 
							"<input type='hidden' id='experiencenew"+count+"' name='newExperience' value='" +experience_tb+ "'/>" +
							"<input type='hidden' id='levelnew"+count+"' name='newLevel' value='" +level_tb+ "'/>" +
							"<input type='hidden' id='notesnew"+count+"' name='newNotes' value='" +notes_tb+ "'/>" +
	  					"</div>";
				 
				$("#sel_prof_row").append(htmlText) 
				$("#skills").val("")
			    $("#experience").val("")
			    $("#skill_level").val("1")
			    $("#notes").val("")
                $("#skillscategory").val("");
    }

function deleteSkills(id){
$("#editskillsId").html("");

   /*Added for storing deleted rowid into a textfield */
	var htmlText="<div class='deleteskills' id='del"+id+"'><input type='hidden' name='delskillrow' id='delrowid"+id+"' value='"+id+"' /></div>";
	$("#deleteskills").append(htmlText) 
	
	/*Added for deleting existing rows from db  */			
	$("#skillsdiv"+id).remove();
	
	$("#skills").val("")
    $("#experience").val("")
    $("#skill_level").val("1")
    $("#notes").val("")
    //$("#industry").val("");
    $("#skillscategory").val("");
	
	
	$("#addbtn_skills").unbind();
    $("#addbtn_skills").click(addSkills);
}
function deleteNewSkills(id){
	$("#editskillsId").html("");
	/*Added for deleting new rows from div tag*/
	$("#skillsdivnew"+id).remove();
	
	$("#skills").val("")
    $("#experience").val("")
    $("#skill_level").val("1")
    $("#notes").val("")
    //$("#industry").val("");
    $("#skillscategory").val("");
	
	$("#addbtn_skills").unbind();
    $("#addbtn_skills").click(addSkills);
	
}
/* End of editskills.js */

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

/* Start of addAnotherCategoryAfterLogin.js */
function pop_up_category(e,pop_up_id,location){

	var indusry_txt_box=$("#industry").val();
	
	if(indusry_txt_box==1)
	{
	   hide_addcategory_pop_up();
	   var industriesList=[]; 
	 
	 $.post("getAllIndustries.action",{},function(data)
	 {
	 	for(var i=0;i<data.names.length;i++){
			var myString=data.names[i];
			myArray = myString.split(",");
				for(var j=0;j<myArray.length;j++){
				industriesList.push(myArray[j]);
				}
		}
		 var htmlText ='<div id="category_popup_id" class="popup1-content"><div class="pu_row"><div class="pu_col right" style="width: 200px;">'+ 
		 			   '<span id="categoryDetails"><span style="display:none;margin-top: 30px;color: red" id="commonId">'+		               
		               '</span><h5>Industry<br><select id="industryId_tb" name="industryId" ><option value="1">Please Select</option> '
                  for(var i=0;i<industriesList.length-1;i++)
                  {
				     htmlText += '<option value='+industriesList[i]+'>' + industriesList[i+1] + '</option>\n';
				     i=i+1;
	              }
	                 htmlText += '</select></h5>'+
	                 '<h5>Category Name:<br><input type="text" id="addCatogory_tb" name="addCatogory"/></h5><br>'+
	                 '<a href="#" onclick="return hide_addcategory_pop_up();">'+
	                 '<img src="../styles/default/images/grn_no_btn-up.png" alt="No" /></a>'+
	                 '<a class="second_a" href="#" onclick="addAnotherCatorory1();">'+
					 '<img src="../styles/default/images/grn_yes_btn-up.png" alt="Yes"/></a></span><span style="display:none" id="progress1">'+
	                 '<img src="../styles/default/images/pleasewait.gif"/>'+
	                 '</span>'+
	              	 '<span style="display:none" id="success1"><h6>Category added successfully.<a href="#" onclick="return hide_addcategory_pop_up();">Close</a></h6></span>'+
	                 '<span style="display:none" id="failure1"><h4>Sorry, unable to add the Industry.<a href="#" onclick="return hide_addcategory_pop_up();">Close</a></h6></span>'+ 
	                 '</div></div></div>'
					 
					$("#addCatogories").append(htmlText)
					
		 },"json");
		 pop_up_category1(e,pop_up_id,location);
		 }
		 
		 else
		 {
		 hide_addcategory_pop_up();
		 var industryId=0
			 /* industriesnames array getting from getIndustry() from getSkillsDetailsAfterLogin.jsp*/
			 for(var k=0;k<industriesnames.length;k++){
				  if(indusry_txt_box==industriesnames[k]){
				  industryId=industriesids[k];
				  }
			  }
			 var htmlText ='<div id="category_popup_id" class="popup1-content"><div class="pu_row"><div class="pu_col right" style="width: 200px;">'+ 
	                       '<span id="categoryDetails"><span style="display:none;margin-top: 30px;color: red" id="commonId1"></span>'+
	                       '<h5>Category Name:<br><input type="text" id="addCatogory_tb" name="addCatogory"/></h5><br>'+
	                 	   '<a href="#" onclick="return hide_addcategory_pop_up();">'+
	                 	   '<img src="../styles/default/images/grn_no_btn-up.png" alt="No" /></a>'+
	                 	   '<a class="second_a" href="#" onclick="addAnotherCatorory2('+industryId+');">'+
					  	   '<img src="../styles/default/images/grn_yes_btn-up.png" alt="Yes"/></a></span>'+
					   	   '<span style="display:none" id="progress1"><img src="../styles/default/images/pleasewait.gif"/></span>'+
					       '<span style="display:none" id="success1"><h6>Category added successfully.<a href="#" onclick="return hide_addcategory_pop_up();">Close</a></h6></span>'+
					       '<span style="display:none" id="failure1"><h4>Sorry, unable to add the Industry.<a href="#" onclick="return hide_addcategory_pop_up();">Close</a></h6></span>'+
					       '</div></div></div>'
					$("#addCatogories").append(htmlText)
		 pop_up_category1(e,pop_up_id,location);
		 }
}


function addAnotherCatorory1()
	{
	 
	var industryId=$("#industryId_tb").val();
	var name=$("#addCatogory_tb").val();
	
		if(industryId=="1")
		{
		  //alert("Please select industry")
		  var htmlText="<h5>Please Select Industry</h5>";
		  $("#commonId").html(htmlText);
		  $("#commonId").show();
		  return false;
		}
		else
		{
		  $("#commonId").hide();
		  $("#progress1").show();
		}
		if(name=="")
		{
		  //alert("Please enter category")
		  $("#progress1").hide();
		   var htmlText="<h5>Please Select Category</h5>";
		  $("#commonId").html(htmlText);
		  $("#commonId").show();
		  return false;
		}
		else
		{
		 $("#commonId").hide();
		  $("#progress1").show();  
		}
		
		    
	        $.post("addCatogory.action",{'categoryname':name,'industryId':industryId},function (data)
	        		{
			            if(data.result =="success")
			            {
			               
			               $("#categoryDetails").hide();
			               $("#progress1").hide();
			               $("#success1").show();
			               $("#ajbx_category").hide();
			               $("#skillscategory").val("");
			               
			               // $("#addCatogories").hide();
			              
			            }
			            else
			            {
			            $("#categoryDetails").hide();
			            $("#progress1").hide();
			            $("#failure1").show();
			            $("#ajbx_category").hide();
			            $("#skillscategory").val("");
			            }                           
       
            },"json");
            
     //  hide_addcategory_pop_up();
	}
	
function addAnotherCatorory2(industryId)
{
	 
	 
	 
	var name=$("#addCatogory_tb").val();
	
		if(name=="")
		{
		 // alert("Please enter category")
		  var htmlText="<h5>Please Select Category</h5>";
		  $("#commonId1").html(htmlText);
		  $("#commonId1").show();
		   return false;
		}
		else
		{
		 $("#commonId1").hide();
		 $("#progress1").show();
		}
		    
	        $.post("addCatogory.action",{'categoryname':name,'industryId':industryId},function (data)
	        		{
			            if(data.result =="success")
			            {
			               $("#categoryDetails").hide();
			               $("#progress1").hide();
			               $("#success1").show();
			              //$("#addCatogories").hide();
			              
			              $("#skillscategory").val("");
			              $("#ajbx_category").hide();
			            }
			            else
			            {
			           $("#categoryDetails").hide();
			            $("#progress1").hide();
			            $("#failure1").show();
			            $("#ajbx_category").hide();
			            $("#skillscategory").val("");
			            }                           
       
            },"json");
            
      // hide_addcategory_pop_up();
	}
	
function hide_addcategory_pop_up()
{
    $("#progress1").hide();
	$("#success1").hide();	
	$("#categoryDetails").show();
	$("#addCatogories").hide();
	$("#category_popup_id").remove();
	return false;
}

function pop_up_category1(e,pop_up_id,location)
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
	
/* End of addAnotherCategoryAfterLogin.js */	

/* Start of addAnotherSkillsAfterLogin.js*/	
function pop_up_skill(e,pop_up_id,location)
	{
	 var category_txt_box=$("#skillscategory").val();
	
		if(category_txt_box==""){
		hide_pop_up_skills();
		categoriesList=[];
		$.post("getAllCategories.action",{},function(data)
		{
		
		for(var i=0;i<data.names.length;i++)
		{
		var myString=data.names[i];
		myArray = myString.split(",");
			for(var j=0;j<myArray.length;j++)
			{
			categoriesList.push(myArray[j]);
			}
		}
	    var htmlText ='<div id="skill_popup_id" class="popup1-content"><div class="pu_row"><div class="pu_col right" style="width: 200px;">'+ 
		 			   '<span id="skillsDetails">'+
		 			   '<span style="display:none;margin-top: 30px;color: red" id="commonId"></span>'+
		 			   '<h5>Category<br><select id="categoryId" name="categoryId"><option value="1">Please Select</option> '
                  for(var i=0;i<categoriesList.length-1;i++)
                   {
				     htmlText += '<option value='+categoriesList[i]+'>' + categoriesList[i+1] + '</option>\n';
				     i=i+1;
	               }
	                 htmlText += '</select></h5>'+
	                 '<h5>Skill Name:<br><input type="text" id="skillName" name="skillName"/></h5><br>'+
	                 '<a href="#" onclick="return hide_pop_up_skills();">'+
	                 '<img src="../styles/default/images/grn_no_btn-up.png" alt="No" /></a>'+
	                 '<a class="second_a" href="#" onclick="addAnotherSkill1();">'+
					 '<img src="../styles/default/images/grn_yes_btn-up.png" alt="Yes"/></a></span>'+
					 '<span style="display:none" id="skillProgress"><img src="../styles/default/images/pleasewait.gif"/></span>'+
					 '<span style="display:none" id="skillSuccess"><h6>skill added successfully.<a href="#" onclick="return hide_pop_up_skills();">Close</a></h6></span>'+
					 '<span style="display:none" id="skillFailure"><h4>Sorry, unable to add the Skill.<a href="#" onclick="return hide_pop_up_skills();">Close</a></h6></span>'+
					 '</div></div></div>'
					 
					$("#addSkills").append(htmlText)
	    },"json");
	    
	    pop_up_skill1(e,pop_up_id,location);
	    }
	    else{
		    hide_pop_up_skills();
		    var categoryId=0
			 /* categorieNames array getting from getCategory() from getSkillsDetailsAfterLogin.jsp*/
			 for(var k=0;k<categorieNames.length;k++){
				  if(category_txt_box==categorieNames[k]){
				  categoryId=categorieIds[k];
				  }
			  }
			
		    var htmlText ='<div id="skill_popup_id" class="popup1-content"><div class="pu_row"><div class="pu_col right" style="width: 200px;">'+ 
			 			 '<span id="skillsDetails">'+
			 			 '<span style="display:none;margin-top: 30px;color: red" id="commonId"></span>'+
			 			 '<h5>Skill Name:<br><input type="text" id="skillName" name="skillName"/></h5><br>'+
		                 '<a href="#" onclick="return hide_pop_up_skills();">'+
		                 '<img src="../styles/default/images/grn_no_btn-up.png" alt="No" /></a>'+
		                 '<a class="second_a" href="#" onclick="addAnotherSkill2('+categoryId+');">'+
						 '<img src="../styles/default/images/grn_yes_btn-up.png" alt="Yes"/></a></span>'+
						 '<span style="display:none" id="skillProgress"><img src="../styles/default/images/pleasewait.gif"/></span>'+
					 '<span style="display:none" id="skillSuccess"><h6>skill added successfully.<a href="#" onclick="return hide_pop_up_skills();">Close</a></h6></span>'+
					 '<span style="display:none" id="skillFailure"><h4>Sorry, unable to add the Skill.<a href="#" onclick="return hide_pop_up_skills();">Close</a></h6></span>'+					 
					 '</div></div></div>'
					 
				$("#addSkills").append(htmlText)
		    pop_up_skill1(e,pop_up_id,location);
	    
	    }
	   
	}
	
	
function addAnotherSkill1()
	{
	  
      var skillName=$("#skillName").val();
      var categoryId= $("#categoryId").val();
      
       if(categoryId=="1")
		{
		 // alert("Please select category")
		  var htmlText="<h5>Please Select Category</h5>";
		  $("#commonId").html(htmlText);
		  $("#commonId").show();
		  return false;
		}
		else
		{
		   $("#commonId").hide();
		   $("#skillProgress").show();
		}
		
      if(skillName=="")
		{
		 // alert("Please enter skill name")
		 $("#skillProgress").hide();
		  var htmlText="<h5>Please Enter Skill Name</h5>";
		  $("#commonId").html(htmlText);
		  $("#commonId").show();
		  return false;
		}
		else
		{
		  $("#commonId").hide();
		   $("#skillProgress").show();
		}
	    
	   
		
       $.post("addSkill.action",{skillName:skillName,categoryId:categoryId},function (data)
          {      
           if(data.result =="success")
           {
           
             $("#skillsDetails").hide();
			 $("#skillProgress").hide();
			 $("#skillSuccess").show();       
             $("#skills").val("");
             $("#ajbx_skills").hide();
             //$("#addSkills").hide();
           }
           else
           {
            $("#skillsDetails").hide();
			 $("#skillProgress").hide();
			 $("#skillFailure").show();    
             $("#skills").val("");
           }                           
     
          },"json");
            
       //  hide_pop_up_skills();
	
	}
	
function addAnotherSkill2(categoryId)
{
	 
      var skillName=$("#skillName").val();
     
     if(skillName=="")
		{
		  //alert("Please enter skill name")
		   var htmlText="<h5>Please Enter Skill Name</h5>";
		  $("#commonId").html(htmlText);
		  $("#commonId").show();
		  return false;
		}
		else
		{
		 $("#commonId").hide();
		 $("#skillProgress").show();
		}
	    
	   
		
       $.post("addSkill.action",{skillName:skillName,categoryId:categoryId},function (data)
          {      
           if(data.result =="success")
           {
           
             $("#skillsDetails").hide();
			 $("#skillProgress").hide();
			 $("#skillSuccess").show();    
             //$("#addSkills").hide();             
             $("#skills").val("");
             $("#ajbx_skills").hide();
           }
           else
           {
              $("#skillsDetails").hide();
			 $("#skillProgress").hide();
			 $("#skillFailure").show();    
             $("#skills").val("");
           }                           
     
          },"json");
            
        // hide_pop_up_skills();
	
	}
function hide_pop_up_skills()
	{
	     $("#skillProgress").hide();
	     $("#skillSuccess").hide();	
	     $("#skillsDetails").show();
		 $("#addSkills").hide();
		 $("#skill_popup_id").remove();
		return false;
	}	


	
function pop_up_skill1(e,pop_up_id,location)
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
/* End of addAnotherSkillsAfterLogin.js*/	

/* Start of getSkillsDetailsAfterLogin.js*/	
	
 var industriesList=[];
 var industriesids=[];
 var industriesnames=[];
 
 var categoriesList=[];
 var categorieIds=[];
 var categorieNames=[];
 
function getIndustry(){
  
 
	  $("#spbbl_industry").hide();
	  $.post("industry.action",{},function (data)  
	   { 
	  
	   for(var i=0;i<data.names.length;i++){
		var myString=data.names[i];
		myArray = myString.split(",");
			for(var j=0;j<myArray.length;j++){
			industriesList.push(myArray[j]);
			}
		}
	   
	    for(var i=0;i<industriesList.length-1;i++)
          {
          industriesids.push(industriesList[i]);
          industriesnames.push(industriesList[i+1]);
          i=i+1;
          }
	   //  new AutoSuggest(document.getElementById('industry'),industriesnames,'ajbx_industry');
	    
	    },"json");
}

function getCategory(){
	
	getIndustry();	
	var industryId=0
	var industryName =$("#industry").val();
	
	if(industryName==1)
	{
     var names=[];	 
	 new AutoSuggest(document.getElementById('skillscategory'),names,'ajbx_category');
	 }
	 
	else
	{ 
	
	for(var k=0;k<industriesnames.length;k++){
	  if(industryName==industriesnames[k]){
	  industryId=industriesids[k];
	  }
	}
  
	$.post("skillsCategory.action",{'industryId':industryId},function(data)
	{
	 
	 for(var i=0;i<data.names.length;i++){
		var myString=data.names[i];
		myCategories= myString.split(",");
			for(var j=0;j<myCategories.length;j++){
			categoriesList.push(myCategories[j]);
			}
		}
	   
	    for(var i=0;i<categoriesList.length-1;i++)
          {
          categorieIds.push(categoriesList[i]);
          categorieNames.push(categoriesList[i+1]);
          i=i+1;
          }
	 
	 new AutoSuggest(document.getElementById('skillscategory'),categorieNames,'ajbx_category');
	 
	 },"json");
	 
	 }
}

function getSkills(){
	
	var categoryId=0
	var categoryName=$("#skillscategory").val();
	if(categoryName=="")
	{
	  var names=[];	
	  new AutoSuggest(document.getElementById('skills'),names,'ajbx_skills');
	}
	else
	{
		for(var k=0;k<categorieNames.length;k++)
		{
		  if(categoryName==categorieNames[k]){
		  categoryId=categorieIds[k];
		  }
		}
	
		$.post("skills.action",{'categoryId':categoryId},function(data){
		
		 new AutoSuggest(document.getElementById('skills'),data.names,'ajbx_skills');
		 },"json");
	 }
 }
/* End of getSkillsDetailsAfterLogin.js
function setPercAnsweredTo(percentage)
{
	
	var pA = document.getElementById("percAnswered");														
	var total = pA.offsetWidth;							
	var newWidth = Math.floor((percentage/100)*total);							
	pA.getElementsByTagName("div")[0].style.width = newWidth+"px";							
	document.getElementById("percExpl").innerHTML = percentage+"% of questions answered.";
	
}

/* End of getSkillsDetailsAfterLogin.js*/ 	



var contactNames = "";
var acfb2;
$(document).ready(function() {
    $("#build_acfb").hide();
    $("#textId").show();
    acfb2 = acfbuild('.city3', 'employeeEditProfilekills.action');
	//$("#contactnameId").html(acfb2.getData());
    function acfbuild(cls, url) {
        var ix = $("input" + cls);
        ix.addClass('acfb-input').wrap('<ul class="' + cls.replace(/\./, '') + ' acfb-holder1"></ul>');
        return $("ul" + cls).autoCompletefb({urlLookup:url});
    }

});



function sendEmprMsgToContacts()
{
 contactNames = acfb2.getData();
 var profileListId=$("#profileListId").val();
 if(profileListId==""){
	    $("#fromAddressId").show();
	    $("#fromAddressId").html("Plase select from address")
    }else if (contactNames == "") {
         $("#messageId").show(); 
    } else {
    
         $("#messageId").hide();
         $("#fromAddressId").hide();
         $("#composeMessageForm").submit();
    }
}



