﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="${contextPath}/js/boardFileBox.js"></script>
<script type="text/javascript" src="${contextPath}/js/boardSubMenu.js"></script>
<script type="text/javascript" src="${contextPath}/js/boardDeptAuth.js"></script>
<script type="text/javascript" src="${contextPath}/js/boardComment.js"></script>
<script type="text/javascript" src="${contextPath}/js/fileDown.js"></script>
<script type="text/javascript" src="${contextPath}/js/boardOpenWin.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;subset=korean" rel="stylesheet">
<title>익명게시글 상세보기</title>
</head>
<body>
	<jsp:include page="/jsp/pageHeader.jsp" flush="false" />
	<!-------------------------------------헤더--------------------------------------------------------->
	<input type="hidden" id="path" value="${contextPath}">
	<div id="content">

		<input type="hidden" value="anonymity" id="boardName">
		<input type="hidden" value="Anonymity" id="boardName1">

		<jsp:include page="/jsp/pageSide.jsp">
			<jsp:param value="board" name="category"/>
		</jsp:include>
		
		<input type="hidden" value="${user.deptNo}" id="inputDeptNo">
		<input type="hidden" value="${user.empPos}" id="inputEmpPos">
		
		<div id="menuBox2" style="overflow: auto;">

			<p style="margin: 20px">
				<a href="#" style="font-size: 20px">익명게시판</a>
			</p>
			
			
			<hr id="hr3" style="margin-bottom: 5px;">
			<p style="width: 750px">
				<a href="#" style="font-size: 17px; padding-left: 5p">익명게시글</a> <span
					style="float: right;"> <input type="button" id="deleteBtn"
					value="삭제하기"
					onclick="open_win('${contextPath}/board/boardAnonymityCheckPassForm?boardNo=${anonymity.boardNo}','delete')">
					<input type="button" id="updateBtn" value="수정하기"
					onclick="open_win('${contextPath}/board/boardAnonymityCheckPassForm?boardNo=${anonymity.boardNo}','update')">
					<input type="button" id="listBtn" value="목록보기"
					onclick="location.href='boardAnonymity'">
				</span>
			</p>

			<div id="viewBox">
				<div id="viewBoxTitle">
					<h3 style="margin-bottom: 3px; margin-left: 10px; margin-top: 10px;">${anonymity.title}</h3>
					
					<input type="hidden" value="${anonymity.boardNo}" id="boardNoinput">
					
					<ul>
						<li name="EMPNAME">${anonymity.writer}</li>
						<li name="WRITEDATE">${anonymity.writeDate}</li>
						<li name="VIEWCOUNT" style="border-right: 0">조회수 ${anonymity.viewCount}</li>
					</ul>
				</div>

				<div style="padding-top: 15px; padding-left: 15px; padding-right: 15px; font-size: 15px; overflow: auto;" name="CONTENT" id="viewBoxContent">
					${anonymity.content}
				</div>
				
				<span>
					<a href="#" id="more1" onclick="createModal()">첨부파일</a>
				</span>
				
				<div id="fileModal" style="display: none;"></div>

				<span style="float: right;"> <a href="#" id="more"
					onclick="if(commentBox.style.display=='none') {commentBox.style.display='block';more.innerText='>접기';commentBox.style.height='auto'} else {commentBox.style.display='none';more.innerText='>댓글'}">
						>댓글</a>
				</span>

				<div id="commentBox"
					style="display: none; padding-top: 5px; padding-bottom: 5px; background-color: #f8f8f8">

					<div style="width: 750px; margin: 0 auto">
						<ul id="comments" style="font-size: 12px">
						</ul>
					</div>

					<div id="modal-modify" style="display: none;">

						<div>
							<textarea id="modal-commentContent"
								style="font-size: 11px; width: 200px"></textarea>
						</div>

						<div style="text-align: right;">
							<input type="button" id="btn-commentModify" value="수정"
								style="font-size: 10px;"> <input type="button"
								id="btn-commentDelete" value="삭제" style="font-size: 10px;">
							<input type="button" id="btn-close" value="닫기"
								style="font-size: 11px;">
						</div>

					</div>

					<form name="commentForm" id="commentForm" style="width: 750ㅔㅌ;">
						<div id="cmtWrapBox"
							style="border: 2px solid silver; padding-right: 0; padding-left: 0; padding: 5px; width: 750px; margin: 0 auto; background-color: white; position: relative;">
							<div id="cmtNameBox">
								<b style="font-size: 11px; margin-left: 20px;">작성자:</b><input
									type="text" style="border: white; font-size: 11px"
									id="commentWriter" name="writer" value="익명" readonly="readonly">
							</div>
							<div id="cmtContentBox">
								<textarea style="width: 700px; height: 50px; margin-left: 20px;"
									name="content" placeholder="댓글을 입력해 주세요." cols="200" rows="20"
									id="commentContent"></textarea>
							</div>
							<div style="padding-top: 5px" id="cmtSubmitBox">
								<input type="submit" style="margin-left: 690px;" value="등록">
							</div>
						</div>
					</form>

				</div>


				<div style="display: inline-block;">
					<dl id="dl1">
						<dt id="dt1">이전글</dt>
						<dd style="height: 21px;" id="dd1">
							<c:choose>
								<c:when test="${previous.boardNo != null}">
									<a style="margin-left: 10px;"
										href="${contextPath}/board/boardAnonymityViewForm?boardNo=${previous.boardNo}">${previous.title}</a>
								</c:when>
								<c:otherwise>
									<a style="margin-left: 10px; font-size: 13px">이전글이 없습니다.</a>
								</c:otherwise>
							</c:choose>
						</dd>
						<dt id="dt2">다음글</dt>
						<dd style="height: 21px;" id="dd2">  
							<c:choose>
								<c:when test="${next.boardNo != null}">
									<a style="margin-left: 10px; font-size: 13px"
										href="${contextPath}/board/boardAnonymityViewForm?boardNo=${next.boardNo}">${next.title}</a>
								</c:when>
								<c:otherwise>
									<a style="margin-left: 10px; font-size: 13px">다음글이 없습니다.</a>
								</c:otherwise>
							</c:choose>
						</dd>
					</dl>
				</div>

			</div>

		</div>


	</div>
	<!-------------------------------------바디--------------------------------------------------------->
	<!-------------------------------------푸터--------------------------------------------------------->

</body>
</html>

