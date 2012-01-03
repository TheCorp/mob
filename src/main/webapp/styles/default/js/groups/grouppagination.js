var pagelimit=10;
var currentPage=0;
var totalGroupInformation;

function showHideGroupData(){
	$("#groupdiscussionId").val("");
	var listOfGroupData = $(".post");
	totalGroupInformation = listOfGroupData.length;
	showPrevNext();
	showPage(0);
}

function showPrevNext(){
	var noOfPages = parseInt(totalGroupInformation/pagelimit);
	if(totalGroupInformation>(noOfPages*pagelimit)){
		noOfPages++;
	}
	var prevAdded = false;
	var nextAdded = false;
	if(currentPage>0){
		$("#prev").show();
		prevAdded = true;
		$("#prev").click(previous);
	}else{
		$("#prev").hide();
	}
	if((noOfPages-1)<=currentPage){
		$("#next").hide();
	}else{
		nextAdded = true;
		$("#next").show();
		$("#next").click(next);
	}
	if(prevAdded && nextAdded){
		$("#sep").show()	
	}else{
		$("#sep").hide()
	}
}


function showPage(page){
	$(".number"+page).each(
		function (index){
			$(this).show();
		}
	);
	var start = (currentPage  * pagelimit) + 1;
	var end = (currentPage * pagelimit) + pagelimit;
	if(end > totalGroupInformation){
		end = totalGroupInformation;
	}
	if(totalGroupInformation == 0 ){
		$("#count").html("0 of 0");	
		$("#countId").html("0 of 0");
				
	}else{
		$("#count").html(start + " - " + end + " of " + totalGroupInformation);
		$("#countId").html(start + " - " + end + " of " + totalGroupInformation);
	}
}

function hidePage(page){
	$(".number"+page).each(
		function (index){
			$(this).hide();
		}
	);
}

function previous(){
	hidePage(currentPage);
	currentPage = currentPage-1;
	showPage(currentPage);
	showPrevNext();
}

function next(){
	hidePage(currentPage);
	currentPage = currentPage+1;
	showPage(currentPage);
	showPrevNext();
}

