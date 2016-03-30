/*
 * 登录
 */
$(document).ready(function(){
	$(".loginBtn").on('click',function(){
		login();
    });
	// 按回车执行查询(回车键值13)
	$("#userName").on("keypress", function(){
		var event = arguments.callee.caller.arguments[0]||window.event;//消除浏览器差异 
		if (event.keyCode == 13) {
			login();
		} 
	}); 
	$("#userPass").on("keypress", function(){
		var event = arguments.callee.caller.arguments[0]||window.event;
		if (event.keyCode == 13) {
			login();
		} 
	}); 

});

function login(){
 	var datasent = $("#loginForm").serializeObject();
	params = JSON.stringify(datasent); 
	$.ajax({
		type : "POST",
		url : "/loginCheck",
		dataType : "json",
		contentType : "application/json;charset=utf-8",
		data : params,
		async : false,
		success : function(data) {
			if(data.resultCode == 0){   
				window.location.href="/index";
			}else{
				alert(data.Data);
			}
		}
	});
}


