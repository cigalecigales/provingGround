var purchase_date = document.getElementById("purchase_date");
var purchase_date_err = document.getElementById("purchase_date_err");

var today = new Date();
var format = "YYYY/MM/DD";

//初期表示用に本日日付を設定
purchase_date.value = formatDate(today, format);

// 「YYYY/MM/DD」の「YYYY」などの部分を本日日付の値で置き換える関数
function formatDate(date, format) {
	format = format.replace(/YYYY/g, date.getFullYear());
	format = format.replace(/MM/g, ("0" + (date.getMonth() + 1)).slice(-2));
	format = format.replace(/DD/g, ("0" + date.getDate()).slice(-2));
	return format;
}

// フォーカスした際のイベント定義
function pd_focusEvent(){
	// split・・・対象文字列を指定文字列で分割して配列に変換
	// join・・・対象配列を指定文字列で区切って文字列に変換
	purchase_date.value = purchase_date.value.split("/").join("");
}

// フォーカスアウトした際のイベントリスナーの定義
function pd_blurEvent(){
	// 入力値が8文字でなく、0文字でもない場合エラーを表示。
	if (purchase_date.value.length == 8) {
		var now_purchase_date = purchase_date.value;
		// 「20150101」⇒「2015/01/01」の形に変換。
		var format_date = now_purchase_date.substring(0, 4) + "/"
				+ now_purchase_date.substring(4, 6) + "/"
				+ now_purchase_date.substring(6);
		// 変換したフォーマットでDateオブジェクトを作成
		var formatted_date = new Date(format_date);
		// 変換できないとNaNになるため、NaNの場合エラー、変換できた場合はOK
		if (isNaN(formatted_date)) {
			purchase_date_err.style.visibility = "visible";
			purchase_date.value = "";
			purchase_date.focus();
		} else {
			purchase_date_err.style.visibility = "hidden";
			purchase_date.value = formatDate(formatted_date, format);
		}
	} else {
		if (!purchase_date.value.length == 0) {
			purchase_date_err.style.visibility = "visible";
			purchase_date.value = "";
			purchase_date.focus();
		} else {
			purchase_date_err.style.visibility = "hidden";
		}
	}
}