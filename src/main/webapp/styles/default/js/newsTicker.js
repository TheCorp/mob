$(document).ready(function() {
	loadNews();
});

var proto =  location.protocol;
var host = location.host;
var url = proto + '//' + host;
var days = new Array();
var dayBefore = new Array();
var weeks = new Array();
var months = new Array();
var years = new Array();

function loadNews(){
    $.post("../news/loadNews.action",
            null,
            function(data) {
                var result = data.result;
                if (result == "success") {
	                days = data.days;
                    dayBefore = data.dayBefore;
                    weeks = data.weeks;
                    months = data.months;
                    years = data.years;
                    setValue(0);
                    // the options for this ajax request
                } else {

                }
            }, "json");
}

function setValue(type){
    var vals = new Array();
    switch(type){
        case(0):{vals=days;$("#type0").attr("class","bc_2cbt_today");$("#type1").attr("class","");$("#type2").attr("class","");$("#type3").attr("class","");$("#type4").attr("class","");
		$("#news0").attr("class","bc_2cbt_grnarrbg");$("#news1").attr("class","");$("#news2").attr("class","");$("#news3").attr("class","");$("#news4").attr("class","");

					break;}
        case(1):{vals=dayBefore;$("#type0").attr("class","");$("#type1").attr("class","bc_2cbt_today");$("#type2").attr("class","");$("#type3").attr("class","");$("#type4").attr("class","");
					$("#news0").attr("class","");$("#news1").attr("class","bc_2cbt_grnarrbg");$("#news2").attr("class","");$("#news3").attr("class","");$("#news4").attr("class","");
		break;}
        case(2):{vals=weeks;$("#type0").attr("class","");$("#type1").attr("class","");$("#type2").attr("class","bc_2cbt_today");$("#type3").attr("class","");$("#type4").attr("class","");
				$("#news0").attr("class","");$("#news1").attr("class","");$("#news2").attr("class","bc_2cbt_grnarrbg");$("#news3").attr("class","");$("#news4").attr("class","");
			break;}
        case(3):{vals=months;$("#type0").attr("class","");$("#type1").attr("class","");$("#type2").attr("class","");$("#type3").attr("class","bc_2cbt_today");$("#type4").attr("class","");
					$("#news0").attr("class","");$("#news1").attr("class","");$("#news2").attr("class","");$("#news3").attr("class","bc_2cbt_grnarrbg");$("#news4").attr("class","");
			break;}
        case(4):{vals=years;$("#type0").attr("class","");$("#type1").attr("class","");$("#type2").attr("class","");$("#type3").attr("class","");$("#type4").attr("class","bc_2cbt_today");
					$("#news0").attr("class","");$("#news1").attr("class","");$("#news2").attr("class","");$("#news3").attr("class","");$("#news4").attr("class","bc_2cbt_grnarrbg");
			break;}
    }
    for(i=0 ; i < 5 ; i++){
        $("#news" + i).html("");
    }
    if(vals==null){

        return;
    }
    var len = 5;
    if(vals.length <5){
        len = vals.length;
    }
    for(i=0 ; i < len ; i++){
        $("#news" + i).html(vals[i]);
    }
}
