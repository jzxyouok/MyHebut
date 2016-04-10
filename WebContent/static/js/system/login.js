/*
 * 登录
 */
$(document).ready(function(){
	// 二维码浮动效果
	$("#show-code").powerFloat({
		targetMode : "ajax"
	});
	// 显示登陆界面
	$("#enter-exam").click(function() {
		$(".advertise").css("display", "none");
		$(".banner-right").css("margin-top", "10px");
		$(".login_register").css("display", "block");
	});
	$(".change-register").click(function(event) {
		$("#login").css("display", "none");
		$("#register").css("display", "block");
	});
	$(".change-login").click(function(event) {
		$("#register").css("display", "none");
		$("#login").css("display", "table-cell");
	});
	
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


