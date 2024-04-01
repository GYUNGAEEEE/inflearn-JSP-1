<%@page import="model.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<center>
<h2> 전체 게시글 보기 </h2>
<!-- 게시글 보기에 카운터링을 설정하기위한 변수들을 선언 -->
<%
	//화면에 보여질 게시글의 개수를 지정
	int pageSize = 10;

	//현재 카운터를 클릭한 번호값을 읽어옴
	String pageNum = request.getParameter("pageNum");
	
	//만약 처음 boardList.jsp를 클릭하거나 수정, 삭제 등 다른 게시글에서 이 페이지로 넘어오면 pageNum값이 없기에 null 처리를 해줌
	if(pageNum == null) {
		pageNum = "1";
	}
	int count = 0; //전체 글의 갯수를 저장하는 변수
	int number = 0; //페이지 넘버링 변수
	//현재 보고자 하는 페이지 숫자를 저장
	int currentPage = Integer.parseInt(pageNum);
	
	//전체 게시글의 내용을 jsp쪽으로 가져와야 함
	BoardDAO bdao = new BoardDAO();

	//전체 게시글을 리턴 받아주는 소스
	Vector<BoardBean> vec = bdao.getAllBoard();
%>
<table width="700" border="1" bgcolor="skyblue">
	<tr height="40">
		<td align="right" colspan="5">
			<input type="button" value="글쓰기" onclick="location.href='BoardWriteForm.jsp'"/>
		</td>
	</tr>
	<tr height="40">
		<td width="50" align="center"> 번호 </td>
		<td width="320" align="center"> 제목 </td>
		<td width="100" align="center"> 작성자 </td>
		<td width="150" align="center"> 작성일 </td>
		<td width="80" align="center"> 조회수 </td>
	</tr>
<%
	for(int i = 0; i < vec.size(); i++) {
		BoardBean bean = vec.get(i); //벡터에 저장되어있는 빈클래스를 하나씩 추출
%>
	<tr height="40">
		<td width="50" align="center"> <%=i+1 %> </td>
		<td width="320" align="left "> <a href="BoardInfo.jsp?num=<%=bean.getNum() %>" style="text-decoration: none">
		<%
			if(bean.getRe_step() > 1) {
				for(int j = 0; j < (bean.getRe_step() - 1) * 5; j++) {
		%>
				&nbsp;
		<% 
				}
			}
		%>
		<%=bean.getSubject() %></a> </td>
		<td width="100" align="center"> <%=bean.getWriter() %> </td>
		<td width="150" align="center"> <%=bean.getReg_date() %> </td>
		<td width="80" align="center"> <%=bean.getReadcount() %> </td>
	</tr>
<% 
	}
%>

</table>
</center>

</body>
</html>