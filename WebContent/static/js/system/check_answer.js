/*
 * 提交试卷时提醒未作答科目
 */
$(document).ready(function(){
	$(".check_answer").click(function() {
		var single_flag = true;
		var multiple_flag = true;
		var single_count = 0;
		var multiple_count = 0;
		var reminder_multiple = document.getElementById("reminder_multiple");
		var reminder_single = document.getElementById("reminder_single");
		var singleAmount = $("#singleAmount").val();
		var multipleAmount = $("#multipleAmount").val();
		reminder_multiple.innerHTML = '';
		reminder_single.innerHTML = '';
		for (var i = 0; i < singleAmount; i++) {
			var name = i + "_single";
			var flag = $('input:radio[name=' + name + ']').is(":checked");
			// flag为false则未作答
			if(!flag){
				single_count++;
				// single_flag为trie表明这是第一次修改
				if(single_flag){
					reminder_single.innerHTML = "单选题号: " + (i + 1) + " ";
					single_flag = false;
				}else{
					reminder_single.innerHTML += i + 1 + " ";
				}
			}
		}
		for (var i = 0; i < multipleAmount; i++) {
			var name = i + "_multiple";
			var flag = $('input:checkbox[name=' + name + ']').is(":checked");			
			if(!flag){
				multiple_count++;
				if(multiple_flag){
					reminder_multiple.innerHTML = "多选题号: " + (i + 1) + " ";
					multiple_flag = false;
				}else{
					reminder_multiple.innerHTML += i + 1 + " ";
				}
			}
		}
		if(single_count + multiple_count > 20){
				document.getElementById("count").innerHTML = "您还有20道以上的题目未作答";
				reminder_single.innerHTML = "";
				reminder_multiple.innerHTML = "";
			}else if (single_count != 0 && multiple_count != 0) {
				document.getElementById("count").innerHTML = 
								"你还有" + single_count + "道单选题," + multiple_count + "道多选题未作答";
		}else if(single_count != 0) {
			document.getElementById("count").innerHTML = "你还有" + single_count + "道单选题未作答";
		}else if (multiple_count != 0) {
			document.getElementById("count").innerHTML = "你还有" + multiple_count + "道多选题未作答";
		}else{
			document.getElementById("count").innerHTML = "试题已全部答完"
		}
	});
});