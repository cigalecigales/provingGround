// アカウント情報を保持する配列
var account = {
  "user1": "pass1",
  "user2": "pass2",
  "user3": "pass3"
}

var customerInfo = {
  "user1": {"name": "ユーザー1"},
  "user2": {"name": "ユーザー2"},
  "user3": {"name": "ユーザー3"}
}

// アカウントの認証
var userId = "",
    password = "default";
while(account[userId] != password){
  userId = prompt("ユーザー名を入力してください。","");
  password = prompt("パスワードを入力してください。", "");
}

// ユーザー名を画面に表示させる
var top_username = document.getElementsByClassName("top_username");
var username_txt_node = document.createTextNode(customerInfo[userId]["name"]);
top_username[0].appendChild(username_txt_node);

// 購入日
var purchase_date = document.getElementById("purchase_date");
var today = new Date();
var format = "YYYY/MM/DD";
function formatDate(date, format){
  format = format.replace(/YYYY/g, date.getFullYear());
  format = format.replace(/MM/g, ("0" + (date.getMonth() + 1)).slice(-2));
  format = format.replace(/DD/g, ("0" + date.getDate()).slice(-2));
  return format;
}
purchase_date.value = formatDate(today, format);
var date_fi_listener = function(e){
  purchase_date.value = purchase_date.value.split("/").join("");
}
var date_fo_listener = function(e){
  if(purchase_date.value.length == 8){
    var now_purchase_date = purchase_date.value;
    var format_date = now_purchase_date.substring(0, 4) + "/" +
                      now_purchase_date.substring(4, 6) + "/" +
                      now_purchase_date.substring(6);
    var formatted_date = new Date(format_date);
    if(isNaN(formatted_date)){
      alert("入力した値が不正です。");
      purchase_date.value = "";
    }else{
      purchase_date.value = formatDate(formatted_date, format);
    }
  }else{
    if(!purchase_date.value.length == 0){
      alert("入力した値が不正です。");
      purchase_date.value = "";
    }
  }
}
purchase_date.addEventListener("focus", date_fi_listener, false);
purchase_date.addEventListener("focusout", date_fo_listener, false);

// 購入額
var purchase_amount = document.getElementById("purchase_amount");
var amount_fi_listener = function(e){
  var purchase_amount_num = Number(purchase_amount.value);
  purchase_amount.value = purchase_amount_num.toLocaleString();
}
purchase_amount.addEventListener("focusout", amount_fi_listener, false);

//商品タイプ
var books = document.getElementById("books");
var books_chk = document.getElementById("books_chk");
var books_chk_list = books.getElementsByClassName("h_chk");
var furnitures = document.getElementById("furnitures");
var furnitures_chk = document.getElementById("furnitures_chk");
var furnitures_chk_list = furnitures.getElementsByClassName("h_chk");
function disabledBooks(flag){
  if(flag){
    for(var i in books_chk_list){
      books_chk_list[i].disabled = false;
    }
  }else{
    for(var i in books_chk_list){
      books_chk_list[i].disabled = true;
    }
  }
}
function disabledFurnitures(flag){
  if(flag){
    for(var j in furnitures_chk_list){
      furnitures_chk_list[j].disabled = false;
    }
  }else{
    for(var j in furnitures_chk_list){
      furnitures_chk_list[j].disabled = true;
    }
  }
}
disabledBooks(false);
disabledFurnitures(false);
var books_listener = function(e){
  disabledBooks(books_chk.checked);
}
var furnitures_listener = function(e){
  disabledFurnitures(furnitures_chk.checked);
}
books_chk.addEventListener("click", books_listener, false);
furnitures_chk.addEventListener("click", furnitures_listener, false);

// 商品登録ボタン
var product_table = document.getElementById("product_table");
var history_table = document.getElementById("history_table");
var regist_button = document.getElementById("regist_button");

var tr_count = 0;
function createRow(){
  var product_name = document.getElementById("product_name").value;
  if(!product_name){
    return alert("商品名は入力必須項目です。");
  }
  var tr = document.createElement("tr");
  var td_no = document.createElement("td");
  var td_date = document.createElement("td");
  var td_content = document.createElement("td");
  var td_no_txt = document.createTextNode(tr_count + 1);
  var td_date_txt = document.createTextNode(purchase_date.value);
  var td_content_txt = document.createTextNode(product_name + "を購入しました。");

  td_no.appendChild(td_no_txt);
  td_date.appendChild(td_date_txt);
  td_content.appendChild(td_content_txt);
  tr.appendChild(td_no);
  tr.appendChild(td_date);
  tr.appendChild(td_content);
  history_table.getElementsByTagName("tbody")[0].appendChild(tr);
  tr_count++;
}
var regist_listener = function(e){
  createRow();
}
regist_button.addEventListener("click", regist_listener, false);




// 画面を表示
var base = document.getElementById("base");
base.style.display = "";
