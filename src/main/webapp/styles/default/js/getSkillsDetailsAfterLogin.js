/* Start of getSkillsDetailsAfterLogin.js*/	
	
 var industriesList=[];
 var industriesids=[];
 var industriesnames=[];
 
 var categoriesList=[];
 var categorieIds=[];
 var categorieNames=[];
 
function getIndustry(){
  
  industriesList=[];
  industriesids=[];
  industriesnames=[];
  
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
	     new AutoSuggest(document.getElementById('industry'),industriesnames,'ajbx_industry');
	    
	    },"json");
}

function getCategory(){
	
	$("#spbbl_category").hide();
	var industryId=0
	var industryName =$("#industry").val();
	
	if(industryName=="")
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
   categoriesList=[];
   categorieIds=[];
   categorieNames=[];
	
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
/* End of getSkillsDetailsAfterLogin.js*/ 