function sendEmprReadMsgInboxReply(){
 var emprinBoxReplyId=$("#emprinBoxReplyId").val();
 document.getElementById("msgReadInboxEmprid").href= "composeEmprInboxReplyMsg.action?inboxReadId="+emprinBoxReplyId;
}

var contactNames="";
var acfb2;
var acfb3;
var acfb;
		$(document).ready(function() {
		     $("#build_acfb").hide();
			  $("#textId").show();
			  acfb = $("ul.first").autoCompletefb({urlLookup:'emprMsgContactListAction.action'});
			  acfb2 = acfbuild('.city3','emprMsgContactListAction.action');
			   $('.btn2').show();
				
			function acfbuild(cls,url){
				var ix = $("input"+cls);
				 ix.addClass('acfb-input').wrap('<ul class="'+cls.replace(/\./,'')+' acfb-holder"></ul>');
				return $("ul"+cls).autoCompletefb({urlLookup:url});
			}
		});
			
			function sendEmprReplyMsgToContacts()
			{
				var inBoxId=$("#inBoxId").val();
				var inboxProfileId=$("#inboxProfileId").val();
				var associtedProfileid=$("#associatedProfileId").val();
				contactNames=acfb.getData();
				 
				 if(contactNames==""){
				 $("#messageId").show();
				 }else{
				  $("#messageId").hide();
				  $("#profileId").val(inboxProfileId);
				  $("#inBoxId1").val(inBoxId);
				  $("#associtedProfileid").val(associtedProfileid);
                 $("#composeMessageForm").submit();
	        	 }
			}