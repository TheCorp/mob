
function validateContactName(){
	 flag="true"   
	 var maxLength=10;
	 var nickName=$("#nickName").val();
	 var contactType = $("#selContactId").val();
	  if(nickName==""){
		 alert('Please enter contact name');
		 return  false;
	 	}else if(nickName.length > maxLength){
		  alert("Contact Name should be within " + maxLength + " characters.")
		  return  false;
		}
		else if(contactType=="1"){
		  alert("Please select contact type:")
		  return  false;
		}else{
		alert("Contact added successfully");
		 return true;
		}
}


function chkContactNameExist(){
	var nickName=$("#nickName").val();
	var contactType =$("#selContactId").val();
	 $.post("contactNameValidate.action",{nickName : $("#nickName").val()},function (data)
	   {      
	        if(data.result=="success")
	         {
	          flag="true"      
	          return flag;
	         }else
	              {
	              flag="false"  
	              $("#nickName").focus();     
	               alert("Contact name already Exist please try again");  
	               return flag;
	               
	              }
	    },"json");
    
    
}
	
	