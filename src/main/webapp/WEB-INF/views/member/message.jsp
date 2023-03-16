<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String regi = (String) request.getAttribute("message");
if (regi != null && !regi.equals("")) {
	if (regi.equals("MEMBER_ADD_YES")) {
	%>
	<script type="text/javascript">
		alert("성공적으로 가입되었습니다. 로그인해주십시오");
		location.href = "login.do";
	</script>
	<%
	} else {
	%>
	<script type="text/javascript">
		alert("가입되지 않았습니다. 다시 가입해 주십시오");
		location.href = "regi.do";
	</script>
	<%
	}
}

%>
