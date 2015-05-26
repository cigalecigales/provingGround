// try catch

try{
	document.writeln("例外が起こる前<br/>");
	null.x; // ここで例外が発生
	document.writeln("例外が起こった後<br/>")
}catch(e){
	document.writeln(e.message + "<br/>");
}finally{
	document.writeln("ここは例外が起ころうが起こらまいが通る<br/>");
}
