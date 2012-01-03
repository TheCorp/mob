/* start of addTrainingDetails.js*/
var count = 0;
var Delete = 0;


function addTrainingDetails1() {

    $("#traingId").hide();
    var trainingName = $("#training_textbox").val();
     
    if (trainingName.length>45)
    {
        $("#traingId").show();
        return;

    } 
    if (trainingName == "")
    {
        return;

    }
    else
    {


        count = count + 1;
	     //Html text genertation for displaying of the data dynamically on click of add.	
        var htmlText = "<div class='add_training_row' id='divTable" + count + "'><table border='0'><tr><td><table  border='0'> <tr>" +
                       "<td class='atc_name'id='trainingNameCount" + count + "'>" + trainingName + "</td>" +
                       "</tr></table></td><td><div class='atc_actions'>" +
                       "<table  border='0'><tr>" +
                       "<td id='image_cross1' onclick=deleteTrainingDetails('" + count + "') ></td></tr>" +
                       "</table></div></td></tr></table>" +
        //These details are used for storing the data into database.
                       "<input type='hidden' id='trainingNameCount1" + count + "' name='trainingName' value='" + trainingName + "'/></div>";
		 //Appending the new row along with the old data		 

        $("#add_training_row_id").append(htmlText)

    }


    $("#training_textbox").val("");

}


function deleteTrainingDetails(delID) {

    $("#divTable" + delID).remove();
}

function setPercAnsweredTo(percentage)
{

    var pA = document.getElementById("percAnswered");
    var total = pA.offsetWidth;
    var newWidth = Math.floor((percentage / 100) * total);
    pA.getElementsByTagName("div")[0].style.width = newWidth + "px";
    document.getElementById("percExpl").innerHTML = percentage + "% of questions answered.";

}





