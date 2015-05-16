function closure(init){
	var count = init;
	return function(){
		return ++count;
	}
}

var myClosure = closure(1);
document.writeln(myClosure());
document.writeln(myClosure());
document.writeln(myClosure());
document.writeln(myClosure());
document.writeln(myClosure());
