<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%request.setAttribute("contextPath", request.getContextPath());%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/main.css">	  
<link rel="stylesheet" type="text/css" href="${contextPath}/css/mail.css">
<script src='${contextPath}/fullcalendar/jquery.min.js'></script>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<%--  <script type="text/javascript" src = "${contextPath}/js/mail.js"></script> --%>

<title>E-Mail 지운편지함</title>
</head>
<%-- <script type="text/javascript" src = "${contextPath}/js/main.js"></script> --%>
<script type="text/javascript" src = "${contextPath}/js/emptyMail.js"></script>
<script type="text/javascript" src = "${contextPath}/js/deleteAll.js"></script>
<body>
<jsp:include page="/jsp/pageHeader.jsp"></jsp:include>
<!-------------------------------------헤더--------------------------------------------------------->
		<div id="content">
			<input type="hidden" value="${contextPath}" id="context">
		<jsp:include page="/jsp/pageSide.jsp">
			<jsp:param value="mail" name="category"/>
		</jsp:include>
			<div id="menuBox2">
			<p style="margin:20px">
				<a href="${contextPath}/mail/mail_deleteInbox_form" style="font-size: 20px;">지운편지함</a>
				
				
			</p>
			<hr id="hr3">
			<div id="button_delete">
			<form action="" method="post">
			<c:forEach items="${viewData.deleteList}" var="box">	
				<input type="hidden" value="${box.mailstatus}" name="mailstatus" id="mailstatus" >
		 		<input type="hidden" value="${box.mailNo}" name="mailNo" id="mailNo" >
		 		<input type="hidden" value="${box.mailNo}-${box.my}" name="mailNo_my" id="mailNo_my" > 	
         		<input type="hidden" value="${box.my}" name="my" id="my">
			</c:forEach>
         		<input type = "hidden" name = "senderId" value = "${user.empNo}" id="senderId">
				<table>
				<tr>
				<th>보낸사람/받는사람</th>
				<th>제목</th>
				<th>작성일</th>
				<th><input type="checkbox" name="allCheck" id="allCheck"></th>
				</tr>
				<c:forEach items="${viewData.deleteList}" var="deleteInbox">
				<tr>
					<td>${deleteInbox.empName}</td>
					<c:choose>
					<c:when test="${deleteInbox.mailstatus eq '13'}">
					<td><a href="mail_deleteInboxReceivemail_view_form?mailNo=${deleteInbox.mailNo}">${deleteInbox.title}</a></td>
					</c:when>
					<c:when test="${deleteInbox.mailstatus eq '14'}">
					<td><a href="mail_deleteInboxCarbonmail_view_form?mailNo=${deleteInbox.mailNo}">${deleteInbox.title}</a></td>
					</c:when>
					<c:when test="${deleteInbox.mailstatus eq '7'}">
					<td><a href="mail_deleteInboxMymail_view_form?mailNo=${deleteInbox.mailNo}">${deleteInbox.title}</a></td>
					</c:when>
					<c:when test="${deleteInbox.mailstatus eq '8'}">
					<td><a href="mail_deleteInboxMyDraft_view_form?mailNo=${deleteInbox.mailNo}">${deleteInbox.title}</a></td>
					</c:when>
					<c:when test="${deleteInbox.mailstatus eq '9'}">
					<td><a href="mail_deleteInboxDraft_view_form?mailNo=${deleteInbox.mailNo}">${deleteInbox.title}</a></td>
					</c:when>
					<c:otherwise>
					<td><a href="mail_deleteInbox_view_form?mailNo=${deleteInbox.mailNo}">${deleteInbox.title}</a></td>
					</c:otherwise>
					</c:choose>
					<td>${deleteInbox.writeDate}</td>
					<td><input type="checkbox" name="checkbox" value="${deleteInbox.mailNo}-${deleteInbox.my}" ></td>
				</tr>
			</c:forEach>
				</table>
				<input type="button" name="삭제" value="삭제" id="mail_delete_send" class="mail_delete">
			<br>
			</form>
			</div>
			<div id="rnum">	
				<table>
				<tr style="border-bottom: solid 0px gainsboro;">
				<td colspan="5"style="padding: 5px;font-size:16px;"><c:if test="${viewData.startPage !=1 }">
						<a href="mail_deleteInbox_form?page=1
							<c:if test="${viewData.type != null}">&type=${viewData.type}</c:if>
							<c:if test="${viewData.keyword != null}">&keyword=${viewData.keyword}</c:if>
						">[처음]</a>
						<a href="mail_deleteInbox_form?page=${viewData.startPage-1}
							<c:if test="${viewData.type != null}">&type=${viewData.type}</c:if>
							<c:if test="${viewData.keyword != null}">&keyword=${viewData.keyword}</c:if>
						">[이전]</a>
					</c:if> <c:forEach var="pageNum" begin="${viewData.startPage}"
						end="${viewData.endPage < viewData.pageTotalCount ? viewData.endPage : viewData.pageTotalCount}">
						<c:choose>
							<c:when test="${pageNum == viewData.currentPage}">
								<b id="pageNum">${pageNum}</b>
							</c:when>
							<c:otherwise>
								<a href="mail_deleteInbox_form?page=${pageNum}
									<c:if test="${viewData.type != null}">&type=${viewData.type}</c:if>
									<c:if test="${viewData.keyword != null}">&keyword=${viewData.keyword}</c:if>
								">${pageNum}</a>
							</c:otherwise>
						</c:choose>

					</c:forEach> <c:if test="${viewData.endPage < viewData.pageTotalCount}">
						<a href="mail_deleteInbox_form?page=${viewData.endPage+1}
							<c:if test="${viewData.type != null}">&type=${viewData.type}</c:if>
							<c:if test="${viewData.keyword != null}">&keyword=${viewData.keyword}</c:if>
						">[다음]</a>
						<a href="mail_deleteInbox_form?page=${viewData.pageTotalCount}
							<c:if test="${viewData.type != null}">&type=${viewData.type}</c:if>
							<c:if test="${viewData.keyword != null}">&keyword=${viewData.keyword}</c:if>
						">[마지막]</a>
					</c:if></td>
			</tr>
			</table>
			</div>
				<br>
				<br>
				<div id="search_id">
				<form action="mail_deleteInbox_form">
				<select name="type" id="search_id2">
    			<option value="1">제목</option>
    			<option value="2">보낸이</option>
<!--     			<option value="3">제목+보낸이</option> -->
    			<option value="3">날짜</option>
				</select>
				<input type="text" name="keyword" id="input_text">
				<input type="submit" id="sch_smit">
				</form>	
		</div>
		</div>
		</div>
		
	<!-------------------------------------바디---------------------------------------------------------------------------->
	
</body>
</html>