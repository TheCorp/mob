function sendReadMsgReply(){
 var inboxSendId=$("#inboxSendId").val();
 document.getElementById("composeReadMsgs").href= "composeReplyMsg.action?inboxReadId="+inboxSendId;
}


var contactNames="";
var acfb2;
var acfb3;
var acfb;
var  allContactIds=[];
			$(document).ready(function() {
			     $("#build_acfb").hide();
					$("#textId").show();
					 acfb = $("ul.first").autoCompletefb({urlLookup:'contactListAction.action'});
					acfb2 = acfbuild('.city3','contactListAction.action');
					$('.btn2').show();
					
				function acfbuild(cls,url){
					var ix = $("input"+cls);
					 ix.addClass('acfb-input').wrap('<ul class="'+cls.replace(/\./,'')+' acfb-holder"></ul>');
					return $("ul"+cls).autoCompletefb({urlLookup:url});
				}
				
			});
			
			function replyMsgToContacts()
			{
				var inBoxId=$("#inBoxId").val();
				contactNames=acfb.getData();
				if(contactNames==""){
				$("#messageId").show();
				}else{
				 $("#messageId").hide();
				var inboxProfileId=$("#inboxProfileId").val();
				var associatedProfileId=$("#associatedProfileId").val();
                $("#inBoxId1").val(inBoxId);
                $("#profileId").val(inboxProfileId);
                $("#associatedProfileid").val(associatedProfileId);
                $("#composeMessageForm").submit();
	            }
		   }