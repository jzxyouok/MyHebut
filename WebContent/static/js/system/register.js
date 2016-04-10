/*
 * 注册及检验
 */
$(document).ready(function() {
	$(".registerBtn").on('click', function() {
		// 减去1个button
		for (var i = 0; i < document.registerForm.elements.length - 1; i++) {
			if (document.registerForm.elements[i].value == "") {
				alert("请将信息填写完整");
				document.registerForm.elements[i].focus();
				return false;
			}
		}

		register();
	})
});

function register() {
	var datasent = $("#registerForm").serializeObject();
	params = JSON.stringify(datasent);

	$.ajax({
		type : "POST",
		url : "/addUser",
		dataType : "json",
		contentType : "application/json;charset=utf-8",
		data : params,
		async : false,
		success : function(data) {
			if (data.resultCode == 0) {
				alert("注册成功");
				// 注册成功后切换到登陆窗口
				showLogin();
			} else {
				alert("用户名已存在");
			}
		}
	});
}

function showLogin() {
	$("#register").css("display", "none");
	$("#login").css("display", "table-cell");
	// 清空注册填写的信息
	$("#userName").val("");
	$("#userPass").val("");
	$("#confirmUserPass").val("");
	$("#email").val("");
}
