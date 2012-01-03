var searchType='Employee';
var startIndex = 0;
var endIndex = 5;
var context = 'mob';
var filtercount = 0;
// An object representing a bread crumb
function crumb(id,category){
	this.id=id;
	this.category = category;
	// Call back function to be called when a bread crumb
	// is closed
	function close(){
		filtercount--;
		if(filtercount==0){
			$('.countvals').each(function (i){
				$(this).attr('style','display:')
			});
		}

		$("#crumb"+id).remove();
	}
	return close;
}

// An object representing a category item
function catitem(id,category,displayText){
	this.id=id;
	this.category = category;
	this.displayText = displayText;
	// Call back function when a category item is 
	// selected for filtering
	function select(){
		addCrumb(id,category,displayText);
		currentpage=0;
		startIndex=0;
		endIndex=perpage;
		filter();
		filtercount++;
		if(filtercount==1){
			$('.countvals').each(function (i){
				$(this).attr('style','display:none')
			});
		}
		$('.countvals').each(function (i){
			$(this).attr()
		});
		$("#popup").attr('style','display:none');
	}
	return select;
}

// Add a new filter
function addCrumb(id,category,displayText){
	crumbhtml = "<li id='crumbitem" + id + "'><a href='#'><span>"+
			"<small>" + displayText + "</small>"+ 
			"<img id='crumb" + id + "' title='"+category+"'  class='crumbclose' src='/"+context+"/styles/default/images/browse/close.gif' alt='' />"+
			"</span></a></li>";
	$("#crumbcontainer").append(crumbhtml);
}

function addfilteritems(idprefix){
	$('.'+idprefix+'catitems').each(function(i){
		len = idprefix.length;
		id = $(this).attr('id');
		if(len>0){
			id=id.substr(len,id.length);
		}
		displayText = $(this).text();
		category = $(this).attr('title');

		catitemObject = catitem(id,category,displayText);
		$(this).bind('click',catitemObject);
	});
}

function seeall(){
	$('.btn').livequery('click',function(i){
		category = $(this).attr('id');
		category = category.substr(3,category.length);
		
		$.post(url+'/'+context+'/browse/allCatItem'
				+searchType+'.action',{"itemType":category},
				function(data){
					$("#popup").html(data);
					addfilteritems('all');

					$("#popup").attr('style','display:');

			});
	});
}

// The initialization function
$(document).ready(function() {
	searchType = $('#searchtype').html();
	addfilteritems('');
	seeall();
	$('body').bind('click',function(){
		$("#popup").attr('style','display:none');
	});
	$(".crumbclose").livequery('click',function(){
		closeid = $(this).attr('id');
		category = $(this).attr('title');
		id = closeid.substr(5,closeid.length);
		$(this).closest("li").remove();		
		filtercount--;
		if(filtercount==0){
			$('.countvals').each(function (i){
				$(this).attr('style','display:')
			});
		}
		
		filter();
	});
	$(".pageno").livequery('click',function(){
		pageid = $(this).attr('id');
		pagenum = parseInt(pageid.substr(4,pageid.length));
		startIndex = ((pagenum-1)*perpage);
		endIndex = perpage;
		currentpage = pagenum;
		filter();
		if(currentpage+1>=totalPages()){
			$('#nextpage').hide();
		}else{
			$('#nextpage').show();
		}
		if(currentpage-1<=0){
			$('#prevpage').hide();
		}else{
			$('#prevpage').show();
		}

	});
	$('#firstpage').bind('click',first);
	$('#prevpage').bind('click',previous);
	$('#nextpage').bind('click',next);
	$('#lastpage').bind('click',last);
	$('#perpage').bind('change',perpagechange)
	$('#keyclosecrumb').bind('click',function(){
		$(this).closest('li').remove();	
		$('#keyclose').remove();
		filter();
	});
	paginate();
});

// Called when the user changes the per page drop down value
function perpagechange(){
	perpage = $('#perpage').val();
	startIndex = ((currentpage-1)*perpage)+1;
	endIndex = perpage;
	filter();
}

var proto =  location.protocol;
var host = location.host;
var url = proto + '//' + host;

function addcount(category,value){
	$.post(url+'/'+context+'/browse/countSearch'+searchType+'.action',
			{"itemType":category,"searchTerm":value},
			function(data){
				
	});
	
}

// The function that makes the ajax call to filter data
// based on the current settings and the start and end index
function filter(){
	 index = 0;
	cats = [];
	vals = [];
	$('.crumbclose').each(function(e){
		closeid = $(this).attr('id');
		category = $(this).attr('title');
		cats[index] = category;
		vals[index] = closeid.substr(5,closeid.length);
		index++;
	});
	
	catString = '[';
	for(j=0;j<cats.length;j++){
		catString+=cats[j];
		if(j<(cats.length-1)){
			catString+=',';
		}
	}
	catString+=']';	
	valString = '[';
	for(j=0;j<vals.length;j++){
		valString+=vals[j];
		if(j<(vals.length-1)){
			valString+=',';
		}
	}
	valString+=']';	
	key = $('#keyclose').attr("class");
	if(startIndex<0){
		startIndex=0;
	}
	postData = {"type":searchType,"category":catString,
			"value":valString,"startIndex":startIndex,
			"endIndex":endIndex};
	if(key!=undefined){
		postData = {"type":searchType,"category":catString,
			"value":valString,"startIndex":startIndex,
			"endIndex":endIndex,"keyword":key};
	}
	$.post(url+'/'+context+'/browse/filterAdd.action',postData,
			function(data){
				$("#page").html(data);
				paginate();
	});
}

//<li><a id="page<no>" class='pageno' href="#">1</a></li>
var currentpage = 0;
var perpage = 5;
function paginate(){
	total = parseInt($('#pagecount').html());
	perpage = parseInt($('#perpage').val());
	
	pages = parseInt(total/perpage);
	if((total%perpage)>0){
		pages++;
	}

	$('.pageno').remove();
	$('.elipses').remove();
	if(pages>5){
		// If there are more than 5 pages, then
		// display it in the format 1 2 3 ... 7 8
		start=currentpage>0?currentpage:1;
		end = pages;
		if(pages-currentpage<5){
			start=1;
			end=currentpage;
		}
		for(index=start;index<=start+2;index++){
			if(index==start+2){
				if(index==currentpage){
					pagetext='<li id="page'+index+'" class="pageno"><a style="font-weight:bold" href="#">'+index+'</a></li><li class="elipses"><a>...</a></li>';
				}else{
					pagetext='<li id="page'+index+'" class="pageno"><a href="#">'+index+'</a></li><li class="elipses"><a>...</a></li>';
				}
			}else{
				pagetext='<li id="page'+index+'"  class="pageno"><a href="#">'+index+'</a></li>';
			}
			$(pagetext).insertBefore($('#pagenums'));
		}
		for(index=end-1;index<=end;index++){
			if(index==currentpage){
				pagetext='<li id="page'+index+'" class="pageno"><a style="font-weight:bold" href="#">'+index+'</a></li>';
			}else{
				pagetext='<li id="page'+index+'" class="pageno"><a href="#">'+index+'</a></li>';
			}
			$(pagetext).insertBefore($('#pagenums'));
		}
	}else{
		for(index=1;index<=pages;index++){
			if(index==currentpage){
				pagetext='<li id="page'+index+'" class="pageno"><a style="font-weight:bold" href="#">'+index+'</a></li>';
			}else{
				pagetext='<li id="page'+index+'" class="pageno"><a href="#">'+index+'</a></li>';
			}
			$(pagetext).insertBefore($('#pagenums'));
		}
	}
}

// Calculate the total number of pages
function totalPages(){
	total = parseInt($('#pagecount').html());
	perpage = parseInt($('#perpage').val());
	
	pages = parseInt(total/perpage);
	if(total%perpage>0){
		pages;
	}else{
		pages-1;
	}
	return pages;
}

// Go to the first page
function first(){
	startIndex = 0;
	endIndex = perpage;
	currentpage=0;
	$('#prevpage').hide();
	filter();
}

// Go to the last page
function last(){
	pages = totalPages();
	startIndex = ((pages-1)*perpage);
	endIndex = perpage;
	currentpage=pages-1;
	$('#nextpage').hide();
	filter();
}

// Go to previous page
function previous(){
	if(currentpage-1<=0){
		first();
	}else{
		startIndex = ((--currentpage)*perpage);
		endIndex = perpage;
		$('#prevpage').show();
		filter();
	}
}

// Go to next page
function next(){
	pages = totalPages();
	if((currentpage+1)>=pages){
		last();
	}else{
		startIndex = ((++currentpage)*perpage);
		$('#nextpage').show();
		endIndex = perpage;
		filter();
	}
}