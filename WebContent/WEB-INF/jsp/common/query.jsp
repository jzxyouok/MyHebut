<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--  页码及翻页信息 -->
<div id="dataPage" style="display:inline;float:right;" >

	<c:if test="${page_now != 1}">
		<a href="#" onclick="turnToPage(1);">首页 </a>
		<a href="#" onclick="turnToPage(${page_now - 1})">上一页 </a>
	</c:if>
	<c:if test="${page_now >= 1 && page_now <= 4}">
        <c:forEach varStatus="page" begin="1" end="10">
             <a href="#" onclick="turnToPage(${page.current})">${page.current}</a>&nbsp;	
        </c:forEach>
	</c:if>
	<c:if test="${page_now <= page_num && page_now >= page_num - 4}">
        <c:forEach varStatus="page" begin="${page_num - 9}" end="${page_num}">
             <a href="#" onclick="turnToPage(${page.current})">${page.current}</a>&nbsp;	
        </c:forEach>
	</c:if>
	<c:if test="${page_now < page_num - 4 && page_now > 4}">
        <c:forEach varStatus="page" begin="${page_now - 4}" end="${page_now + 5}">
             <a href="#" onclick="turnToPage(${page.current})">${page.current}</a>&nbsp;	
        </c:forEach>
	</c:if>
	<c:if test="${page_now != page_num}">
        <a href="#" onclick="turnToPage(${page_now + 1})">下一页 </a>
		<a href="#" onclick="turnToPage(${page_num})">尾页</a>&nbsp;
	</c:if>
	共${page_num}页,跳到 <input id="page_show" type="text" maxlength="10" size="10" style="width: 35px" value="${page_now}" onkeypress="this.value=this.value.replace(/\D/g,'')" onchange="this.value=this.value.replace(/\D/g,'')" /> 页 
	<input type="button" value="确定" class="unity-button on" style="width: 56px;" onclick="formSubmit(${page_num});" />

</div>
<!--  页码及翻页信息结束 -->