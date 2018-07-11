<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="color.jsp"%>
<%@ page import="board.BoardDataBean" %>
<%@ page import="board.BoardDBBean" %>
<%  
	int num = Integer.parseInt(request.getParameter("num"));
	String pg = request.getParameter("page");

%>


<html>
<head>
	<title>게시판</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/check.js"></script>
</head>   

<body bgcolor="<%=bodyback_c%>">  
<center><b>글 수정</b>
<br>
<form method="post" name="writeform" action="deletePro.jsp">
<input type=hidden name=num value=<%=num %>>
<input type=hidden name=page value=<%=pg %>>

<table width="250" border="1" cellspacing="0" cellpadding="0"  bgcolor="<%=bodyback_c%>" align="center">
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>" align="center" >비밀번호</td>
    <td  width="150" >
     <input type="password" size="8" maxlength="12" id="passwd" name="passwd"> 
	 </td>
  </tr>
<tr>      
 <td colspan=2 bgcolor="<%=value_c%>" align="center"> 
  <input type="submit" value="글 삭제" >  
  <input type="button" value="취소" OnClick="window.location='content.jsp?page=<%=pg%>&num=<%=num%>' ">
</td></tr></table>    
   
</form>      
</body>
</html>
