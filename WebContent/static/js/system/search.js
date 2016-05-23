/*
 * 搜索选择科目
 */
$(document).ready(function() {
	$(".choose-mayuan").click(function() {
		$("#subject").val("0");
		$("#choose-subject").submit();
	});
	$(".choose-maogai-shang").click(function() {
		$("#subject").val("1");
		$("#choose-subject").submit();
	});
	$(".choose-maogai-xia").click(function() {
		$("#subject").val("2");
		$("#choose-subject").submit();
	});
	$(".choose-shigang").click(function() {
		$("#subject").val("3");
		$("#choose-subject").submit();
	});
});

/*
 * 搜索功能检验
 * 搜索内容不能为空
 */
function check_search(){
	var search = document.getElementById("search").value;
	if(search == ""){
	    alert("搜索关键字不能为空");
	    return false;
	}
}

