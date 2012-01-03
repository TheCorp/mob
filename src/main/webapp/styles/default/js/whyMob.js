$(document).ready(function() {	
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

