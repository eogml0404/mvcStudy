<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import ="app.dao.MemberDao" %>   
<jsp:useBean id="mv" class="app.domain.MemberVo" scope="page" />


<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
%>

<!--넘어오는 모든 매개변수(파라미터)값을 MemberVo 객체변수에 바인딩한다  -->
<jsp:setProperty property="*" name="mv"/>

<%
MemberDao md = new MemberDao();
//데이터를 넘겨주면 요청 객체는 그 값을 받아서 넘어온 매개변수에
//담긴 값을 꺼내서 새로운 변수에 담는다
//String memberId = request.getParameter("memberId");
//String memberPwd = request.getParameter("memberPwd");
out.println("빈의 아이디" + mv.getMemberId());

//out.println(memberId +" "+ memberPwd);

//이 페이지 용도 및 목적
//아이디와 비밀번호를 넘겨 받아서 맞으면 새로운 페이지로 이동
//틀리면 입력페이지로 간다.

int value = md.memberLoginCheck(mv.getMemberId(),mv.getMemberPwd());

if(value==1){
	//일치하면
	response.sendRedirect("/jspStudy0803/index.jsp");
	
}else{
	
	//틀리면 다시 입력페이지로
	response.sendRedirect("./memberLogin.html");
}

//쿼리를 실행시키는 객체반환 사용
//stmt 객체 사용
//Statement stmt = conn.createStatement();
//String sql = "insert into member0803(midx,memberid,memberpwd,membername,memberbirth,membergender,memberphone,memberemail,memberaddr,memberhobby)"
//           +" values(midx_seq.nextval,'"+memberId+"','"+memberPwd+"','"+memberName+"','"+memberBirth+"','"+memberGender+"','"+memberPhone+"','"+memberEmail+"','"+memberAddr+"','"+str+"')";



//System.out.println(sql);
//boolean tf = stmt.execute(sql); //해당구문(쿼리) 실행시킨다
//System.out.println(tf);
%>




<!--     
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입처리</title>
</head>
<body>
아이디 : <%// out.println(memberId); %><br> 
비밀번호 : <%//=memberPwd %><br>
이름 : <%//=memberName %><br>
생년월일 : <%//=memberYear %>/<%//=memberMonth %>/<%//=memberDay %><br>
성별 : <%//=memberGender %><br>
핸드폰 : <%//=memberPhone %><br>
이메일 :  <%//=memberEmail %><br>
취미 :  <%//=str %><br>
</body>
</html>
-->