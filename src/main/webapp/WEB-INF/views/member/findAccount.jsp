<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디/비밀번호 찾기 | 여행이지</title>
    <link rel="stylesheet" href="../asset/css/reset.css">
    <link rel="stylesheet" href="../asset/css/common.css">
    <link rel="stylesheet" href="../asset/css/findAccount.css">
    <link rel="stylesheet" href="../asset/css/addClass.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/member/header.jsp"/>
    <main>
        <div class="findAccountWrap">
            <div class="findAccountBtn">
                <button id="idSearchBtn">아이디찾기</button>
                <button id="pwdSearchBtn">비밀번호찾기</button>
            </div>
            <div class="findContent">
                <div class="idFindBox" id="idFindBox1">
                    <div class="inputBox">
                        <span>이메일</span>
                        <input type="text" placeholder="이메일을 입력해주세요" name="teEmail" id="idEmail">
                    </div>
                    <button type="button" id="idEmailChk">이메일로 인증코드 받기</button>
                </div>
                <div class="pwdFindBox" id="pwdFindBox1">
                    <div class="inputBox">
                        <span>아이디</span>
                        <input type="text" placeholder="아이디를 입력해주세요" name="teId" id="userId">
                    </div>
                    <div class="inputBox">
                        <span>이메일</span>
                        <input type="text" placeholder="이메일을 입력해주세요" name="teEmail" id="pwdEmail">
                    </div>
                    <button type="button" id="pwdEmailChk">이메일로 인증코드 받기</button>
                </div>
                <div class="idFindBox" id="idFindBox2">
                    <div class="inputBox">
                        <span>인증코드</span>
                        <input type="text" placeholder="인증코드" name="userMailChk" id="idCode">
                    </div>
                    <button type="button" id="idCodeChk">아이디 찾기</button>
                </div>
                <div class="pwdFindBox" id="pwdFindBox2">
                    <div class="inputBox">
                        <span>인증코드</span>
                        <input type="text" placeholder="인증코드" name="userMailChk" id="pwdCode">
                    </div>
                    <button type="button" id="pwdCodeChk">비밀번호 찾기</button>
                </div>
                <div class="idFindBox" id="idFindBox3">
                    <p>가입하신 아이디는<br><em id="findId">00000</em><br>입니다.</p>
                    <button type="button" id="findPwdBtn">비밀번호 찾기</button>
                    <a href="regi.do">로그인</a>
                </div>
                <div class="pwdFindBox" id="pwdFindBox3">
                    <div class="inputBox">
                        <span>비밀번호<br>변경</span>
                        <input type="password" placeholder="변경할 비밀번호를 입력해주세요" name="tePwd" id="newPwd">
                    </div>
                    <div class="inputBox">
                        <span>비밀번호<br>변경확인</span>
                        <input type="password" placeholder="변경할 비밀번호를 한번 더 입력해주세요" id="newPwdChk">
                    </div>
                    <button type="button" id="updatePwdBtn">비밀번호 변경</button>
                </div>
                <div class="pwdFindBox" id="pwdFindBox4">
                    <p>비밀번호가 변경되었습니다. <br>로그인 해 주십시오.</p>
                    <a href="login.do">로그인</a>
                </div>
            </div>
        </div>
    </main>
    <script>
    $(document).ready(function(){
    	
    	let idSearchBtn = $("#idSearchBtn");
    	let pwdSearchBtn = $("#pwdSearchBtn");
    	
    	let idFindBox1 = $("#idFindBox1");
    	let idFindBox2 = $("#idFindBox2");
    	let idFindBox3 = $("#idFindBox3");
    	let pwdFindBox1 = $("#pwdFindBox1");
    	let pwdFindBox2 = $("#pwdFindBox2");
    	let pwdFindBox3 = $("#pwdFindBox3");
    	let pwdFindBox4 = $("#pwdFindBox4");
    	
    	let idEmail = $("#idEmail");
    	let pwdEmail = $("#pwdEmail");
    	
    	let idCode =$("#idCode");
    	let pwdCode =$("#pwdCode");
    	
    	let userId =$("#userId");
    	let newPwd =$("#newPwd");
    	let newPwdChk =$("#newPwdChk");
    	
    	let findPwdBtn =$("#findPwdBtn");
    	
    	
    	/* 아이디찾기 눌렀을 때 활성화 */
        idSearchBtn.addClass('clickBtn');
    	idSearchBtn.click(function(){
    		pwdSearchBtn.removeClass('clickBtn');
    		idSearchBtn.addClass('clickBtn');
    		pwdFindBox1.css("display", "none");
    		idFindBox1.css("display", "block");
        });
        /* 비밀번호찾기 눌렀을 때 활성화 */
        pwdSearchBtn.click(function(){
        	idSearchBtn.removeClass('clickBtn');
        	pwdSearchBtn.addClass('clickBtn');
        	idFindBox1.css("display", "none");
        	idFindBox2.css("display", "none");
        	idFindBox3.css("display", "none");
        	pwdFindBox1.css("display", "block");
        })
        
        findPwdBtn.click(function(){
        	idSearchBtn.removeClass('clickBtn');
        	pwdSearchBtn.addClass('clickBtn');
        	idFindBox1.css("display", "none");
        	idFindBox2.css("display", "none");
        	idFindBox3.css("display", "none");
        	pwdFindBox1.css("display", "block");
        })
        
        /* 아이디찾기에서 이메일 인증코드 받기 */
        $("#idEmailChk").click(function(){
        	
    		if(idEmail.val() !== ""){
    			$.ajax({
    				type:"post",
    				url:"findId.do",
    				data:{"usermail":idEmail.val()},
    				success:function(msg){
    					if(msg == "success"){
    						alert("이메일 인증코드가 발송되었습니다.")
    						idFindBox1.css("display", "none");
    						idFindBox2.css("display", "block");
    					}
    				},
    				error:function(){
    					alert('error');
    				}
    			})
    		} else {
    			alert("이메일을 입력해주세요.");
    			nullFalseChk(idEmail);
    		}
    	}); /* end of emailSendBtn */
    	
    	/* 아이디찾기에서 이메일 인증코드 입력해서 아이디 찾기 */
        $("#idCodeChk").click(function(){
        	
    		if(idCode.val() !== ""){
    			$.ajax({
    				type:"post",
    				url:"idChk.do",
    				data:{
    					teEmail:idEmail.val(),
    					teEmailKey:idCode.val()
    				},
    				success:function(str){
    					if(str == "fail"){
    						alert("인증코드가 일치하지 않습니다.")
    						nullFalseChk(idCode);
    					} else {
    						idFindBox2.css("display", "none");
    						idFindBox3.css("display", "block");
    						$("#findId").text(str);
    					}
    				},
    				error:function(){
    					alert('error');
    				}
    			});
    		} else {
    			alert("인증코드를 입력해주세요.");
    			nullFalseChk(idCode);
    		}
    	}); /* end of idCodeChk */
    	
    	/* 비밀번호찾기에서 인증코드 발송 */
		$("#pwdEmailChk").click(function(){
        	
    		if(pwdEmail.val() !== ""){
    			$.ajax({
    				type:"post",
    				url:"findPwd.do",
    				data:{
    					teId:userId.val(),
    					teEmail:pwdEmail.val()
    				},
    				success:function(msg){
    					if(msg == "success"){
    						alert("이메일 인증코드가 발송되었습니다.")
    						pwdFindBox1.css("display", "none");
    						pwdFindBox2.css("display", "block");
    					} else {
    						alert("가입되지않은 이메일입니다.");
    						pwdEmail.addClass('inputNg');
    					}
    				},
    				error:function(){
    					alert('error');
    				}
    			})
    		} else {
    			alert("이메일을 입력해주세요.");
    			nullFalseChk(pwdEmail);
    		}
    	}); /* end of emailSendBtn */
    	
    	/* 비밀번호찾기에서 이메일 인증코드 입력 */
        $("#pwdCodeChk").click(function(){
        	
    		if(pwdCode.val() !== ""){
    			$.ajax({
    				type:"post",
    				url:"emailAuthChk.do",
    				data:{
    					teEmail:pwdEmail.val(),
    					teEmailKey:pwdCode.val()
    					},
    				success:function(msg){
    					if(msg == "YES"){
    						pwdFindBox2.css("display", "none");
    						pwdFindBox3.css("display", "block");
    					}else {
    						alert("인증코드가 일치하지 않습니다.")
    						nullFalseChk(pwdCode);
    					}
    				},
    				error:function(){
    					alert('error');
    				}
    			})
    		} else {
    			alert("인증코드를 입력해주세요.");
    			nullFalseChk(pwCode);
    		}
    	}); /* end of idCodeChk */
    	
    	/* 인증코드입력 후 비밀번호 재설정 */
        $("#updatePwdBtn").click(function(){
        	
    		if(newPwd.val() !== "" && newPwdChk.val() !== "" && newPwdChk.val() == newPwd.val()){
    			$.ajax({
    				type:"post",
    				url:"pwdChk.do",
    				data:{
    					teEmail:pwdEmail.val(),
    					tePwd:newPwdChk.val()
    				},
    				success:function(msg){
    					if(msg == "OK"){
    						pwdFindBox3.css("display", "none");
    						pwdFindBox4.css("display", "block");
    					}else {
    						alert("비밀번호변경에 실패했습니다.")
    						nullFalseChk(newPwd);
    					}
    				},
    				error:function(){
    					alert('error');
    				}
    			})
    		} else {
    			alert("비밀번호입력칸을 확인해주세요");
    			nullFalseChk(newPwd);
    			nullFalseChk(newPwdChk);
    		}
    	}); /* end of idCodeChk */
    	
    	
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