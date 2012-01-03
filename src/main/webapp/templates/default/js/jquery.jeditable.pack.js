
jQuery.fn.editable=function(target,options,callback){if(this.length===0){return(this);}var settings={target:target,name:'value',id:'id',type:'text',width:'auto',height:'auto',event:'click',onblur:'cancel',loadtype:'GET',loadtext:'Loading...',loaddata:{},submitdata:{}};if(options){jQuery.extend(settings,options);}var plugin=jQuery.editable.types[settings.type].plugin||function(){};var submit=jQuery.editable.types[settings.type].submit||function(){};var buttons=jQuery.editable.types[settings.type].buttons||jQuery.editable.types['defaults'].buttons;var content=jQuery.editable.types[settings.type].content||jQuery.editable.types['defaults'].content;var element=jQuery.editable.types[settings.type].element||jQuery.editable.types['defaults'].element;callback=callback||function(){};var isSubmitAllowed=settings.beforesubmit||function(){return true;};jQuery(this).attr('title',settings.tooltip);jQuery(this)[settings.event](function(e){var self=this;if(self.editing){return;}settings.width=('auto'==settings.width)?jQuery(self).width():settings.width;settings.height=('auto'==settings.height)?jQuery(self).height():settings.height;self.editing=true;self.revert=jQuery(self).html();self.innerHTML='';var f=document.createElement('form');if(settings.cssclass){if('inherit'==settings.cssclass){jQuery(f).attr('class',jQuery(self).attr('class'));}else{jQuery(f).attr('class',settings.cssclass);}}if(settings.style){if('inherit'==settings.style){jQuery(f).attr('style',jQuery(self).attr('style'));jQuery(f).css('display',jQuery(self).css('display'));}else{jQuery(f).attr('style',settings.style);}}var i=element.apply(f,[settings,self]);if(settings.getload){settings.loadurl=settings.getload;settings.loadtype='GET';}else if(settings.postload){settings.loadurl=settings.postload;settings.loadtype='POST';}if(settings.loadurl){var t=setTimeout(function(){i.disabled=true;content.apply(f,[settings.loadtext,settings,self]);},100);var loaddata={};loaddata[settings.id]=self.id;if(jQuery.isFunction(settings.loaddata)){jQuery.extend(loaddata,settings.loaddata.apply(self,[self.revert,settings]));}else{jQuery.extend(loaddata,settings.loaddata);}jQuery.ajax({type:settings.loadtype,url:settings.loadurl,data:loaddata,success:function(string){window.clearTimeout(t);content.apply(f,[string,settings,self]);i.disabled=false;}});}else if(settings.data){content.apply(f,[settings.data,settings,self]);}else{content.apply(f,[self.revert,settings,self]);}i.name=settings.name;buttons.apply(f,[settings,self]);self.appendChild(f);if(settings.select){i.select();}plugin.apply(f,[settings,self]);jQuery(":input:visible:enabled:first",f).focus();jQuery(i).keydown(function(e){if(e.keyCode==27){e.preventDefault();reset();}});var t;if('cancel'==settings.onblur){jQuery(i).blur(function(e){t=setTimeout(reset,500);});}else if('submit'==settings.onblur){jQuery(i).blur(function(e){jQuery(f).submit();});}else{jQuery(i).blur(function(e){});}jQuery(f).submit(function(e){if(t){clearTimeout(t);}e.preventDefault();submit.apply(f,[settings,self]);var submitdata={};if(jQuery.isFunction(settings.target)){var str=settings.target.apply(self,[jQuery(i).val(),settings]);self.innerHTML=str;self.editing=false;callback.apply(self,[self.innerHTML,settings]);}else if(isSubmitAllowed(submitdata)){submitdata[i.name]=jQuery(i).val();submitdata[settings.id]=self.id;if(jQuery.isFunction(settings.submitdata)){jQuery.extend(submitdata,settings.submitdata.apply(self,[self.revert,settings]));}else{jQuery.extend(submitdata,settings.submitdata);}jQuery(self).html(settings.indicator);jQuery.post(settings.target,submitdata,function(str){self.innerHTML=str;self.editing=false;callback.apply(self,[self.innerHTML,settings]);});}else{reset();}return false;});function reset(){self.innerHTML=self.revert;self.editing=false;}});return(this);};jQuery.editable={types:{defaults:{element:function(settings,original){var input=jQuery('<input type="hidden">');jQuery(this).append(input);return(input);},content:function(string,settings,original){jQuery(':input:first',this).val(string);},buttons:function(settings,original){if(settings.submit){var submit=jQuery('<input type="submit">');submit.val(settings.submit);jQuery(this).append(submit);}if(settings.cancel){var cancel=jQuery('<input type="button">');cancel.val(settings.cancel);jQuery(this).append(cancel);jQuery(cancel).click(function(){jQuery(original).html(original.revert);original.editing=false;});}}},text:{element:function(settings,original){var input=jQuery('<input>');input.width(settings.width);input.height(settings.height);input.attr('autocomplete','off');jQuery(this).append(input);return(input);}},textarea:{element:function(settings,original){var textarea=jQuery('<textarea>');if(settings.rows){textarea.attr('rows',settings.rows);}else{textarea.height(settings.height);}if(settings.cols){textarea.attr('cols',settings.cols);}else{textarea.width(settings.width);}jQuery(this).append(textarea);return(textarea);}},select:{element:function(settings,original){var select=jQuery('<select>');jQuery(this).append(select);return(select);},content:function(string,settings,original){if(String==string.constructor){eval("var json = "+string);for(var key in json){if('selected'==key){continue;}var option=$('<option>').val(key).append(json[key]);if(key==json['selected']){console.log(key);option[0].selected=true;}jQuery("select",this).append(option);}}}}},addInputType:function(name,input){jQuery.editable.types[name]=input;}};