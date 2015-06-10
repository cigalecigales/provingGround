// 書籍
var books = document.getElementById("books"); // 書籍Fieldset
var books_chk = document.getElementById("books_chk"); // 書籍チェックボックス
var books_chk_list = books.getElementsByClassName("h_chk"); // 書籍Fieldset内の「h_chk」クラスを持っているもの
// 家具
var furnitures = document.getElementById("furnitures"); // 家具Fieldset
var furnitures_chk = document.getElementById("furnitures_chk"); // 家具チェックボックス
var furnitures_chk_list = furnitures.getElementsByClassName("h_chk"); // 家具Fieldset内の「h_chk」クラスを持っているもの

//初期表示時の活性／非活性処理
disabledChecks(false, books_chk_list);
disabledChecks(false, furnitures_chk_list);

// フラグによって小分類の活性／非活性を切り替える関数
function disabledChecks(flag, array) {
	if (flag) {
		for(var i = 0; i < array.length; i++){
			array[i].disabled = false;
		}
	} else {
		for(var i = 0; i < array.length; i++){
			array[i].disabled = true;
		}
	}
}

// 書籍チェック用イベントリスナー
function booksCheck(){
	disabledChecks(books_chk.checked, books_chk_list);
}
// 家具チェック用イベントリスナー
function furnituresCheck(){
	disabledChecks(furnitures_chk.checked, furnitures_chk_list);
}