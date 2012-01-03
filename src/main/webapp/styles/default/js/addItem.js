$(document).ready(function() {
 addItemSetup();
});



function addItemSetup()
 {
 setup_custom_select("pgroup_edit",["Friend","Colleague","Partner","Associate","Superior","Contact"]);
 setup_custom_select("category_edit",["TV Show","Audio Recording","Document","Other"]);
 setup_custom_tinput("title_edit");
 $("#additem").click(addItem);
 }


 function addItem(){

  /* example3 */
  var tname=$("#nameid").val()
  alert(tname)
   $.ajaxFileUpload
		(
			{
				url:'addItem.action', 
				secureuri:false,
				fileElementId:'fileloc',
				dataType: 'json',				
				data: {'name':'tname'},
				onSuccess : function(file){
           $('<li></li>').appendTo($('#testid .test')).text(file);
          }
   });
  
}

