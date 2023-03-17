<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.travelez.app.member.dto.EmailChkDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>여행이지 | 회원가입</title>
	<link rel="stylesheet" href="../asset/css/reset.css">
	<link rel="stylesheet" href="../asset/css/common.css">
	<link rel="stylesheet" href="../asset/css/regi.css">
	<link rel="stylesheet" href="../asset/css/addClass.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript" src="../asset/script/regi.js"></script>
</head>
<body>


	<jsp:include page="/WEB-INF/views/member/header.jsp"/>
	<main>
    <h2>회원가입</h2>
    <p class="requiredInfo">*필수입력사항</p>
    <form action="registerAf.do" method="post" enctype="multipart/form-data" id="regiForm">
        <div class="profile">
            <div class="roundImg"><img src="../asset/images/profile.png" alt="프로필이미지"></div>
            <input type="file" id="profile" name="fileload">
            <label for="profile"><img src="../asset/images/pupload.png" alt="프로필이미지업로드"></label>
        </div>  <!-- end of profile -->
        <div class="userIdWrap">
	        <div class="userId">
	            <span>아이디*</span>
	            <input type="text" name="teId" id="userId" placeholder="아이디를 입력해주세요">
	            <button type="button" id="idChkBtn">중복확인</button>
	        </div>  <!-- end of userId -->
	        <p id="idcheck"></p>
        </div>	<!-- end of userIdWrap -->
        <div class="userPwd">
            <span>비밀번호*</span>
            <input type="password" name="tePwd" id="userPwd" placeholder="비밀번호를 입력해주세요">
        </div>  <!-- end of userPwd -->
        <div class="userPwChk">
            <span>비밀번호확인*</span>
            <input type="password" name="userPwdChk" id="userPwdChk" placeholder="비밀번호를 한번 더 입력해주세요">
        </div>  <!-- end of userPwChk -->
        <div class="userName">
            <span>이름*</span>
            <input type="text" name="teName" id="userName" placeholder="이름을 입력해주세요">
        </div>  <!-- end of userName -->
        <div class="userEmail">
            <span>이메일*</span>
            <input type="text" name="teEmail" id="userEmail" placeholder="이메일을 입력해주세요">
            <button type="button" id="emailSendBtn">메일인증전송</button>
        </div>  <!-- end of userEmail -->
        <div class="userEmailChk">
            <span>인증번호*</span>
            <input type="text" name="userMailChk" id="userMailChk" placeholder="인증번호를 입력해주세요">
            <button type="button" id="emailChkBtn">인증번호확인</button>
        </div>   <!-- end of userTel -->
        <div class="userTel">
            <span>전화번호*</span>
            <input type="text" name="tePhoneNum" id="userTel" placeholder="전화번호를 입력해주세요">
        </div>   <!-- end of userTel -->
        <div class="userBirth">
            <span>생년월일*</span>
            <label for="userBirth">
            	<input type="date" name="teBirth" id="userBirth" required aria-required="true" min="{{today}}">
        		<div id="customDate">YYYY&nbsp;&nbsp;/&nbsp;&nbsp;MM&nbsp;&nbsp;/&nbsp;&nbsp;DD</div>
        	</label>
        </div>  <!-- end of userbirth -->
        <div class="preferTrip">
            <span>선호하는<br>여행스타일</span>
            <div class="userChk">
                <div>
                    <input type="checkbox" id="camping" name="tePreferTrip" value="캠핑">
                    <label for="camping">캠핑</label>
                </div>
                <div>
                    <input type="checkbox" id="hotel" name="tePreferTrip" value="호캉스">
                    <label for="hotel">호캉스</label>
                </div>
                <div>
                    <input type="checkbox" id="healing" name="tePreferTrip" value="힐링">
                    <label for="healing">힐링</label>
                </div>
                <div>
                    <input type="checkbox" id="activity" name="tePreferTrip" value="액티비티">
                    <label for="activity">액티비티</label>
                </div>
                <div>
                    <input type="checkbox" id="famliyTrip" name="tePreferTrip" value="가족여행">
                    <label for="famliyTrip">가족여행</label>
                </div>
                <div>
                    <input type="checkbox" id="livingMonth" name="tePreferTrip" value="한달살기">
                    <label for="livingMonth">한달살기</label>
                </div>
                <div>
                    <input type="checkbox" id="themeTrip" name="tePreferTrip" value="테마여행">
                    <label for="themeTrip">테마여행</label>
                </div>
                <div>
                    <input type="checkbox" id="shortTrip" name="tePreferTrip" value="단기여행">
                    <label for="shortTrip">단기여행</label>
                </div>
                <div>
                    <input type="checkbox" id="shopping" name="tePreferTrip" value="쇼핑">
                    <label for="shopping">쇼핑</label>
                </div>
            </div>
        </div>  <!-- end of preferTrip -->
        <div class="agreement">
            <span>이용약관동의*</span>
            <div class="userChk">
                <div>
                    <input type="checkbox" id="allAgree">
                    <label for="allAgree">전체 동의합니다.</label>
                </div>
                <div>
                    <input type="checkbox" id="useAgree">
                    <label for="useAgree">이용약관동의<em>(필수)</em></label>
                    <button type="button" class="agreeMore">more</button>
                </div>
                <div>
                    <input type="checkbox" id="infoAgree">
                    <label for="infoAgree">개인정보 수집 이용동의<em>(필수)</em></label>
                    <button type="button" class="agreeMore">more</button>
                </div>
                <div>
                    <input type="checkbox" id="ageAgree">
                    <label for="ageAgree">본인은 만 14세 이상입니다.<em>(필수)</em></label>
                    <button type="button" class="agreeMore">more</button>
                </div>
            </div>
        </div>  <!-- end of agreement -->
        <button type="button" class="join" id="joinBtn">가입하기</button>
    </form>
</main>
<jsp:include page="/WEB-INF/views/member/footer.jsp"/>
</body>

<script type="text/javascript">
$(document).ready(function() {
	let userId = $("#userId");
	let idcheck = $("#idcheck");
	let userPwd = $("#userPwd");
	let userPwdChk = $("#userPwdChk");
	let userName = $("#userName");
	let userEmail = $("#userEmail");
	let userMailChk = $("#userMailChk");
	let userEmailChk = $(".userEmailChk");
	let userTel = $("#userTel");
	let userBirth = $("#userBirth");
	let customDate = $("#customDate");
	let agreement = $(".agreement .userChk");
	let allAgree = $("#allAgree");
	
	
	
	$("#idChkBtn").click(function() {
		
		if(userId.val() !== "") {
			
			// id 중복확인
			$.ajax({
				type:"post",
				url:"idcheck.do",
				data:{ "id":userId.val() },
				success:function(msg){
					// alert('success');
					// alert(JSON.stringify(msg));
					
					if(msg == "YES"){
						userId.removeClass('inputNg');
						idcheck.text("사용할 수 있는 아이디입니다");
						userId.addClass('inputOk');
						idcheck.css("color", "#0F0FC0");
					}else{
						userId.removeClass('inputOk');
						idcheck.text("사용중인 아이디입니다");
						idcheck.css("color", "#ff0000");
						userId.val("");
						userId.addClass('inputNg');
					}
				},
				error:function(){
					alert('error');
				}
			});
		}else {
			nullFalseChk(userId);
		}
	});/* end of idChkBtn */
	
	
	// 이메일 인증메일 전송 
	$("#emailSendBtn").click(function(){
		if(userEmail.val() !== ""){
			$.ajax({
				type:"post",
				url:"emailChksend.do",
				data:{"usermail":userEmail.val()},
				success:function(msg){
					if(msg == "NO"){
						alert("이미 등록된 이메일입니다.");
						userEmail.css.addClass('inputNg');
					}else if(msg == "success"){
						alert("인증코드가 발송되었습니다. 메일에서 확인 후 인증코드를 입력해주세요");
						userEmail.addClass('inputOk');
						userEmailChk.css("display", "block");
					}else if(msg == "updateSuccess"){
						alert("인증코드가 재발송되었습니다. 메일에서 확인 후 인증코드를 입력해주세요");
						userEmail.addClass('inputOk');
						userEmailChk.css("display", "block");
					}else {
						alert(JSON.stringify(msg));
					}
				},
				error:function(){
					alert('error');
				}
			})
		} else {
			nullFalseChk(userEmail);
		}
	}); /* end of emailSendBtn */
	
	// 인증코드 확인
	$("#emailChkBtn").click(function(){
		if(userMailChk.val() === "" || userMailChk.val().length < 6){
			nullFalseChk(userMailChk)
			return;
		}
		$.ajax({
			type:"post",
			url:"mailKeyChk.do",
			data:{
					teEmailKey:userMailChk.val(),
					teEmail:userEmail.val()
			},
			success:function(msg){
				if(msg == "OK"){
					alert("인증코드가 확인되었습니다.");
					userMailChk.removeClass('inputNg');
					userMailChk.addClass('inputOk');
				}else{
					alert("인증코드가 일치하지않습니다.");
					userMailChk.removeClass('inputOk');
					userMailChk.addClass('inputNg');
				}
			},
			error:function(){
				alert('error');
			}
		});
		
	})/* end of EmailChkBtn */

	
	// 가입하기 버튼 눌렀을 때 빈칸이거나 일치하지 않는지 확인
	$("#joinBtn").click(function(){
		if (userId.val() === "" || userId.val().length < 0){
			alert("아이디 입력칸을 확인하세요")
			nullFalseChk(userId);
			return;
		} else if (userPwd.val() === "" || userPwd.val().length < 0){
			alert("비밀번호 입력칸을 확인하세요")
			nullFalseChk(userPwd);
			return;
		} else if (userPwdChk.val() === "" || userPwdChk.val().length < 0 || userPwdChk.val() != userPwd.val()){
			alert("비밀번호확인 입력칸을 확인하세요")
			nullFalseChk(userPwdChk);
			return;
		} else if (userName.val() === "" || userName.val().length < 0){
			alert("이름 입력칸을 확인하세요")
			nullFalseChk(userName);
			return;
		} else if(userEmail.val() === "" || userEmail.val().length < 0){
			alert("이메일입력칸을 확인하세요.");
			nullFalseChk(userEmail);
		} else if(userMailChk.val() === "" || userMailChk.val().length < 0){
			alert("이메일인증코드 입력칸을 확인하세요.");
			nullFalseChk(userMailChk);		
		} else if (userTel.val() === "" || userTel.val().length < 11){
			alert("전화번호 입력칸을 확인하세요")
			nullFalseChk(userTel);
			return;
		} else if (userBirth.val() === "" || userBirth.val().length < 0){
			alert("생년월일 입력칸을 확인하세요")
			nullFalseChk(customDate);
			return;
		} else if (!allAgree.prop("checked")){
			alert("이용약관동의를 확인해주세요")
			nullFalseChk(agreement);
			return;
		}
		$.ajax({
				type:"post",
				url:"emailAuthChk.do",
				data:{
						teEmailKey:userMailChk.val(),
						teEmail:userEmail.val()
				},
				success:function(msg){
					if(msg == "YES"){
						console.log(msg);
						console.log("제출");
						$("#regiForm").submit();
					}else {
						alert("이메일인증이 완료되지않았습니다.");
						userEmail.removeClass('inputOk');
						userEmail.addClass('inputNg');
						 return;
					}
				},
				error:function(){
					console.log(error);
				}
			});
	});/* end of joinBtn */
	
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
</html>