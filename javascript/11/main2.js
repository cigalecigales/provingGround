var value1 = "0";
var value2 = -20;
var value3 = "test";
var value4 = "-20";
var value5 = 0;
var value6 = "0.222";
var value7 = "100aaa";
var value8 = "20";
var value9 = NaN;
var value10 = "NaN";

function check(value){
	if(value > 0){
		document.write("0以上。<br/>");
	}else{
		document.write("else<br/>");
	}
}

check(value1);
check(value2);
check(value3);
check(value4);
check(value5);
check(value6);
check(value7);
check(value8);
check(value9);
check(value10);

