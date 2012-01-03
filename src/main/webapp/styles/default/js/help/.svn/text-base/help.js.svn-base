/*
 * Modified By Suresh Pal On October 12, 2009.
 * Now a variable will be used to store the id of current box.
 * In case user opens second box the first box should be hidden
 */
var currentKey = "";

function loadHelp(key){
	if(currentKey != null && currentKey != "") {
		$("#" + currentKey).hide();
	}	
	currentKey = key;
    $("#"+key).show();
     $("#close"+key).bind("click",closeHelp(key));
   
}

function closeHelp(key){
    var id = key;
    var close = function(){
        $("#"+key).hide();
    }
    return close;
}


