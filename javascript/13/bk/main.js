/**************************************** ログイン機能 *********************************************/
// アカウント情報を保持する配列
var account = {
	"user1" : "pass1",
	"user2" : "pass2",
	"user3" : "pass3"
}

var customerInfo = {
	"user1" : {
		"name" : "ユーザー1"
	},
	"user2" : {
		"name" : "ユーザー2"
	},
	"user3" : {
		"name" : "ユーザー3"
	}
}

// アカウントの認証
var userId = "", password = "default";
while (account[userId] != password) {
	userId = prompt("ユーザー名を入力してください。", "");
	password = prompt("パスワードを入力してください。", "");
}
/**************************************** ログイン機能 *********************************************/



/**************************************** ユーザー名表示 *********************************************/
var top_username = document.getElementsByClassName("top_username");
// 配列customerInfoからログインユーザIDに該当する名前を取得し、テキストノードを作成。
var username_txt_node = document.createTextNode(customerInfo[userId]["name"]);
// getElementsByClassNameは配列を戻す。「top_username」というクラス名を使っているのは一か所しかないはずなのでtop_username[0]の一番目の要素を指定。
top_username[0].appendChild(username_txt_node);
/**************************************** ユーザー名表示 ********************************************/



/**************************************** 商品名 *********************************************/
// 商品名のチェック
var product_name = document.getElementById("product_name");
var product_name_err = document.getElementById("product_name_err");

var product_name_listener = function() {
	// 商品名が空欄の場合入力欄をピンクにしエラーメッセージ、それ以外の場合白にしてエラーメッセージも消す
	if (!product_name.value) {
		product_name_err.innerHTML = "※商品名の入力は必須です。";
		product_name.style.backgroundColor = "#f6bfbc";
		product_name.focus();

	} else {
		product_name_err.innerHTML = "";
		product_name.style.backgroundColor = "#ffffff";
	}
}
product_name.addEventListener("focusout", product_name_listener, false);

/**************************************** 商品名 *********************************************/



/**************************************** 購入日 *********************************************/
var purchase_date = document.getElementById("purchase_date");
var purchase_date_err = document.getElementById("purchase_date_err");
var today = new Date();
var format = "YYYY/MM/DD";

// 「YYYY/MM/DD」の「YYYY」などの部分を本日日付の値で置き換える関数
function formatDate(date, format) {
	format = format.replace(/YYYY/g, date.getFullYear());
	format = format.replace(/MM/g, ("0" + (date.getMonth() + 1)).slice(-2));
	format = format.replace(/DD/g, ("0" + date.getDate()).slice(-2));
	return format;
}

// 初期表示用に本日日付を設定
purchase_date.value = formatDate(today, format);

// フォーカスした際のイベントリスナーの定義
var date_fi_listener = function(e) {
	// split・・・対象文字列を指定文字列で分割して配列に変換
	// join・・・対象配列を指定文字列で区切って文字列に変換
	purchase_date.value = purchase_date.value.split("/").join("");
}

// フォーカスアウトした際のイベントリスナーの定義
var date_fo_listener = function(e) {
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
			purchase_date_err.innerHTML = "※入力された値が日付ではありません。";
			purchase_date.value = "";
			purchase_date.focus();
		} else {
			purchase_date_err.innerHTML = "";
			purchase_date.value = formatDate(formatted_date, format);
		}
	} else {
		if (!purchase_date.value.length == 0) {
			purchase_date_err.innerHTML = "※入力された値が日付ではありません。";
			purchase_date.value = "";
			purchase_date.focus();
		} else {
			purchase_date_err.innerHTML = "";
		}
	}
}
purchase_date.addEventListener("focus", date_fi_listener, false);
purchase_date.addEventListener("focusout", date_fo_listener, false);
/**************************************** 購入日 *********************************************/



/**************************************** 購入額 *********************************************/
var purchase_amount = document.getElementById("purchase_amount");
var purchase_amount_err = document.getElementById("purchase_amount_err");

// フォーカスアウトした際のイベントリスナー
var amount_fo_listener = function(e) {
	var purchase_amount_num = purchase_amount.value;
	// match・・・マッチした場合はArrayオブジェクト、マッチしなかった場合はnullを返却
	if (purchase_amount_num.toString().match(/[^0-9]/g)) {
		purchase_amount_err.innerHTML = "※入力された値が数値ではありません。"
		purchase_amount.value = "";
		purchase_amount.focus();
	} else {
		purchase_amount_err.innerHTML = "";
		purchase_amount.value = addComma(purchase_amount_num);
	}
}
// フォーカスインした際のイベントリスナー
var amount_fi_listener = function(e) {
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
purchase_amount.addEventListener("focusout", amount_fo_listener, false);
purchase_amount.addEventListener("focus", amount_fi_listener, false);
/**************************************** 購入額 *********************************************/



/**************************************** 商品タイプ *********************************************/
// 書籍
var books = document.getElementById("books"); // 書籍Fieldset
var books_chk = document.getElementById("books_chk"); // 書籍チェックボックス
var books_chk_list = books.getElementsByClassName("h_chk"); // 書籍Fieldset内の「h_chk」クラスを持っているもの
// 家具
var furnitures = document.getElementById("furnitures"); // 家具Fieldset
var furnitures_chk = document.getElementById("furnitures_chk"); // 家具チェックボックス
var furnitures_chk_list = furnitures.getElementsByClassName("h_chk"); // 家具Fieldset内の「h_chk」クラスを持っているもの

// フラグによって小分類の活性／非活性を切り替える関数
function disabledChecks(flag, array) {
	if (flag) {
		for ( var i in array) {
			array[i].disabled = false;
		}
	} else {
		for ( var i in array) {
			array[i].disabled = true;
		}
	}
}

// 初期表示時の活性／非活性処理
disabledChecks(false, books_chk_list);
disabledChecks(false, furnitures_chk_list);

// 書籍チェック用イベントリスナー
var books_listener = function(e) {
	disabledChecks(books_chk.checked, books_chk_list);
}
// 家具チェック用イベントリスナー
var furnitures_listener = function(e) {
	disabledChecks(furnitures_chk.checked, furnitures_chk_list);
}
books_chk.addEventListener("click", books_listener, false);
furnitures_chk.addEventListener("click", furnitures_listener, false);
/**************************************** 商品タイプ *********************************************/



/**************************************** 商品登録 *********************************************/
// 登録時バリデーション用関数
function registValidation() {
	var books_err = document.getElementById("books_err");
	var furnitures_err = document.getElementById("furnitures_err");

	var regist_check_flag = true;

	// 商品名が空欄の場合入力欄をピンクにし、それ以外の場合白に
	if (!product_name.value) {
		var product_name_err = document.getElementById("product_name_err");
		product_name_err.innerHTML = "※商品名の入力は必須です。";
		product_name.style.backgroundColor = "#f6bfbc";
		product_name.focus();
		regist_check_flag = false;
	} else {
		product_name.style.backgroundColor = "#ffffff";
	}

	// 商品タイプのチェック
	if (books_chk.checked) {
		if (!checkCheckCount(books_chk_list)) {
			books_err.innerHTML = "※1つ以上選択してください。";
			regist_check_flag = false;
		} else {
			books_err.innerHTML = "";
		}
	}
	if (furnitures_chk.checked) {
		if (!checkCheckCount(furnitures_chk_list)) {
			furnitures_err.innerHTML = "※1つ以上選択してください。";
			regist_check_flag = false;
		} else {
			furnitures_err.innerHTML = "";
		}
	}

	return regist_check_flag;
}

// 商品タイプチェック用関数
function checkCheckCount(array) {
	for ( var c in array) {
		if (array[c].checked)
			return true;
	}
	return false;
}
/**************************************** 商品登録 *********************************************/



/**************************************** 履歴登録 *********************************************/
// 商品情報テーブル
var product_table = document.getElementById("product_table");
// 登録履歴テーブル
var history_table = document.getElementById("history_table");
// 商品を登録するボタン
var regist_button = document.getElementById("regist_button");

// No用カウンタ
var tr_count = 0;

// 行追加用関数
function createRow() {

	if (!registValidation())
		return;

	// 要素の作成
	var tr = document.createElement("tr");
	var td_no = document.createElement("td");
	td_no.className = "h_td1";
	var td_date = document.createElement("td");
	td_date.className = "h_td2";
	var td_content = document.createElement("td");
	td_content.className = "h_td3";
	// テキストノード作成
	var td_no_txt = document.createTextNode(tr_count + 1);
	var h_date = new Date();
	var date_options = {
		weekday : "short",
		year : "numeric",
		month : "short",
		day : "numeric",
		hour : "2-digit",
		minute : "2-digit"
	}
	var td_date_txt = document.createTextNode(h_date.toLocaleTimeString("ja-JP", date_options));
	var td_content_txt = createHistoryStr();

	// 要素の追加
	td_no.appendChild(td_no_txt);
	td_date.appendChild(td_date_txt);
	td_content.innerHTML = td_content_txt;
	tr.appendChild(td_no);
	tr.appendChild(td_date);
	tr.appendChild(td_content);
	history_table.getElementsByTagName("tbody")[0].appendChild(tr);
	tr_count++;
}

function createHistoryStr(){
	var hst_array = [];
	if(product_name.value){
		hst_array.push("商品名：" + product_name.value);
	}
	if(purchase_date.value){
		hst_array.push("購入日：" + purchase_date.value);
	}
	var supplier = document.getElementsByName("supplier");
	if(supplier[0].checked){
		hst_array.push("仕入先：" + supplier[0].value);
	}
	if(supplier[1].checked){
		hst_array.push("仕入先：" + supplier[1].value);
	}
	if(purchase_amount.value){
		hst_array.push("購入額：" + purchase_amount.value);
	}
	var check_str = "";
	if(books_chk.checked){
		var books_array = [];

		for(var bc in books_chk_list){
			if(books_chk_list[bc].checked){
				if(bc != "books_type"){
					books_array.push(books_chk_list[bc].value);
				}
			}
		}
		check_str = check_str + ("【書籍】" + books_array.join(", "));
	}
	if(furnitures_chk.checked){
		var furnitures_array = [];
		for(var fc in furnitures_chk_list){
			if(furnitures_chk_list[fc].checked){
				if(fc != "furnitures_type"){
					furnitures_array.push(furnitures_chk_list[fc].value);
				}
			}
		}
		check_str = check_str + ("【家具】" + furnitures_array.join(", "));
	}
	if(check_str){
		hst_array.push("商品タイプ：" + check_str);
	}

	return hst_array.join('<br/>');
}

// 商品登録ボタン用イベントリスナー
var regist_listener = function(e) {
	try {
		createRow();
	} catch (e) {
		alert(e.message);
	}
}
regist_button.addEventListener("click", regist_listener, false);
/**************************************** 履歴登録 *********************************************/



/**************************************** 画面表示 *********************************************/
var base = document.getElementById("base");
base.style.display = "";
/**************************************** 画面表示 *********************************************/
