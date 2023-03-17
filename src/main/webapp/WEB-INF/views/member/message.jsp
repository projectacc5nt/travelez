<%@page import="com.travelez.app.member.dto.MemberDto"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String message = (String) request.getAttribute("message");
MemberDto userInfo = (MemberDto) request.getAttribute("userInfo");

if (message != null && !message.equals("")) {
	if (message.equals("MEMBER_ADD_YES")) {
	%>
	<script type="text/javascript">
		alert("성공적으로 가입되었습니다. 로그인해주십시오");
		location.href = "login.do";
	</script>
	<%
	} else if (message.equals("MEMBER_ADD_NO")){
	%>
	<script type="text/javascript">
		alert("가입되지 않았습니다. 다시 가입해 주십시오");
		location.href = "regi.do";
	</script>
	<%
	}else if (message.equals("MEMBER_UPDATE_YES")) {
	%>
		<script type="text/javascript">
			alert("수정되었습니다.");
			
			location.href = "mypage.do?teId=<%=userInfo.getTeId() %>";
		</script>
		<%
	} else if (message.equals("MEMBER_UPDATE_NO")){
	%>
	<script type="text/javascript">
		alert("수정에 실패하였습니다.");
		
		location.href = "mypage.do?teId=<%=userInfo.getTeId() %>";
	</script>
	<%
	}else if (message.equals("UNREGI_YES")) {
	%>
		<script type="text/javascript">
			alert("회원탈퇴되었습니다.");
			
			location.href = "home.do";
		</script>
		<%
	} else if (message.equals("UNREGI_NO")){
	%>
	<script type="text/javascript">
		alert("아이디와 비밀번호가 일치하지 않습니다.");
		location.href = "home.do";
	</script>
	<%
	}else if (message.equals("UPDATEPWD_YES")) {
	%>
		<script type="text/javascript">
			alert("비밀번호가 변경되었습니다. 다시 로그인해주십시오.");
			
			location.href = "home.do";
		</script>
		<%
	} else if (message.equals("UPDATEPWD_NO")){
	%>
	<script type="text/javascript">
		alert("비밀번호변경에 실패하였습니다.");
		location.href = "home.do";
	</script>
	<%
	}
}
%>
