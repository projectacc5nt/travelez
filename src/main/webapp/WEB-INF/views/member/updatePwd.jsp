<%@page import="com.travelez.app.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경 | 여행이지</title>
    <link rel="stylesheet" href="../asset/css/reset.css">
    <link rel="stylesheet" href="../asset/css/common.css">
    <link rel="stylesheet" href="../asset/css/updatePwd.css">
    <link rel="stylesheet" href="../asset/css/addClass.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
<% 
	MemberDto dto = (MemberDto)request.getAttribute("userInfo");
%>
<jsp:include page="/WEB-INF/views/member/header.jsp"/>
	
	<div class="updatePwdWrap">
		<form action="updatePwdAf.do" method="post" id="updatePwdForm">
			<div class="updatePwdBox">
				<h2>비밀번호 변경</h2>
				<input type="hidden" value="<%=dto.getTeId()%>" id="userId" name="teId">
				<div class="inputBox">
				    <span>비밀번호 변경</span>
				    <input type="password" placeholder="비밀번호를 입력해주세요" id="userPwd" name="tePwd">
				</div>
				<div class="inputBox">
				    <span>비밀번호 변경 확인</span>
				    <input type="password" placeholder="비밀번호를 한번 더 입력해주세요" id="userPwdChk">
				</div>
				<button type="button" id="changPwd">비밀번호 변경</button>
		   </div>
		</form>
   	</div>
   
   <jsp:include page="/WEB-INF/views/member/footer.jsp"/>
   
   
   <script type="text/javascript">
	$(document).ready(function(){
		let userId = $("#userId");
		let userPwd = $("#userPwd");
		let userPwdChk = $("#userPwdChk");
		
	
		$("#changPwd").click(function(){
			
			if(userPwd.val() == "" ){
				nullFalseChk(userPwd);
			} else if(userPwdChk.val() == "" ){
				nullFalseChk(userPwdChk);
			} else if( userPwd.val() != userPwdChk.val()){
				nullFalseChk(userPwd);
				nullFalseChk(userPwdChk);
			} else {
				$("#updatePwdForm").submit();
			}
		});	/* end of click.changPwd */
 			
 		// 제이쿼리함수
		function nullFalseChk(userInfo) {
		  userInfo.removeClass('inputOk')
		  userInfo.addClass('inputNg')
		  userInfo.addClass('shake-element');
		  setTimeout(function() {
		    userInfo.removeClass('shake-element');
		  }, 300);
		}
 	}); /* end of document */
   </script>
</body>
</html>