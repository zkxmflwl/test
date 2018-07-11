<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="color.jsp"%>
<%@ page import="board.BoardDataBean" %>
<%@ page import="board.BoardDBBean" %>
<%  
	int num = Integer.parseInt(request.getParameter("num"));
	String pg = request.getParameter("page");

 	BoardDBBean manager = BoardDBBean.getInstance();
 	BoardDataBean board = manager.getContent(num);

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
<form method="post" name="writeform" action="updatePro.jsp">
<input type=hidden name=num value=<%=num %>>
<input type=hidden name=page value=<%=pg %>>

<table width="430" border="1" cellspacing="0" cellpadding="0"  bgcolor="<%=bodyback_c%>" align="center">
   <tr>
    <td align="right" colspan="2" bgcolor="<%=value_c%>">
	    <a href="list.jsp"> 글 수정</a> 
   </td>
   </tr>
   <tr>
    <td  width="100"  bgcolor="<%=value_c%>" align="center">이 름</td>
    <td  width="330">
       <input type="text" size="10" maxlength="10" id="writer" name="writer" value=<%=board.getWriter() %>></td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>" align="center" >제 목</td>
    <td  width="330">    
       <input type="text" size="40" maxlength="50" id="subject" name="subject" value=<%=board.getSubject()%>></td>	
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>" align="center">Email</td>
    <td  width="330">
       <input type="text" size="40" maxlength="30" id="email" name="email"  value=<%=board.getEmail()%>></td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>" align="center" >내 용</td>
    <td  width="330" >
     <textarea id="content" name="content" rows="13" cols="40" ><%=board.getContent()%></textarea> </td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>" align="center" >비밀번호</td>
    <td  width="330" >
     <input type="password" size="8" maxlength="12" id="passwd" name="passwd"> 
	 </td>
  </tr>
<tr>      
 <td colspan=2 bgcolor="<%=value_c%>" align="center"> 
  <input type="submit" value="글 수정" >  
  <input type="reset" value="다시작성">
  <input type="button" value="목록보기" OnClick="window.location='list.jsp?page=<%=pg%>'">
</td></tr></table>    
   
</form>      
</body>
</html>
