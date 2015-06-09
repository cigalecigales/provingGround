var value = "29";

function checkType(value){
	if(typeof value == "string"){
		document.write("文字列です。");
	}else if(typeof value == "number"){
		document.write("数値です。");
	}else{
		document.write("その他です。");
	}
}

checkType(value);

value = value - 0;
value = value - 10;
checkType(value);
document.write(value);
