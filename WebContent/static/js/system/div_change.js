/*
 * 登录注册div切换
 */
$(document).ready(function() {
		$(".change-register").click(function(event) {
		$("#login").css("display", "none");
		$("#register").css("display", "block");
	});
	$(".change-login").click(function(event) {
		$("#register").css("display", "none");
		$("#login").css("display", "table-cell");
	});
});