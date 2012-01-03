/* Start of editTraining.js */
count=0


function addTrainingDetails(){
		 
		  $("#traingId").hide();       
         var trainingName =$("#training_textbox").val()
         if(trainingName.length>45)
         {
             $("#traingId").show();
              return;
         }  
         
         if(trainingName==""){
	     return;
     	 }
         count = count+101;
	     //Html text genertation for displaying of the data dynamically on click of add.	
		  count = count+1;
	     //Html text genertation for displaying of the data dynamically on click of add.	
		 var htmlText= "<div class='add_training_row' id='trainingdivdiv"+count+"'><table border='0'><tr><td><table  border='0'> <tr>"+
		 "<td class='atc_name'id='trainingNameCount"+count+"'>" + trainingName+ "</td>" +		 
		  "</tr></table></td><td><div class='atc_actions'>"+
		 "<table  border='0'><tr>"+
		 "<td id='image_cross1' onclick=deleteNewTraining('"+count+"') ></td></tr>"+
		 "</table></div></td></tr></table>" +
		 //These details are used for storing the data into database.
		  "<input type='hidden' id='trainingNameCount1"+count+"' name='newTrainingName' value='" + trainingName + "'/></div>";
		 //Appending the new row along with the old data		 
		 $("#additional_training").append(htmlText)
		 
		  $("#training_textbox").val("")

}
function deleteTraining(id)
{
		
			var htmlText="<div class='deltrainingdiv' id='del"+id+"'><input type='hidden' name='deltrainingrow' id='delrowid"+id+"' value='"+id+"' /></div>";
			$("#deltrainingdiv").append(htmlText) 
		
		    $("#trainingdivdiv"+id).remove();
		  
			$("#training_textbox").val("")
		     
}

 function deleteNewTraining(id){

     $("#trainingdivdiv"+id).remove();
		  
 	 $("#training_textbox").val("");
     
}

function  setTrainingVal(){
	$("#training_textbox").val("");
 		if( checkPhoneNumber()==true){
 		return true;
 		}
 		else{
 		return false;
 		}
 		
 	

}

function checkPhoneNumber() {
 
	var phoneNo=$("#phoneNumberId").val();
    var phoneRE = /^\(\d\d\d\) \d\d\d-\d\d\d\d$/;
	   if (phoneNo.match(phoneRE) || !isNaN(phoneNo)) {
	   return true;
	   } else {
	   alert("The phone number entered is invalid!");
	   return false;
	  }
}
/* End of editTraining.js */