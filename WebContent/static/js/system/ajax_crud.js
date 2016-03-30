/*
 * 增加错题题
 * 删除错题集
 * 删除考试记录
 */
$(document).ready(function() {
	$(".add_wrongQuestion").on('click', function() {
		var datasent = $(this).parent().serializeObject();
		params = JSON.stringify(datasent); 
		$.ajax({
			type : "POST",
			url : "/add",
			data: params,
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			async : false,
			success : function(data) {
				if (data.resultCode == 0) {
					alert("添加成功")
				} else {
					alert("该错题已存在");
				}
			}
		});
	});

	$(".delete_questionNote").on('click', function() {
		var datasent = $(this).parent().serializeObject();
		params = JSON.stringify(datasent); 
		$.ajax({
			type : "POST",
			url : "/delete",
			data: params,
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			async : false,
			success : function(data) {
				if (data.resultCode == 0) {
					alert("删除成功");
					window.location.reload();
				} else {
					alert("删除失败");
				}
			}
		});
	});

	
	$(".delete_record").on('click', function() {
		var datasent = $(this).parent().serializeObject();
		params = JSON.stringify(datasent); 
		$.ajax({
			type : "POST",
			url : "/deleteRecord",
			data: params,
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			async : false,
			success : function(data) {
				if (data.resultCode == 0) {
					alert("删除成功");
					window.location.reload();
				} else {
					alert("删除失败");
				}
			}
		});
	});
	
});

 