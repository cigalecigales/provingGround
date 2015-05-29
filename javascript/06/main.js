// アカウント情報を保持する配列
var account = {
  "user1": "pass1",
  "user2": "pass2",
  "user3": "pass3"
}

var customerInfo = {
  "user1": {"name": "ユーザー1", "age": 15},
  "user2": {"name": "ユーザー2", "age": 25},
  "user3": {"name": "ユーザー3", "age": 30}
}

// アカウントの認証
var userId,
    password = "default";
while(account[userId] != password){
  userId = prompt("ユーザー名を入力してください。","");
  password = prompt("パスワードを入力してください。", "");
}

// ユーザー名を挿入
var top_username = document.getElementsByClassName("top_username");
var username_txt_node = document.createTextNode(customerInfo[userId]["name"]);
top_username[0].appendChild(username_txt_node);

// 画面を表示
var base = document.getElementById("base");
base.style.display = "";
