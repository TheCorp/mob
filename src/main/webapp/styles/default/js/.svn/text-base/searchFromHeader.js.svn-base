function searchFromEmployeeHeader()
{
  
   var search = $("#searchText").val();
   var searchValue=$("#searchvalueid").val();
   
  if(search == ""){
     alert("Please enter name corresponding to the item selected from drop down")
     return false;
  }
  if(search == "type something..."){
     alert("Please enter name corresponding to the item selected from drop down")
     return false;
  }
  
 
  if(searchValue=="Employees")
  {
     
	     $("#searchformId").attr("action","../browse/employees.action"); 
     $("#searchformId").submit();
  
  }
  if(searchValue=="Employers")
  {
     $("#searchformId").attr("action","../browse/employers.action"); 
     $("#searchformId").submit();
 // document.getElementById("searchlink").href="../search/searchEmployers.action?search="+search;
  }
  if(searchValue=="Opportunities")
  {
    $("#searchformId").attr("action","../browse/opps.action"); 
     $("#searchformId").submit();
 // document.getElementById("searchlink").href="../search/searchOpportunities.action?search="+search;
  }
  
   if(searchValue=="Groups")
  {
     $("#searchformId").attr("action","../browse/groups.action"); 
     $("#searchformId").submit();
 // document.getElementById("searchlink").href="../search/searchEmployers.action?search="+search;
  }

}

function searchFromEmployerHeader()
{

  var search = $("#searchText").val();
  var searchValue=$("#searchvalueid").val();
  
  if(search == ""){
  alert("Please enter name corresponding to the item selected from drop down")
  return false;
  }
  if(search == "type something..."){
  alert("Please enter name corresponding to the item selected from drop down")
  return false;
  }
   
  if(searchValue=="Employees")
  {
    $("#searchformId").attr("action","../search/searchEmployeesFromEmployee.action"); 
    $("#searchformId").submit();
   //document.getElementById("searchlink").href="../search/searchEmployeesFromEmployee.action?search="+search;
  }
  if(searchValue=="Employers")
  {
     $("#searchformId").attr("action","../search/searchEmployers.action"); 
     $("#searchformId").submit();
    //document.getElementById("searchlink").href="../search/searchEmployers.action?search="+search;
  }
  if(searchValue=="Opportunities")
  {
     $("#searchformId").attr("action","../search/searchOpportunities.action"); 
     $("#searchformId").submit();
  //document.getElementById("searchlink").href="../search/searchOpportunities.action?search="+search;
  }
  
   if(searchValue=="Groups")
  {
     $("#searchformId").attr("action","../search/searchGroups.action"); 
     $("#searchformId").submit();
    //document.getElementById("searchlink").href="../search/searchEmployers.action?search="+search;
  }
}
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


function clickButtonSearch()
{   
     
    if (event.keyCode == 13)
    {
       
       searchFromEmployeeHeader();
       
    }
  
}
function clickButton()
{
    if (event.keyCode == 13)
    {
        $("#loginImageId").click();
    }
}


$(document).ready(function() 
{

//$("a[rel^='prettyPhoto']").prettyPhoto();


        $("#login").show();
        var datetime = new Date()
        var d = datetime.getDate()
        var day = datetime.getDay()
        var month = datetime.getMonth()
        var year = datetime.getYear()
        if (year < 1000)
            year += 1900
        var days = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
        var months = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")

        var displayDate = days[day] + ", " + months[month] + " " + d + ", " + year;
        $("#thf_date").html(displayDate);

	
	//Show Banner
	$(".main_image .block").slideToggle(1);
	$(".main_image .block").slideToggle(1);
	$(".main_image .block").animate({ opacity: 0.85 }, 1 ); //Set Opacity
	$(".main_image .desc").show(); //Show Banner
	
	//Click and Hover events for thumbnail list
	$(".image_thumb ul li:first").addClass('active'); 
	$(".image_thumb ul li").click(function(){ 
		//Set Variables
		var imgAlt = $(this).find('img').attr("alt"); //Get Alt Tag of Image
		var imgTitle = $(this).find('a').attr("href"); //Get Main Image URL
		var imgDesc = $(this).find('.block').html(); 	//Get HTML of block
		var imgDescHeight = $(".main_image").find('.block').height();	//Calculate height of block

		if ($(this).is(".active")) {  //If it's already active, then...
			return false; // Don't click through
		} else {
			//Flip images
			var tabImage;

			$(".image_thumb ul li").each(function () { 
				$(this).removeClass('active'); //Remove class of 'active' on all lists
				tabImage = $(this).find('img').attr("src");
				tabImage = tabImage.replace("focus","idle");
				$(this).find('img').attr("src",tabImage);
			});

			tabImage = $(this).find('img').attr("src");
			tabImage = tabImage.replace("idle","focus");
			$(this).find('img').attr("src",tabImage);
			$(this).addClass('active');  //add class of 'active' on this list only

			//Animate the Teaser
			$(".main_image .block").animate({ opacity: 0, marginBottom: -imgDescHeight }, 250 , function() {
				$(".main_image .block").html(imgDesc).animate({ opacity: 0.85,	marginBottom: "0" }, 250 );
				$(".main_image img").attr({ src: imgTitle , alt: imgAlt});
			});
		}
		
		return false;
		
	}) .hover(function(){
		$(this).addClass('hover');
		}, function() {
		$(this).removeClass('hover');
	});
			
	//Toggle Teaser
	$("a.collapse").click(function(){
		$(".main_image .block").slideToggle();
		$("a.collapse").toggleClass("show");
	});


	//Toggle Teaser
	$("a.close").click(function(){
		$(".main_image .block").slideToggle(250, function () {
			$("a.collapse").toggleClass("show");
		});
	});
	
	
	
});//Close Function







