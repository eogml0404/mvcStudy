<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList" %> 
<%@ page import="app.domain.*" %>   
<% 
  ArrayList<BoardVo> list = (ArrayList<BoardVo>)request.getAttribute("alist");
  PageMaker pm = (PageMaker)request.getAttribute("pm");
  //System.out.println("pm값은"+pm.getStartPage());	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시글목록</title>
<link href="./css/board.css" type="text/css" rel="stylesheet">
</head>
<body>
<h1>게시판 목록</h1>
<form name="frm" 
action="<%=request.getContextPath()%>/board/boardList.do"
method="post">
<table border=0 style="width:600px">
<tr>
<td style="width:500px"></td>
<td>
<select name="searchType">
<option value="subject">제목</option>
<option value="writer">작성자</option>
</select>
</td>
<td><input type="text" name="keyword" size=10></td>
<td><input type="submit" name="sbt" value="검색"></td>
</tr>
</table>
</form>
<table border=1 style="width:600px">	
<thead>
		<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성일</th>
		</tr>
</thead>
<tbody>	
		<% for (BoardVo bv : list) {%>	
		<tr>
		<td><%=bv.getBidx() %></td>
		<td class="subject">
		<% for(int i=1;i<=bv.getLevel_();i++){
			
				//레벨에 따라 띄어쓰기
				out.print("&nbsp;&nbsp;");
			
				if(i == bv.getLevel_()){
					
					out.print("ㄴ");
					
				}
			
			
			}	%>
		
		
		<a href="<%=request.getContextPath()%>/board/boardContents.do?bidx=<%=bv.getBidx() %>">
		<%=bv.getSubject() %>
		</a>		
		</td>
		<td><%=bv.getWriter() %></td>
		<td><%=bv.getViewcnt() %></td>
		<td><%=bv.getWriteday() %></td>
		</tr>	
		<% } %>	
			
</tbody>		
</table>
<% 
String parameter ="";
if (!pm.getScri().getKeyword().equals("")){
	parameter = "&searchType="+pm.getScri().getSearchType()+"&keyword="+pm.getScri().getKeyword()+"";
}

%>
<table border=0 style="width:600px;text-align:center;">
<tr>
<td style="width:100px;text-align:right;">
<% if (pm.isPrev()==true) { %>
<a href="<%=request.getContextPath()%>/board/boardList.do?page=<%=pm.getStartPage()-1%><%=parameter%>">
◀
</a>
<%} %>
</td>
<td> 
<% 
for(int i=pm.getStartPage();i<=pm.getEndPage();i++){
%>
<a href="<%=request.getContextPath()%>/board/boardList.do?page=<%=i%><%=parameter%>"><%=i%></a> &nbsp;
<%		
} 
%>

</td>
<td style="width:100px;text-align:left;">
<% if(pm.isNext() ==true && pm.getEndPage()>0){ %>
<a href="<%=request.getContextPath()%>/board/boardList.do?page=<%=pm.getEndPage()+1%><%=parameter%>">
▶
</a>
<%} %>
</td>
</tr>
</table>

<a href="<%=request.getContextPath()%>/board/boardWrite.do">글쓰기</a>

</body>
</html>