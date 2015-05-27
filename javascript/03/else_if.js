/**

身長と体重を引数として渡すと、
BMIを計算し、メッセージを表示するプログラムを書きます。

【BMI計算方法】
BMI＝体重(kg) ÷ (身長(m) × 身長(m))

【表示メッセージ】
・BMIが18.5未満の場合
　　⇛「痩せすぎです。」
・BMIが18.5〜25未満の場合
　　⇛「適切な体重です。」
・BMIが25以上の場合
　　・30未満の場合
　　　⇛「軽度の肥満です。」
　　・35未満の場合
　　　⇛「中度の肥満です。」
　　・40未満の場合
　　　⇛「高度の肥満です。」
　　・40位上の場合
　　　⇛「直ちに病院で受診してください。」

*/

function checkBmi(height, weight){
	var bmi = weight / (height * height);

	if(bmi < 18.5){
		document.write("痩せすぎです。");
	}else if(bmi < 25){
		document.write("適切な体重です。");
	}else if(bmi >= 25){
		if(bmi < 30){
			document.write("軽度の肥満です。");
		}else if(bmi < 35){
			document.write("中度の肥満です。");
		}else if(bmi < 40){
			document.write("高度の肥満です。");
		}else{
			document.write("直ちに病院で受診してください。");
		}
	}
}

checkBmi(1.6, 47);
