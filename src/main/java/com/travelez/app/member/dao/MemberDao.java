package com.travelez.app.member.dao;

import java.util.List;


import com.travelez.app.member.dto.EmailChkDto;
import com.travelez.app.member.dto.MemberDto;

public interface MemberDao {
	
	// 이메일 인증 
	int insertEmailKey(EmailChkDto dto);
	// 이메일 중복확인
	int emailCheck(String email);
	// 이메일 재전송
	int updateEmailKey(EmailChkDto dto);
	// 인증코드 일치 확인
	EmailChkDto emailKeyChk(EmailChkDto dto);
	// 인증완료하면 auth 1로 변경
	int updateMailAuth(EmailChkDto dto);
	// 이메일 인증완료여부 확인
	int emailAuthChk(EmailChkDto dto);
	// id 중복확인
	int idCheck(String id);
	// 회원등록
	int addMember(MemberDto dto);
	
	// 로그인
	MemberDto login(MemberDto dto);
	// 아이디 찾기
	String findId(String findId);
	// 비밀번호 찾기
	int findPwd(MemberDto dto);
	// 비밀번호 재설정
	int updatePwd(MemberDto dto);
	
	// 회원정보
	MemberDto userInfo(String id);
	// 회원정보수정
	int updateUserInfo(MemberDto dto);
	// 회원탈퇴
	int unEmailChk(String email);
	// 회원비밀번호 변경
	int updateUserPwd(MemberDto dto);
}
