// 商品登録ボタン用イベント
function regist() {
	try {
		registValidation();
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