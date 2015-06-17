var obj = new XMLHttpRequest();
obj.onreadystatechange = function(){
	alert("readyState: " + obj.readyState);
}
obj.open("GET", "http://www.hulu.jp/");
obj.send(null);
