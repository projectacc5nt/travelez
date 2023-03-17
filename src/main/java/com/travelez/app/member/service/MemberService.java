package com.travelez.app.member.service;

import java.util.List;

import com.travelez.app.member.dto.EmailChkDto;
import com.travelez.app.member.dto.MemberDto;

public interface MemberService {
	
	
	// 이메일 인증
	boolean insertEmailKey(EmailChkDto dto);
	// 이메일 중복확인
	boolean emailCheck(String email);
	// 이메일 재전송
	boolean updateEmailKey(EmailChkDto dto);
	// 인증코드 일치 확인
	EmailChkDto emailKeyChk(EmailChkDto dto);
	// 인증완료하면 auth 1로 변경
	int updateMailAuth(EmailChkDto dto);
	// 이메일 인증완료여부 확인
	boolean emailAuthChk(EmailChkDto dto);
	// id 중복확인
	boolean idCheck(String id);
	// 회원등록
	boolean addMember(MemberDto dto);
	
	// 로그인
	MemberDto login(MemberDto dto);
	// 아이디찾기
	String findId(String findId);
	// 비밀번호 찾기
	boolean findPwd(MemberDto dto);
	// 비밀번호 재설정
	boolean updatePwd(MemberDto dto);
	
	// 회원정보
	MemberDto userInfo(String id);
	// 회원정보수정
	boolean updateUserInfo(MemberDto dto);
	// 회원탈퇴
	boolean unEmailChk(String email);
	// 회원비밀번호 재설정
	boolean updateUserPwd(MemberDto dto);
}
