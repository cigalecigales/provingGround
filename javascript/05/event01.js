var div1 = document.getElementById("div1");
var div2 = document.getElementById("div2");

var listener1 = function(e){
	alert("div1");
}
var listener2 = function(e){
	e.stopPropagation();
	alert("div2");
}

div1.addEventListener("click", listener1, false);
div2.addEventListener("click", listener2, false);
