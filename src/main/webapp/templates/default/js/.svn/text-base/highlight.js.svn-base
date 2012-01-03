
function doHighlight(bodyText,searchTerm,highlightStartTag,highlightEndTag)
{if((!highlightStartTag)||(!highlightEndTag)){highlightStartTag="<font style='background-color:#FFFABF;'>";highlightEndTag="</font>";}
var newText="";var i=-1;var lcSearchTerm=searchTerm.toLowerCase();var lcBodyText=bodyText.toLowerCase();while(bodyText.length>0){i=lcBodyText.indexOf(lcSearchTerm,i+1);if(i<0){newText+=bodyText;bodyText="";}else{if(bodyText.lastIndexOf(">",i)>=bodyText.lastIndexOf("<",i)){if(lcBodyText.lastIndexOf("/script>",i)>=lcBodyText.lastIndexOf("<script",i)){newText+=bodyText.substring(0,i)+highlightStartTag+bodyText.substr(i,searchTerm.length)+highlightEndTag;bodyText=bodyText.substr(i+searchTerm.length);lcBodyText=bodyText.toLowerCase();i=-1;}}}}
return newText;}
function highlightSearchTerms(searchText,treatAsPhrase,warnOnFailure,highlightStartTag,highlightEndTag)
{if(treatAsPhrase){searchArray=[searchText];}else{searchArray=searchText.split(" ");}
if(!document.body||typeof(document.body.innerHTML)=="undefined"){if(warnOnFailure){alert("Sorry, for some reason the text of this page is unavailable. Searching will not work.");}
return false;}
var bodyText=document.body.innerHTML;for(var i=0;i<searchArray.length;i++){bodyText=doHighlight(bodyText,searchArray[i],highlightStartTag,highlightEndTag);}
document.body.innerHTML=bodyText;return true;}
function highlightGoogleSearchTerms(referrer)
{if(!referrer){return false;}
var queryPrefix="q=";var startPos=referrer.toLowerCase().indexOf(queryPrefix);if((startPos<0)||(startPos+queryPrefix.length==referrer.length)){return false;}
var endPos=referrer.indexOf("&",startPos);if(endPos<0){endPos=referrer.length;}
var queryString=referrer.substring(startPos+queryPrefix.length,endPos);queryString=queryString.replace(/%20/gi," ");queryString=queryString.replace(/\+/gi," ");queryString=queryString.replace(/%22/gi,"");queryString=queryString.replace(/\"/gi,"");return highlightSearchTerms(queryString,false);}