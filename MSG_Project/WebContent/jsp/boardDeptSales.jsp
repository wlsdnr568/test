<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%request.setAttribute("contextPath", request.getContextPath());%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous">
</script> 

<link rel="stylesheet" type="text/css" href="${contextPath}/css/board.css">
<script type="text/javascript" src="${contextPath}/js/boardSubMenu.js"></script>
<script type="text/javascript" src="${contextPath}/js/boardDeptAuth.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;subset=korean" rel="stylesheet">
<title>영업부 게시판</title>
</head>

<body>
		<jsp:include page="/jsp/pageHeader.jsp" flush="false"/>
		<!-------------------------------------헤더--------------------------------------------------------->
		<input type = "hidden" id = "path" value = "${contextPath}">
		<div id="content">
			
			<jsp:include page="/jsp/pageSide.jsp">
				<jsp:param value="board" name="category"/>
			</jsp:include>
			
			<input type="hidden" value="${user.deptNo}" id="inputDeptNo">
			<input type="hidden" value="${user.empPos}" id="inputEmpPos">

			<div id="menuBox2" style="width: 750px">
				<p style="margin: 20px">
					<a href="#" style="font-size: 20px">부서 게시판</a>
					
				</p>
				
				<hr id="hr3" style="margin-bottom: 5px">
				
				<p>
					<a href="#" style="font-size: 17px;;padding-left: 5px">영업부 게시판</a>
					<button id="writeBtn" style="float: right;" onclick="location.href='boardDeptSalesWriteForm'">글쓰기</button>
				</p>
				
				<div id="noticeBox" style="margin-top: 5px;">
						
					<ul>
						<c:forEach items="${noticeOfSales.salesboardListE}" var="salesE">
							
								<li class="noticeBoxLi" style="padding:19px 6px">
							
									<div>
										<strong style="color: red; font-size: 15px" id="strong1">공지</strong>
										
										<ul id="noticeBoxUl1" style="margin-top: 20px;">
											<li style="font-size: 13px" id="li1">${salesE.empName}</li>
											<li style="font-size: 13px" id="li2">${salesE.writeDate1}</li>
											<li style="font-size: 13px" id="li3">조회수 ${salesE.viewCount}</li>
										</ul>
									</div>
									
									<p style="margin-top: 3px;">
										<a style="font-size: 18px;padding-left: 17px" href="${contextPath}/board/boardDeptSalesViewForm?boardNo=${salesE.boardNo}" name="TITLE">${salesE.title}</a>
									</p>
									
								</li>
									
							</c:forEach>
						<c:forEach items="${viewData.salesboardList}" var="sales">
							<li class="noticeBoxLi" style="padding:19px 6px">
								
								<div>
									<strong style="color: black; font-size: 15px" id="strong1">일반</strong>
									<strong style="font-size: 15px" id="strong2" name="BOARDNO">${sales.boardNo}</strong>
									
									<ul id="noticeBoxUl1" style="margin-top: 20px;">
										<li style="font-size: 13px" id="li1" name="WRITER">${sales.empName}</li>
										<li style="font-size: 13px" id="li2" name="WRITEDATE">${sales.writeDate1}</li>
										<li style="font-size: 13px" id="li3" name="VIEWCOUNT">조회수 ${sales.viewCount}</li>
									</ul>
								</div>
								
								<p style="margin-top: 3px;">
									<a style="font-size: 18px;padding-left: 17px" href="${contextPath}/board/boardDeptSalesViewForm?boardNo=${sales.boardNo}" name="title">${sales.title}</a>
								</p>
							</li>
						</c:forEach>
					
					</ul>
					
				</div>
				
				
			<hr id="hr4" style="margin-top: 850px;">
			
			<div style="text-align: center;">
		
			<c:if test="${viewData.startPage !=1 }">
				<a style="font-weight: normal;" href="boardDeptSales?page=1">[처음]</a>
				<a style="font-weight: normal" href="boardDeptSales?page=${viewData.startPage-1}">[이전]</a>
			</c:if>
			
			<c:forEach var="pageNum" begin="${viewData.startPage}" end="${viewData.endPage < viewData.pageTotalCount ? viewData.endPage : viewData.pageTotalCount}">
				<c:choose>
					<c:when test="${pageNum == viewData.currentPage}">
						<b>[${pageNum}]</b>
					</c:when>
					<c:otherwise>
						<a style="font-weight: normal;" href="boardDeptSales?page=${pageNum}">[${pageNum}]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:if test="${viewData.endPage < viewData.pageTotalCount}">
				<a style="font-weight: normal;" href="boardDeptSales?page=${viewData.endPage+1}">[다음]</a>
				<a style="font-weight: normal;" href="boardDeptSales?page=${viewData.pageTotalCount}">[마지막]</a>
			</c:if>
				
			</div>
			
			<form action="" style="text-align: center; margin-top: 40px; margin-bottom: 100px">
				<select name="type">
					<option value="1">제목</option>
					<option value="2">작성자</option>
					<option value="3">제목+작성자</option>
					<option value="4">내용</option>
				</select> 
				<input type="text" name="keyword">
				<input id="searchBtn" type="submit" value="검색">
			</form>
			
			</div>
		
		</div>
		<!-------------------------------------바디--------------------------------------------------------->
<%-- 		<jsp:include page="/jsp/pageFooter.jsp" flush="false"/> --%>
		<!-------------------------------------푸터--------------------------------------------------------->

</body>
</html>

