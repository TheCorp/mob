function setup_custom_select(class_name,options)
	{
	var cont = new Array();
	var divs = document.getElementsByTagName("div");
	for (var i=0;i<divs.length;i++)
		{
		if (checkClass(divs[i],class_name)) cont.push(divs[i]);
		}
	for (var i=0;i<cont.length;i++)
		{
		cont[i].cont_index = i;
		cont[i].onclick = function()
			{
			if (!this.open)
				{
				this.innerHTML = "";
				var s = document.createElement("select");
				s.parent_div = this;
				s.onchange = function()
					{
					this.parent_div.innerHTML = this.value;
					this.parent_div.open = false;
					}
				s.onblur = s.onchange;
				for (var n=0;n<options.length;n++)
					{
					var o = document.createElement("option");
					o.value = options[n];
					o.innerHTML = options[n];
					s.appendChild(o);
					}
				this.appendChild(s);
				this.open = true;
				}
			}

		}
	}

function setup_custom_tinput(class_name)
	{
	var cont = new Array();
	var divs = document.getElementsByTagName("div");
	for (var i=0;i<divs.length;i++)
		{
		if (checkClass(divs[i],class_name)) cont.push(divs[i]);
		}
	for (var i=0;i<cont.length;i++)
		{
		cont[i].cont_index = i;
		cont[i].onclick = function()
			{
			if (!this.open)
				{
				this.oval = this.innerHTML;
				this.innerHTML = "";
				var ti = document.createElement("input");
				if (ti.setAttribute)
					{
					ti.setAttribute("type","text");
					ti.value = this.oval;
					this.appendChild(ti);
					}
				else this.innerHTML = '<input type="text" value="'+this.oval+'" />';
				ti = this.getElementsByTagName("input")[0];
				ti.parent_div = this;
				ti.onblur = function()
					{
					if (containsMoreThanSpaces(this.value)) this.parent_div.innerHTML = this.value;
					else this.parent_div.innerHTML = this.parent_div.oval;
					this.parent_div.open = false;
					}
				ti.onkeydown = function(e)
					{
					e = e || window.event;
					if (e.keyCode && e.keyCode == 13)
						{
						this.onblur();
						}
					}
				if (ti.focus) ti.focus();
				this.open = true;
				}
			}

		}
	}

function containsMoreThanSpaces(str)
	{
	for (var i=0;i<str.length;i++)
		{
		if (str.charAt(i) != " ") return true;
		}
	return false;
	}

function load_custom_edits()
	{
	setup_custom_edits();
	}
addOnloadEvent(load_custom_edits);