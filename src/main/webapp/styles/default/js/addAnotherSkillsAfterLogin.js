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