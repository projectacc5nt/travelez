/* 자바스크립트 */
window.onload = function(){

/* 변수선언 */
const pThumbnail = document.getElementById('profile');
const userPwd = document.getElementById('userPwd');
const userPwdChk = document.getElementById('userPwdChk');
const userName = document.getElementById('userName');
const userTel = document.getElementById('userTel');
const userBirth = document.getElementById('userBirth');
const userEmail = document.getElementById('userEmail');
const customDate = document.getElementById('customDate');
const agreement = document.getElementsByClassName('userChk')[1];
const allAgree = document.getElementById('allAgree');
const useAgree = document.getElementById('useAgree');
const infoAgree = document.getElementById('infoAgree');
const ageAgree = document.getElementById('ageAgree');

/* 이미지파일 업로드시 썸네일 변경 이벤트 */
pThumbnail.addEventListener('change', function(event){
	setThumbnail(event)
});

/* 빈칸에 입력 시 테두리 파랗게 변경 */
inputChk(userName);

/* 비밀번호 입력 후 비밀번호 확인과 일치하는지 확인 */
userPwd.addEventListener('input', function(){
	
	inputOk(userPwd);
	
	if(userPwdChk.value !== "" && userPwd.value !== userPwdChk.value){
		inputNg(userPwd);
	}else {
		inputOk(userPwd);
	}
});

/* 비밀번호 확인 입력시 일치하면 테두리 파랑, 불일치 빨강 */
userPwdChk.addEventListener('input', function(){
	if (userPwdChk.value.length > 0 && userPwdChk.value == userPwd.value) {
		inputOk(userPwdChk);
	} else {
		inputNg(userPwdChk);
	}
}); /* end of userPwChk input function */


/* 이메일 주소에 @가 있는지 확인 */
userEmail.addEventListener('input', function() {
  	if (validateEmail(userEmail.value)) {
  	 	inputOk(userEmail);
  	} else {
    	inputNg(userEmail);
  	}
});

/* 전화번호 형식이 맞는지 확인 */
userTel.addEventListener('input', function(){
	if(userTel.value.length > 10){
		inputOk(userTel);
	} else {
		inputNg(userTel);
	}
})

/* input="date" custom */
userBirth.addEventListener('input', function() {
  const date = new Date(this.value);
  const year = date.getFullYear();
  const month = (date.getMonth() + 1).toString().padStart(2, '0');
  const day = date.getDate().toString().padStart(2, '0');
  customDate.textContent = `${year}  /  ${month}  /  ${day}`;
});

/* custom한 date 입력여부 테두리 변경 */
userBirth.addEventListener('input', function(){
	if(userBirth.value.length > 0){
		inputOk(customDate);
		customDate.style.color = '#202020';
	} else {
		inputNg(customDate);
	}
})

/* 오늘날짜이후 선택 막기 */
var today = new Date().toISOString().split("T")[0];
document.getElementById("userBirth").setAttribute("max", today);

/* 이용약관동의 전체동의버튼 눌렀을 때 아래 전부 선택 */
allAgree.addEventListener('click', function(){
	if(allAgree.checked){
		useAgree.checked = true;
		infoAgree.checked = true;
		ageAgree.checked = true;
		inputOk(agreement);
	} else{
		useAgree.checked = false;
		infoAgree.checked = false;
		ageAgree.checked = false;
		inputNg(agreement);
	}
})

/* 이용약관체크 시 세개 다 체크되었을 때 전체동의 체크 */
useAgree.addEventListener('click', checkAllAgree);
infoAgree.addEventListener('click', checkAllAgree);
ageAgree.addEventListener('click', checkAllAgree);
 
/* 함수 */
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

/* 빈칸채워질 때 컬러변경 함수 */
function inputChk(userInfo){
	userInfo.addEventListener('input', function(){
		if (userInfo.value.length > 0) {
    		inputOk(userInfo);
		} else {
			inputNg(userInfo);
		}
	});
} /* end of inputChk */

/* 이메일 형식인지 확인 */
function validateEmail(email){
	const atPosition = email.indexOf('@');
	if(atPosition > 0){
		return true;
	} else {
		return false;
	}
}/* end of validateEmail */

/* input 입력여부에 따라 css클래스 삭제 추가 */
function inputOk(userInfo){
	userInfo.classList.remove('inputNg');
    userInfo.classList.add('inputOk');
}
function inputNg(userInfo){
	userInfo.classList.remove('inputOk');
    userInfo.classList.add('inputNg');
}
/* 이용약관동의 모두 선택되면 전체동의도 checked */
function checkAllAgree() {
  if (useAgree.checked && infoAgree.checked && ageAgree.checked) {
    allAgree.checked = true;
    inputOk(agreement);
  } else {
    allAgree.checked = false;
  }
}

}; /* end of window onload */