function check_product_name(){
	var product_name = document.getElementById("product_name");
	var product_name_err = document.getElementById("product_name_err");

	// 商品名が空欄の場合入力欄をピンクにしエラーメッセージ、
	// それ以外の場合白にしてエラーメッセージも消す
	if (!product_name.value) {
		product_name_err.style.visibility = "visible";
		product_name.style.backgroundColor = "#f6bfbc";
		product_name.focus();
	} else {
		product_name_err.style.visibility = "hidden";
		product_name.style.backgroundColor = "#ffffff";
	}
}