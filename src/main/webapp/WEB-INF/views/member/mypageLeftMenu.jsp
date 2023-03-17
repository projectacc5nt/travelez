<%@page import="com.travelez.app.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	MemberDto login = (MemberDto)session.getAttribute("login");
	MemberDto dto = (MemberDto)request.getAttribute("userInfo");
%>
<div class="mypageSideMenu">
    <div class="userProfile">
        <img src="<%= dto.getTeProfile() %>" alt="">
        <p><%=login.getTeId() %></p>
    </div>
    <div class="sideMenu">
        <a href="#none" id="myProfile">나의 프로필</a>
        <!-- <a href="#none" id="mySchedule">나의 일정</a> -->
    </div>
    <a href="unRegi.do" class="unRegi">회원탈퇴 ></a>
</div>

<!-- <script>
	$("#myProfile").click(function){
		
	}
</script> -->