<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Permanent+Marker&family=Single+Day&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style>
    body * {
        font-family: 'Jua';
    }
</style>
</head>
<%
	//post 방식은 일단 한글 엔코딩부터
	request.setCharacterEncoding("utf-8");
	
	//선택을 안할경우 null 값을 반환
	//선택을 할경우에만 문자열배열값을 반환
	String []lang=request.getParameterValues("lang");
	String []hobby=request.getParameterValues("hobby");
%>
<body>
<h5>
	구현 가능 언어 갯수 : <%=lang==null?0:lang.length %><br>
	<%
	if(lang!=null){
		for(String it:lang){%>
			<b style="margin-left: 100PX;COLOR:red;"><%=it%></b><br>
		<%}
	} %>
	<hr>
	선택한 취미 갯수 : <%=hobby==null?0:hobby.length %><br>
	<%
	if(hobby!=null){
		for(String h:hobby){%>
			<b style="margin-left: 100PX;COLOR:green;"><%=h%></b><br>
		<%}
	} %>
</h5>
</body>
</html>















