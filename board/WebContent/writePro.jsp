<%@page import="board.BoardDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDBBean" %>

<%	request.setCharacterEncoding("utf-8"); %>  

<jsp:useBean id="board" class="board.BoardDataBean"/>
<jsp:setProperty property="*" name="board"/> 

<%
	board.setIp(request.getRemoteAddr());
	
	BoardDBBean manager = BoardDBBean.getInstance();
	int result = manager.insert(board);

	if(result == 1){
%> 
		<script>
			alert("글작성 성공");
			location.href="list.jsp";
		</script>

<%	}else{ %>
		<script>
			alert("글작성 실패");
			history.go(-1);
		</script>
<%	} %>


