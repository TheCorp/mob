// Popup at ['center',300,'absolute']
function openImage(imageURL){
    pop_up(event,'showImage',['center',300,'absolute']);
    $("#briefcaseImage").attr("src",imageURL);
}


/* PopUp1
location can be an x,y,rel coordinate array
where x and y are either a pixel coordinate or "center"
where rel is either "absolute" "relative" or "mouse"
examples:
pop_up(event,"my_popup",[200,300])
pop_up(event,"my_popup",["center",300])
pop_up(event,"my_popup",[-400,-200,"mouse"])
pop_up(event,"my_popup",[20,20,"negoffset_mouse"]) --> positions the box's lower right hand corner 20px up and left from the mouse
*/
function pop_up(e, pop_up_id, location)
{

    if (!e) var e = window.event;
    var p = document.getElementById(pop_up_id);
    p.style.visibility = "hidden";
    p.style.display = "block"; // have to display the element to grab its width + height
    if (location)
    {
        var x = 0;
        var y = 0;
        var rel;
        var ctr = getCenterOfScreen();
        var whe = getWidthHeightOf(p);
        switch (location[2])
                {
            case "absolute" : rel = "absolute";break;
            case "relative" : rel = "relative";break;
            case "mouse" : rel = "absolute";break;
            case "offset_mouse" : rel = "absolute";break;
            default : rel = "absolute";
        }
        if (!isNaN(location[0])) x = location[0];
        else if (location[0] == "center" || location[0] == "middle") x = ctr[0] - whe[0] / 2;
        if (!isNaN(location[1])) y = location[1];
        else if (location[1] == "center" || location[1] == "middle") y = ctr[1] - whe[1] / 2;
        if (location[2] == "mouse")
        {
            var mxy = getMouseXY(e);
            x += mxy[0];
            y += mxy[1];
        }
        else if (location[2] == "negoffset_mouse")
        {
            var mxy = getMouseXY(e);
            x = mxy[0] - whe[0] - x;
            y = mxy[1] - whe[1] - y;
        }
        p.style.position = rel;
        p.style.left = Math.round(x) + "px";
        p.style.top = Math.round(y) + "px";
    }
    p.style.visibility = "visible";
    return false;
}