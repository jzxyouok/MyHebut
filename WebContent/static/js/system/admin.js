$(document).ready(function() {
	$("#submitBoard").on('click', function() {
		var datasent = $("#newBoard").serializeObject();
		params = JSON.stringify(datasent);
		console.log(params)
		$.ajax({
			type : "POST",
			url : "/admin/addBoard",
			data : params,
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			async : false,
			success : function(data) {
				if (data.resultCode == 0) {
					alert("发布成功")
					window.location.reload();
				} else {
					alert("发布失败");
				}
			}
		});
	});

	$("#submitReply").on('click', function() {
		var datasent = $("#newReply").serializeObject();
		params = JSON.stringify(datasent);
		$.ajax({
			type : "POST",
			url : "/admin/addReply",
			data : params,
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			async : false,
			success : function(data) {
				if (data.resultCode == 0) {
					alert("添加成功")
					window.location.reload();
				} else {
					alert("添加失败");
				}
			}
		});
	});

});

function deleteBoard(boardId) {
	var params = '{"boardId":' + boardId + '}';
	$.ajax({
		type : "POST",
		url : "/admin/deleteBoard",
		data : params,
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
}

function addReply(messageId){
	$("#messageId").val(messageId);
	$("#reply").val("");
	
	$("#showReply").click();
}
