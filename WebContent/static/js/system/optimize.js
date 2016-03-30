/*
 * 优化菜单栏切换
 */
$(document).ready(function(){
	$(".hide_panel").click(function() {
		$(".panel_single").css("display","none");
		$(".panel_multiple").css("display","none");
	});
});