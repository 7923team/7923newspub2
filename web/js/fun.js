// 输入框获得焦点状态
function clearinput(obj) {
	if(obj.value=="请输入关键字"){
		obj.value="";
		obj.style.color="#000000"
	}
}

// 输入框失去焦点状态
function setinput(obj){
	if(obj.value==""){
		obj.value="请输入关键字";
		obj.style.color="#999999"
	}
}

// 获取系统时间
function showTime(){
	var Timer=new Date();
	var h=Timer.getHours();
	var m=Timer.getMinutes();
	var s=Timer.getSeconds();
	var d=Timer.getDate();
	var mm=Timer.getMonth()+1;
	var y=Timer.getFullYear();
	var w=Timer.getDay();

	mm=mm>9?mm:"0"+mm;
	d=d>9?d:"0"+d;
	h=h>9?h:"0"+h;
	m=m>9?m:"0"+m;
	s=s>9?s:"0"+s;
	if(w==0) w="日";
	if(w==1) w="一";
	if(w==2) w="二";
	if(w==3) w="三";
	if(w==4) w="四";
	if(w==5) w="五";
	if(w==6) w="六";

	var strShow=""+y+"-"+mm+"-"+d+" "+h+":"+m+":"+s+" "+"星期"+w;

	// if(h<6)
	// 	strShow+="熬夜对身体不好哦，早点休息吧。";
	// else if(h<9)
	// 	strShow+="早上好！";
	// else if(h<12)
	// 	strShow+="上午好！";
	// else if(h<19)
	// 	strShow+="下午好！";
	// else if(h<24)
	// 	strShow+="晚上好！";
	
	myspan.innerText=strShow;
	setTimeout("showTime()",1000);
}

