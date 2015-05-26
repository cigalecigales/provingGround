var ary = [];

for(var i = 0; i <= 10; i++){
	ary.push("値" + i);
}

for(var c in ary){
	document.writeln(c + "番目：" + ary[c] + "<br/>");
}
