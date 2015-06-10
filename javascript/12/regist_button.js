// 商品登録ボタン用イベント
function regist() {
	try {
		createRow();
	} catch (e) {
		alert(e.message);
	}
}

// 登録時バリデーション用関数
function registValidation() {
	var books_err = document.getElementById("books_err");
	var furnitures_err = document.getElementById("furnitures_err");

	var regist_check_flag = true;

	// 商品名が空欄の場合入力欄をピンクにし、それ以外の場合白に
	if (!product_name.value) {
		var product_name_err = document.getElementById("product_name_err");
		product_name_err.style.visibility = "visible";
		product_name.style.backgroundColor = "#f6bfbc";
		product_name.focus();
		regist_check_flag = false;
	} else {
		product_name.style.backgroundColor = "#ffffff";
	}

	// 商品タイプのチェック
	if (books_chk.checked) {
		if (!checkCheckCount(books_chk_list)) {
			books_err.style.display = "";
			regist_check_flag = false;
		} else {
			books_err.style.visibility = "none";
		}
	}
	if (furnitures_chk.checked) {
		if (!checkCheckCount(furnitures_chk_list)) {
			furnitures_err.style.visibility = "";
			regist_check_flag = false;
		} else {
			furnitures_err.style.visibility = "none";
		}
	}

	return regist_check_flag;
}

// 商品タイプチェック用関数
function checkCheckCount(array) {
	for(var i = 0; i < array.length; i++){
		if (array[i].checked){
			return true;
		}else{
			;
		}
	}
	return false;
}

//商品情報テーブル
var product_table = document.getElementById("product_table");
// 登録履歴テーブル
var history_table = document.getElementById("history_table");
// 商品を登録するボタン
var regist_button = document.getElementById("regist_button");


// 行追加用関数
function createRow() {

	if (!registValidation()){
		return;
	}else{;}

	// 要素の作成
	var h_date = new Date();
	var date_options = {
		weekday : "short",
		year : "numeric",
		month : "short",
		day : "numeric",
		hour : "2-digit",
		minute : "2-digit"
	}
	var td_date_txt = h_date.toLocaleTimeString("ja-JP", date_options);
	
	var history_area = document.getElementById("history_area");
	var history_txt = createHistoryStr() + "\n";
	history_area.value = history_area.value + history_txt;

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

		for(var i = 0; i < books_chk_list.length; i++){
			if(books_chk_list[i].checked){
				books_array.push(books_chk_list[i].value);
			}
		}
		check_str = check_str + ("【書籍】" + books_array.join(", "));
	}
	if(furnitures_chk.checked){
		var furnitures_array = [];

		for(var i = 0; i < furnitures_chk_list.length; i++){
			if(furnitures_chk_list[i].checked){
				furnitures_array.push(furnitures_chk_list[i].value);
			}
		}
		check_str = check_str + ("【家具】" + furnitures_array.join(", "));
	}
	if(check_str){
		hst_array.push("商品タイプ：" + check_str);
	}

	return hst_array.join('　');
}