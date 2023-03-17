<%@page import="com.travelez.app.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴 | 여행이지</title>
    <link rel="stylesheet" href="../asset/css/reset.css">
    <link rel="stylesheet" href="../asset/css/common.css">
    <link rel="stylesheet" href="../asset/css/unRegi.css">
    <link rel="stylesheet" href="../asset/css/addClass.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
<% 
	MemberDto login = (MemberDto)session.getAttribute("login");
%>
	<jsp:include page="/WEB-INF/views/member/header.jsp"/>
	
	<div class="unRegiWrap">
	<form action="unRegiAf.do" method="post">
		<div class="unRegiBox" id="unRegiBox">
			<h2>회원탈퇴</h2>
			<input type="hidden" value="<%=login.getTeEmail()%>" name="teEmail">
			<div class="inputBox">
			    <span>아이디</span>
			    <input type="text" placeholder="아이디를 입력해주세요" name="teId" id="userId">
			</div>
			<div class="inputBox">
			    <span>비밀번호</span>
			    <input type="password" placeholder="비밀번호를 입력해주세요" name="tePwd" id="userPwd">
			</div>
			<button type="button" id="unRegi">회원탈퇴</button>
	   </div>
	   <div class="unRegiChk">
	   		<p>회원탈퇴를 하시겠습니까?<br><br>회원정보는 즉시 사라지며<br>복구할 수 없습니다.</p>
	   		<div class="unRegiChkBtn">
		   		<button type="submit" id="unRegiYes">네</button>
		   		<a href="home.do" id="unRegiNo">아니요</a>
	   		</div>
	   </div>
	   </form>
   </div>
   
   <jsp:include page="/WEB-INF/views/member/footer.jsp"/>
</body>

<script type="text/javascript">
	$(document).ready(function(){
		
		let userId = $("#userId");
		let userPwd = $("#userPwd");
		
		$("#unRegi").click(function(){
			if(userId.val() == ""){
				nullFalseChk(userId)
				return;
			} else if (userPwd.val() == ""){
				nullFalseChk(userPwd)
				return;
			}
			
			$.ajax({
				type:"post",
				url:"idPwChk.do",
				data:{
					teId:userId.val(),
					tePwd:userPwd.val()
				},
				success:function(msg){
					if(msg == "OK"){
						$(".unRegiBox").css("display", "none");
						$(".unRegiChk").css("display", "block");
					}else {
						alert("아이디와 비밀번호가 일치하지 않습니다.")
						nullFalseChk(userId);
						nullFalseChk(userPwd);
					}
				},
				error:function(msg){
					alert(msg);
				}
			});
			
		});
		
	// 제이쿼리함수
	function nullFalseChk(userInfo) {
	  userInfo.removeClass('inputOk')
	  userInfo.addClass('inputNg')
	  userInfo.addClass('shake-element');
	  setTimeout(function() {
	    userInfo.removeClass('shake-element');
	  }, 300);
	}
	})
</script>
</html>