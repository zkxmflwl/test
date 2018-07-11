<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDBBean" %>
<%@ page import="board.BoardDataBean" %>

<%	request.setCharacterEncoding("utf-8"); %>  

<jsp:useBean id="board" class="board.BoardDataBean"/>
<jsp:setProperty property="*" name="board"/> 

<%
int num = Integer.parseInt(request.getParameter("num"));
String pg = request.getParameter("page");

	BoardDBBean manager = BoardDBBean.getInstance();
	BoardDataBean old = manager.getContent(board.getNum());
	
	
	
	if (board.getPasswd().equals(old.getPasswd())){
		 manager.delete(board);
		%>
		<script>
			alert("글삭제성공");
			location.href="list.jsp?page=<%=pg%>"; 
		</script>
		

<%	}else{ %>
		<script>
			alert("비밀번호 확인")
			history.go(-1);
		</script>
		
<%	}%>


