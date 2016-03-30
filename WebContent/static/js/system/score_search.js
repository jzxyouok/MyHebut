$(document).ready(function() {
    $('#submitBtn').click(function(){
        var stuId = $("#submitForm").find('#stuId').val();
        var authCode = $("#submitForm").find('#authCode').val();
        if(stuId == '') {
            $("#submitForm").find('.error').fadeOut('fast', function(){
                $(this).css('top', '0px');
            });
            $("#submitForm").find('.error').fadeIn('fast', function(){
                $(this).parent().find('#stuId').focus();
            });
            return false;
        }
		
        if(authCode == '') {
            $("#submitForm").find('.error').fadeOut('fast', function(){
                $(this).css('top', '69px');
            });
            $("#submitForm").find('.error').fadeIn('fast', function(){
                $(this).parent().find('#authCode').focus();
            });
            return false;
        }
        submit();
    });
    
	// 按回车执行查询(回车键值13)
	$("#stuId").on("keypress", function(){
		var event = arguments.callee.caller.arguments[0]||window.event;//消除浏览器差异 
		if (event.keyCode == 13) {
			submit();
		} 
	}); 
	$("#authCode").on("keypress", function(){
		var event = arguments.callee.caller.arguments[0]||window.event;
		if (event.keyCode == 13) {
			submit();
		} 
	}); 

    $('.login-container form #stuId, .login-container form #authCode').keyup(function(){
        $(this).parent().find('.error').fadeOut('fast');
    });
});

function submit(){
	$(".login-container").fadeOut(1000);
	var datasent = $("#submitForm").serializeObject();
	//从一个对象中解析出字符串
	params = JSON.stringify(datasent);  
	$.ajax({
		type : "POST",
		url : "/submitMsg",
		data: params,
		dataType : "json",
		contentType : "application/json;charset=utf-8",
		async : false,
		success : function(data) {
			if(data.resultCode == 0){
				if(data.idStatus == 0){
					addTable(data);
				}else{
					errorId();
				}
			}else{
				errorYZM();
			}
		}
	});
}

function addTable(data) {
	$(".score_table").fadeIn(3500);
	for (var i = 0, len = data.stuData.length; i < len; i++) {
		var insertText = data.stuData[i];
		$("#stuMsg_" + i).append(insertText);
	}
	for (var i = 0, len = data.scoreData.length; i < len; i++) {
		var insertText = "<tr><td>" + data.scoreData[i].course + "</td><td>" + data.scoreData[i].credit + "</td><td>" + data.scoreData[i].score + "</td></tr>";
		$("#score_list").append(insertText);
	}
}

function errorYZM() {
	var insertText = "验证码输入有误,请重新刷新页面";
	$("#errorMsg").append(insertText);
}

function errorId() {
	var insertText = "学号输入有误,请重新刷新页面";
	$("#errorMsg").append(insertText);
}
