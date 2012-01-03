var contactNames = "";
var acfb2;
$(document).ready(
		function() {
			$("#build_acfb").hide();
			$("#textId").show();
			acfb2 = acfbuild('.city3', 
					'emprMsgContactListAction.action');
			function acfbuild(cls, url) {
				var ix = $("input" + cls);
				ix.addClass('acfb-input').wrap(
						'<ul class="' + cls.replace(/\./, '')
								+ ' acfb-holder"></ul>');
				return $("ul" + cls).autoCompletefb({
					urlLookup : url
				});
			}

		});

function sendEmprMsgToContacts() {
	contactNames = acfb2.getData();
	var profileListId = $("#profileListId").val();
	if (profileListId == "") {
		$("#fromAddressId").show();
		$("#fromAddressId").html("Plase select from address")
	} else if (contactNames == "") {
		$("#messageId").show();
	} else {

		$("#messageId").hide();
		$("#fromAddressId").hide();
		$("#composeMessageForm").submit();
	}
}
