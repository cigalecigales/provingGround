window.onload = function(){
	draw();
}

function draw(){
	var canvas = document.getElementById('mycanvas');
	if(!canvas || !canvas.getContext) return false;
	var ctx = canvas.getContext('2d');

	//ctx.strokeStyle = "#00ff00";
	//ctx.fillStyle = "#ff0000";
	//ctx.lineWidth = 6;
	//ctx.lineJoin = "round"; //bevel, miter

	//ctx.strokeRect(10,10,50,50);
	//ctx.fillRect(10,80,50,50);
	//ctx.clearRect(15,15,40,40);
	
	//var g = ctx.createLinearGradient(0,0,100,100);
	//var g = ctx.createRadialGradient(50,50,20,50,50,60);
	//g.addColorStop(0.0, "red");
	//g.addColorStop(0.5, "blue");
	//g.addColorStop(1.0, "green");
	//ctx.fillStyle = g;

	//ctx.shadowColor = "#ccc";
	//ctx.shadowOffsetX = 5;
	//ctx.shadowOffsetY = 5;
	//ctx.shadowBlur = 2;

	//ctx.scale(0.8,0.8);
	//ctx.rotate(30/180*Math.PI);
	//ctx.translate(100,10);

	//ctx.globalAlpha = 0.5;
	//ctx.fillRect(0,0,100,100);

	ctx.beginPath();
	//ctx.moveTo(20,20);
	//ctx.lineTo(123,123);
	//ctx.lineTo(124,120);
	//ctx.closePath();
	//ctx.stroke();
	ctx.arc(100,100,50,10/180*Math.PI,200/180*Math.PI);
	ctx.lineWidth = 15;
	ctx.lineCap = "round";
	ctx.stroke();

	ctx.font = "bold 20px Verdona";
	ctx.textAlign = "left";
	ctx.fillStyle = "green";
	ctx.fillText("dotinstall", 20, 20);
	//ctx.fill();
	
	var img = new Image();
	img.src = "me.png";
	img.onload = function(){
		var pattern = ctx.createPattern(img, "repeat");
		ctx.fillStyle=pattern;
		ctx.fillRect(20,20,100,100);
		//ctx.drawImage(img, 10,120);
	}
}
