// アカウント情報を保持する配列
var account = {
  "user1": "pass1",
  "user2": "pass2",
  "user3": "pass3"
}

var customerInfo = {
  "user1": {"name": "ユーザー1",
            "birthday": "19920820",
            "gender": "0",
            "saving": 1000,
            "hobby": "00000"},
  "user2": {"name": "ユーザー2",
            "birthday": "19850423",
            "gender": "1",
            "saving": 256000,
            "hobby": "00100"},
  "user3": {"name": "ユーザー3",
            "birthday": "19780617",
            "gender": "1",
            "saving": 230,
            "hobby": "00101"}
}

// アカウントの認証
var userId = "user1",
    password = "pass1";
while(account[userId] != password){
  userId = prompt("ユーザー名を入力してください。","");
  password = prompt("パスワードを入力してください。", "");
}

// ユーザー名を挿入
var top_username = document.getElementsByClassName("top_username");
var username_txt_node = document.createTextNode(customerInfo[userId]["name"]);
top_username[0].appendChild(username_txt_node);

// ユーザー情報を挿入
var user_table = document.getElementById("user_table");
// ユーザー名
var username = user_table.childNodes[1].childNodes[0].childNodes[3].firstChild;
username.value = customerInfo[userId]["name"];
// 性別
var gender = user_table.childNodes[1].childNodes[6].childNodes[3];
if(customerInfo[userId]["gender"] == "0"){
  gender.childNodes[1].firstChild.checked = true;
  gender.childNodes[3].firstChild.checked = false;
}else{
  gender.childNodes[1].firstChild.checked = false;
  gender.childNodes[3].firstChild.checked = true;
}
// 趣味
var hobby = customerInfo[userId]["hobby"];
var in_out = hobby.substring(0);
var inp = document.getElementById("in");
var outp = document.getElementById("out");
var target;
if(in_out == "0"){
  target = inp.getElementsByTagName("input");
  for(var i in target){
    target[i].disabled = true;
  }
}else{
  target = outp.getElementsByTagName("input");
  for(var i in target){
    target[i].disabled = true;
  }
}


// 画面を表示
var base = document.getElementById("base");
base.style.display = "";
