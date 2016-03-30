$(document).ready(function(){
	$("#alterPassBtn").on('click',function(){
		for(var i=0;i<document.alterPassForm.elements.length;i++)
        {
           if(document.alterPassForm.elements[i].value=="")
           {
              alert("请输入原密码和新密码");
              document.registerForm.elements[i].focus();
              return false;
           }
        }
		alterPassBtn();
	})
});

function alterPassBtn(){
	var datasent = $("#alterPassForm").serializeObject();
	params = JSON.stringify(datasent);
	$.ajax({
		type : "POST",
		url : "/alterMyPass",
		data : params,
		dataType : "json",
		contentType : "application/json;charset=utf-8",
		async : false,
		success : function(data) {
			if (data.resultCode == 0) {
				alert("修改成功")
				window.location.reload();
			} else {
				alert("原密码错误");
			}
		}
	});
}

