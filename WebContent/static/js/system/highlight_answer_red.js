/*
 * 题库高亮正确答案
 */
$(document).ready(function() {
	// flag为true时,正确答案未高亮显示
	var flag = true;
	var singleAmount = $('#singleAmount').val();
	var multipleAmount = $('#multipleAmount').val();
	$('#highlight-answer').click(function() {
		// 使答案高亮,并隐藏显示正确答案的下拉菜单
		if(flag){
			for (var i = 0; i < singleAmount; i++) {
				var answerT = $('#' + i + '_single_T').val();
				$('#' + i + '_single_' + answerT).css("color","red");
			}
			for (var i = 0; i < multipleAmount; i++) {
				var answerT = $('#' + i + '_multiple_T').val();
				var answer = answerT.split("");
				for (var j = 0; j < answer.length; j++) {
					$('#' + i + '_multiple_' + answer[j]).css("color","red");
				}
			}
			// 隐藏菜单
			$(".show_answerT").css("display","none");
			// 改变按钮的值
			$("#highlight-answer").text("取消答案高亮");
			flag = false;
		}else{// 取消答案高亮,并显示包含正确答案的下拉菜单
			for (var i = 0; i < singleAmount; i++) {
				var answerT = $('#' + i + '_single_T').val();
				$('#' + i + '_single_' + answerT).css("color","#34495E");
			}
			for (var i = 0; i < multipleAmount; i++) {
				var answerT = $('#' + i + '_multiple_T').val();
				var answer = answerT.split("");
				for (var j = 0; j < answer.length; j++) {
					$('#' + i + '_multiple_' + answer[j]).css("color","#34495E");
				}
			}
			// 显示菜单
			$(".show_answerT").css("display","block");
			// 改变按钮的值
			$("#highlight-answer").text("答案高亮显示");
			flag = true;
		}	
	});
});