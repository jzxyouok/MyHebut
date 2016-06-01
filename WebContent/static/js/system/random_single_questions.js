
//question_id用于记录显示的题号,用于显示下一题时隐藏上一题
var question_id;
// 当前题号
var question_id;
// 正确答案
var answerT;

$(document).ready(function() {
	// 获取题数
	var amount = $("#questionAmount").val();
	$(".current-num").text("1/" + amount);
	//初始化显示
	$("#" + question_id + "_question").css("display","none");
	// 用于记录已经随机过的试题
	var arrayId = [];
	// 获得一个不大于题数的随机数
	question_id = Math.floor(Math.random()*amount);
	// 将题号添加到数组
	arrayId.push(question_id);
 	$("#" + question_id + "_question").css("display","block");
 	// 点击确定的事件
	$(".confirm").click(function(event) {
		// 批改
		checkAnswer();
	});

	$(".next").click(function(event) {
		// 隐藏上一题
		$("#" + question_id + "_question").css("display","none");
		// 恢复原来的颜色
		$('input:radio[name=' + question_id + '_answer]').parent().css("color","#34495E");
		// 隐藏对勾和叉叉
		$('.fa-times').css("display","none");
		$('.fa-check').css("display","none");
		// 取消原来的选中
		$('input:radio[name=' + question_id + '_answer]').removeAttr('checked');
		
		while(arrayId.indexOf(question_id) != -1){
			question_id = Math.floor(Math.random()*amount);
			if(arrayId.length == amount){
				$("#info").css("display","block");
				// 下一题按钮禁用
				$(".confirm").attr({"disabled":"disabled"});
				$(".next").attr({"disabled":"disabled"});
				$(".add_wrongQuestion").attr({"disabled":"disabled"});
				break;
			}
		}
		// 将题号添加到数组
		if(arrayId.length < amount){
			arrayId.push(question_id);
	 		$("#" + question_id + "_question").css("display","block");
		}
		// 设置当前题号
		$(".current-num").text(arrayId.length + "/" + amount);
	});
	
	/*
	 * 增加错题
	 */
	$(".add_wrongQuestion").on('click', function() {
		// 设置题目信息
		var answerOwn = $('input:radio[name=' + question_id + '_answer]:checked').val();
		var id = $("#" + question_id + "_id").val();
		// 用于错题记录
		$("#answerF").val(answerOwn);
	 	$("#questionId").val(id);
	 	// 发送错题信息
		var datasent = $(this).parent().serializeObject();
		params = JSON.stringify(datasent); 
		console.log(params);
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

});

function checkAnswer(){
	var answerOwn = $('input:radio[name=' + question_id + '_answer]:checked').val();
	var id = $("#" + question_id + "_id").val();
	// 用于错题记录
	$("#answerOwn").val(answerOwn);
 	$("#id").val(id);
	answerT = $("#" + question_id + "_answerT").val();
	if(answerOwn == answerT){
		$('input:radio[name=' + question_id + '_answer]:checked').parent().css("color","green");
		// 显示对勾
		$('input:radio[name=' + question_id + '_answer]:checked').parent().next().next().css("display","inline-block");
	} else if(typeof(answerOwn) != "undefined"){
		$('input:radio[name=' + question_id + '_answer]:checked').parent().css("color","red");
		// 显示叉叉
		$('input:radio[name=' + question_id + '_answer]:checked').parent().next().css("display","inline-block");
		$('input:radio[name=' + question_id + '_answer][value=' + answerT + ']').parent().css("color","green");
		// 显示对勾
		$('input:radio[name=' + question_id + '_answer][value=' + answerT + ']').parent().next().next().css("display","inline-block");
	} else{
	}
}