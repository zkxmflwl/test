<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="board.BoardDataBean" %>
<%@ page import="board.BoardDBBean" %>
<%@ page import="java.text.SimpleDateFormat"%>
 <%
 int num = Integer.parseInt(request.getParameter("num"));
 String pg = request.getParameter("page");
 
 BoardDBBean manager = BoardDBBean.getInstance();
 BoardDataBean board = manager.updateCount(num);
 
 SimpleDateFormat sdt = new SimpleDateFormat("yyyy-MM-dd hh:mm");
 
 %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>상세 페이지</title>
</head>
<body>
<%=board %>
 <table style="margin : 0 auto; " border=1 >
 <tr>
 <tr><td>번호</td>
		<td><%=board.getNum() %></td>
		<td>조회수</td>
		<td><%=board.getReadcount() %></td>
	</tr>
	<tr><td>작성자</td>
		<td><%=board.getWriter() %></td>
		<td>작성일</td>
		<td><%=sdt.format(board.getReg_date()) %></td>
	</tr>
	<tr><td>글제목</td>
		<td colspan=3><%=board.getSubject() %></td>
	</tr>
	<tr><td>글내용</td>
		<td colspan=3><pre><%=board.getContent() %></pre></td>
	</tr>
 </table>
 <center>
 <input type="button" value="글 수정" onClick="location.href='updateform.jsp?num=<%=num%>&page=<%=pg%>' ">
 <input type="button" value="글 삭제" onClick="location.href='deleteform.jsp?num=<%=num%>&page=<%=pg%>' ">
 <input type="button" value="글 목록" onClick="location.href='list.jsp?page=<%=pg%>' ">
 </center>
 </body>
</html>