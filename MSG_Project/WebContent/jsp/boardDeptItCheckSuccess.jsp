<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	//비밀번호가 맞았을 때, 
	// update : 팝업화면에서 계속 요청진행이 아니라 큰화면에서 요청을 진행 하도록 하는 기능
	//delete : 삭제요청 만들면됨
	if(window.name=="update"){
		window.opener.parent.location.href="boardDeptItModifyForm?boardNo=${it.boardNo}";
	}else if(window.name=="delete"){
		window.opener.parent.location.href="boardDeptItDelete?boardNo=${it.boardNo}";
	}
	
	
	window.close();	
	
	
</script>