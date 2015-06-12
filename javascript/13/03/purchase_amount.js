var purchase_amount = document.getElementById("purchase_amount");
var purchase_amount_err = document.getElementById("purchase_amount_err");

// フォーカスアウトした際のイベントリスナー
function pa_blurEvent(){
	var purchase_amount_num = purchase_amount.value;
	// match・・・マッチした場合はArrayオブジェクト、マッチしなかった場合はnullを返却
	if (!purchase_amount_num.toString().match(/^[0-9]/g)) {
		purchase_amount_err.style.visibility = "visible";
		purchase_amount.value = "";
		purchase_amount.focus();
	} else {
		purchase_amount_err.style.visibility = "hidden";
		if(purchase_amount_num.toString().match(/^[00+]/g)){
			purchase_amount.value = "0";
		}else{
			purchase_amount.value = addComma(purchase_amount_num);
		}
	}
}
// フォーカスインした際のイベントリスナー
function pa_focusEvent(){
	var purchase_amount_num = purchase_amount.value;
	if (purchase_amount_num.length != 0) {
		purchase_amount.value = removeComma(purchase_amount_num);
	} else {
		;
	}
}

function addComma(text) {
	text = text.toString();
	// 正規表現を使ってカンマ区切りに
	text = text.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
	return text;
}
function removeComma(text) {
	text = text.toString();
	text = text.replace(/[,]/g, "");
	return text;
}