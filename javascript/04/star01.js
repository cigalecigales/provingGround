/*

#******
 *##****
 **###**
 ***####

*/
for(var i = 0; i <= 3; i++){
	var c = new Array(i+1).join("＊");
	var d = new Array(i+2).join("＃");
	var e = new Array(7-i*2).join("＊");
	document.write(c + d + e);
	for(var j = 0; j <= 6; j++){
	}
	document.write("<br/>");
}


function displayArray(ary){
	for(var c in ary){
		document.write(ary[c]);
	}

	document.write("<br/>");
}

