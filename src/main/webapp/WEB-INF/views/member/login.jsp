<%@page import="com.travelez.app.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>여행이지 | 로그인</title>	
	<link rel="stylesheet" href="../asset/css/reset.css">
	<link rel="stylesheet" href="../asset/css/login.css">
	<link rel="stylesheet" href="../asset/css/addClass.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script src="http://lab.alexcican.com/set_cookies/cookie.js"type="text/javascript"></script>
</head>
<body>
<div class="loginWrap">
        <h1><img src="../asset/images/logo.png" alt="여행이지"></h1>
        <div class="loginContent">
            <form action="loginAf.do" method="post" id="loginForm">
                <input type="text" name="teId" id="userId" placeholder="아이디">
                <input type="password" name="tePwd" id="userPwd" placeholder="비밀번호">
                <p id="idPwdChk"></p>
                <div>
                    <div class="rememberId">
                        <input type="checkbox" name="SaveIdChk" id="SaveIdChk">
                        <label for="SaveIdChk">아이디 저장</label>
                    </div>
                    <a href="findAccount.do" class="idPwdSearch">아이디 / 비밀번호 찾기</a>
                </div>
                <button type="button" id="loginBtn">로그인</button>
                <a href="regi.do" class="regiBtn">회원가입</a>
            </form>
        </div>
    </div>
    <script type="text/javascript">
    $(document).ready(function() {
    	let userId = $.cookie("userId");
    	let teId = $("#userId");
    	let tePwd = $("#userPwd");
    	let idPwdChk = $("#idPwdChk");
    	
    	if (userId != null) { // 저장한 id가 있음
    		$("#userId").val(userId);
    		$("#SaveIdChk").prop("checked", true);
    	}
    		
    	$("#loginBtn").click(function(){
    		   
    		if ($("#SaveIdChk").is(":checked") == true) {
    	
    			if (teId.val().trim() == "") {
    				idPwdChk.text("아이디를 입력해주세요")
    				idPwdChk.css("display", "block")
    				idPwdChk.css("color", "#ff0000")
    				nullFalseChk(teId);
    				return;
    			} else {
    				// cookie를 저장
    				$.cookie("userId", teId.val().trim(), {
    					/* expires : 7, */
    					path : './'
    				});
    			}
    	
    		} else {
    			$.removeCookie("userId", {
    				path : './'
    			});
    		}
    		
    		if(tePwd.val().trim() == "" && teId.val().trim() != ""){
    			idPwdChk.text("비밀번호를 입력해주세요")
    			idPwdChk.css("display", "block")
				idPwdChk.css("color", "#ff0000")
				teId.removeClass('inputNg')
				nullFalseChk(tePwd);
    			return;
    		}
    		$.ajax({
    			type:"post",
    			url:"loginAf.do",
    			data:{
    				"teId":teId.val(),
    				"tePwd":tePwd.val()
    			},
    			success:function(msg){
    				if(msg == "LOGIN_OK"){
    					location.href = "home.do";
    					
    				}else if(msg == "LOGIN_FAIL"){
    					idPwdChk.text("아이디 또는 비밀번호를 확인해주세요.")
    	    			idPwdChk.css("display", "block")
    	    			idPwdChk.css("color", "#ff0000")
    	    			nullFalseChk(teId);
    					nullFalseChk(tePwd);
    				}
    			},
    			error:function(err) {
    				console.log(err)
    			}
    		})
    		
    		
    	}); /* end of SaveIdChk.click */
    	   
    	function nullFalseChk(userInfo) {
    		userInfo.removeClass('inputOk')
    		userInfo.addClass('inputNg')
    		userInfo.addClass('shake-element');
    		setTimeout(function() {
    			userInfo.removeClass('shake-element');
    		}, 300);
    	}	/* end of nullFalseChk */
    });	/* end of document */
    </script>
</body>
</html>