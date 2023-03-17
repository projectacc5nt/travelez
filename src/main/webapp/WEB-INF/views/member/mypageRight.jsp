<%@page import="com.travelez.app.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	MemberDto login = (MemberDto)session.getAttribute("login");
	MemberDto dto = (MemberDto)request.getAttribute("userInfo");
%>


<div class="rightMyprofile">
    <form action="updateUserInfo.do" method="post" enctype="multipart/form-data" id="userUpdateForm">
        <div class="profile">
            <div class="roundImg"><img src="<%= dto.getTeProfile() %>" alt="프로필이미지"></div>
            <input type="file" id="profile" name="fileload">
            <input type="hidden" name="teProfile" value="<%= dto.getTeProfile() %>">
            <label for="profile"><img src="../asset/images/update.png" alt="프로필이미지업로드"></label>
        </div>  <!-- end of profile -->
        <span class="uNoti">* 변경가능</span>
        <div class="userId">
            <span>아이디</span>
            <input type="text" name="teId" id="userId" value="<%= dto.getTeId() %>" readonly="readonly">
        </div>  <!-- end of userId -->
        <div class="userName">
            <span>이름</span>
            <input type="text" name="teName" id="userName" value="<%= dto.getTeName() %>" readonly="readonly">
        </div>  <!-- end of userName -->
        <div class="userEmail">
            <span>이메일</span>
            <input type="text" name="teEmail" id="userEmail" value="<%= dto.getTeEmail() %>" readonly="readonly">
        </div>  <!-- end of userEmail -->
        <div class="userTel">
            <span>전화번호*</span>
            <input type="text" name="tePhoneNum" id="userTel" value="<%= dto.getTePhoneNum() %>">
        </div>   <!-- end of userTel -->
        <div class="userbirth">
            <span>생년월일</span>
            <input type="text" name="teBirth" id="userBirth" value="<%= dto.getTeBirth() %>" readonly="readonly">
        </div>  <!-- end of userbirth -->
        <div class="userPreferTrip">
            <span>선호하는<br>여행스타일*</span>
            <input type="text" name="tePreferTrip" id="userPrefer" value="<%= dto.getTePreferTrip() %>">
        </div>  <!-- end of preferTrip -->
        <div class="updateUserBtn">
            <button type="button" id="mypageUpdateBtn">수정</button>
            <a href="updatePwd.do?teId=<%= dto.getTeId() %>">비밀번호변경</a>
        </div>
    </form>
</div>

<script>
$(document).ready(function() {
	
	let userTel = $("#userTel");
	let userPrefer = $("#userPrefer");

	/* 수정버튼 눌렀을 때 빈칸인지 확인 후 제출 */
	$("#mypageUpdateBtn").click(function(){
		console.log(1);
		if(userTel.val() === "" || userTel.val().length < 11) {
			nullFalseChk(userTel);
		} else {
			$("#userUpdateForm").submit();
		}
	})
	
	
	// 제이쿼리함수
	/* 빈칸정보확인 */
	function nullFalseChk(userInfo) {
	  userInfo.removeClass('inputOk')
	  userInfo.addClass('inputNg')
	  userInfo.addClass('shake-element');
	  setTimeout(function() {
	    userInfo.removeClass('shake-element');
	  }, 300);
	}
	
	
}) /* end of document */

const pThumbnail = document.getElementById('profile');
pThumbnail.addEventListener('change', function(event){
	setThumbnail(event)
});
/* 프로필이미지 등록 시 썸네일 변경 */
function setThumbnail(event) {
	var reader = new FileReader();

	reader.onload = function(event) {
		let img = document.querySelector(".roundImg>img");
		img.setAttribute("src", event.target.result);
		document.querySelector(".roundImg").appendChild(img);
	};

	reader.readAsDataURL(event.target.files[0]);
}
</script>
