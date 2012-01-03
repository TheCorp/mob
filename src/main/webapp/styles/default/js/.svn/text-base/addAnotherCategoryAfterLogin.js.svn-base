/* Start of addAnotherCategoryAfterLogin.js */
function pop_up_category(e,pop_up_id,location){

	var indusry_txt_box=$("#industry").val();
	
	if(indusry_txt_box=="")
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