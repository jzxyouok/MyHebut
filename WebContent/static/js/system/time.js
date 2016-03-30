// 倒计时
var time=1800;
var minute = 0;
var second = 0;
var timer;
function change()
{
 	time--;
	if(time>-1)
	{	
		minute = parseInt(time/60);
		second = time - minute * 60;
		if(second > 9){
			document.getElementById("time").innerHTML=minute + "分" + second + "秒";
		}else{
			document.getElementById("time").innerHTML=minute + "分0" + second + "秒";
		}
		document.getElementById("time_hide").value=time;
 		
		timer = setTimeout('change()',1000);//调用自身实现
	}
 	else
 	{
   		clearTimeout(timer);
 	}
}
timer = setTimeout('change()',1000);


