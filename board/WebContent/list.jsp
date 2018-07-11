<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDataBean" %>
<%@ page import="board.BoardDBBean" %>
<%@ page import="java.util.List" %>
<% 
		//1. 한 화면에 출력할 데이터 갯수
		int page_size=20;

		//2. 현재 페이지 번호 설정
		String pageNum = request.getParameter("page");
		if(pageNum==null){
			pageNum="1";
		}
		//연산가능하게 현재 페이지 번호를 int형으로변환
		int currentPage = Integer.parseInt(pageNum);
		
		//각 페이지당 보여줄 데이터 rownumber 
		int startRow=(currentPage -1)*page_size+1;
		int endRow =currentPage*page_size;
		
		//3. 총 데이터 갯수 구하기
		int count = 0;
		BoardDBBean manager = BoardDBBean.getInstance();
		count = manager.getCount();
		//해당 페이지에 표시할 데이터 꺼내기
		List<BoardDataBean> list = null;
		if (count>0){
			list=manager.getList(startRow, endRow);
		}
		//작성일 포맷 변경
		SimpleDateFormat sdt = new SimpleDateFormat("yyyy-MM-dd hh:mm");

%>

<%-- count=<%=count%><br>
list=<%=list%> --%>

<%
		if (count==0){
%>
		저장된 글이 없습니다
		
		<% }else{
		
		%>
		<!-- 게시판 form작성 -->
		<Table align="center" width=700 border=1>
			<caption>게시판</caption>
			<Tr >
			<th>글 번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>IP주소</th>
			
			</Tr>	
			
			
			<!-- 게시판 form 내부 내용 작성 -->	
		<%
			int number =count-(currentPage-1)*page_size;
			for(int i=0; i<list.size(); i++){
				BoardDataBean db = list.get(i);
				
				%>
				<tr>
				<td><%=number-- %></td>
				<td>
					<A href="content.jsp?num=<%=db.getNum()%>&page=<%=pageNum%>">
					<%=db.getSubject() %></A></td>
				<td><%=db.getWriter()%></td>
				<td><%=sdt.format(db.getReg_date()) %></td>
				<td><%=db.getReadcount() %></td>
				<td><%=db.getIp() %></td>
				</tr>
			<%}//for문 끝
		%>
		
		
		</Table>
	<% } %>
	
<center>
	<%
	//페이지처리
	
	if (count>0){
		
		
		//pagecount=총 페이지 수
		int pageCount=(count/page_size)+((count%page_size==0)? 0: 1);
		//block_size : 한블럭에 표시할 페이지 수
		//startpage : 각 블럭의 시작 페이지 번호
		//endpage : 각 블럭의 끝 페이지 번호
		int block_size=10;
		int startPage =((currentPage-1)/block_size)*block_size+1;
		int endPage = (startPage)+block_size-1;
		if (endPage>pageCount){
			endPage=pageCount;
		}
		
		//이전 블록으로
		if(startPage>1){%>
			<a href="list.jsp?page=<%=startPage-10 %>">이전</a>	
		<% }		
		//for문으로 페이지블럭 출력
		for(int i = startPage; i<=endPage; i++){
			if(i==currentPage){%>
				
				[<%=i %>]
				
			<% }else{%>
			<a href="list.jsp?page=<%=i%>">[<%=i %>]</a>
				
		<%	}
			
		}//for문 종료
		
		//다음 블록으로
		if(endPage<pageCount){%>
		<a href="list.jsp?page=<%=startPage+10 %>">다음</a>	
	<% }		
	}//if문 종료%>
	
	<!-- 글쓰기버튼+글갯수 -->
	
	<hr>
	<input type=button onclick="location.href='writeForm.jsp' " value="글쓰기">
	글 갯수 : <%=count %><Br>
	
	</center>
	
	
	
	



