/*
 * Modified By Suresh Pal On October 12, 2009.
 * Now a variable will be used to store the id of current box.
 * In case user opens second box the first box should be hidden
 */
var currentKey = "";

function loadFlag(key,value){
	$("#" + currentKey).hide();
	currentKey = key;
    $.get(value, function(data){
        $("#content"+key).html(data);
        $("#"+key).show();
        $("#close"+key).bind("click",closeFlag(key));
    });
}

function closeFlag(key){
    var id = key;
    var close = function(){
        $("#"+key).hide();
    }
    return close;
}


