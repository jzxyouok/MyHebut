/*
 * 异步上传头像
 * 修改用户昵称
 */
$(document).ready(function() {
	$("#settingBtn").on('click', function() {
		$.ajaxFileUpload({
			url : '/settingUpdateTouxiang',
			secureuri : false,
			fileElementId : 'touxiang',
			dataType : 'text',
			success : function(data) {
				var datasent = $("#settingForm").serializeObject();
				params = JSON.stringify(datasent);
				$.ajax({
					type : "POST",
					url : "/settingUpdateOther",
					data : params,
					dataType : "json",
					contentType : "application/json;charset=utf-8",
					async : false,
					success : function(data) {
						if (data.resultCode == 0) {
							alert("个人设置成功");
							window.location.reload();
						} else {
							alert("个人设置失败");
						}
					}
				});
			},
			error : function(data) {
				alert("上传图像失败");
			}
		});

	})
});
