//传递数字翻页信息
function turnToPage(page_now) {
	$("#page_now").val(page_now);
	$(".search").click();
}

// 提交queryForm表单并传递输入的页码信息
function formSubmit(page_num) {
	var page_show = $("#page_show").val();
	if(page_show > page_num){
		$("#page_now").val(page_num);
	}else if(!page_show || page_show < 1){
		$("#page_now").val(1);
	}else{
		$("#page_now").val(page_show);
	}
	$(".search").click();
}
