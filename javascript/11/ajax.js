var myFunc = function(name){
	this.name = name;
}
myFunc.prototype = {
	getName: function(){
		document.write("Hello" + this.name);
	}
}

var func1 = new myFunc("Tarou");
func1.getName();
