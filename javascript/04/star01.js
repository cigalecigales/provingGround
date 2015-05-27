/*

#******
 *##****
 **###**
 ***####

*/

var ary = [];

for(var i = 0; i <= 3; i++){
	var a = new Array(i+1).join("　");
	var b = new Array(i+2).join("＃");
	var c = new Array(7-i*2).join("　");

	var line = String(a + b + c) + String(a + b + c).split("").reverse().join("");
	document.write(line);

	ary.push(line);

	document.write("<br/>");
}

for(var c in ary.reverse()){
	document.write(ary[c] + "<br/>");
}

