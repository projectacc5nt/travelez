package com.travelez.app.member.dao.impl;

import com.travelez.app.member.dao.MemberDao;


import com.travelez.app.member.dto.EmailChkDto;
import com.travelez.app.member.dto.MemberDto;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository // == 저장소
public class MemberDaoImpl implements MemberDao {
	
	@Autowired  // 자동생성
	SqlSession session;
	
	String ns = "Member.";
	
	@Override
	public int idCheck(String id) {
		return session.selectOne(ns + "idcheck", id);
	}
	
	@Override
	public int insertEmailKey(EmailChkDto dto) {
		return session.insert(ns + "insertEmailKey", dto);
	}

	@Override
	public int updateEmailKey(EmailChkDto dto) {
		return session.update(ns + "updateEmailKey", dto);
	}

	@Override
	public EmailChkDto emailKeyChk(EmailChkDto dto) {
		return session.selectOne(ns + "emailKeyChk", dto);
	}

	@Override
	public int updateMailAuth(EmailChkDto dto) {
		return session.update(ns + "updateMailAuth", dto);
	}

	@Override
	public int addMember(MemberDto dto) {
		return session.insert(ns + "addMember", dto);
	}

	@Override
	public int emailCheck(String email) {
		return session.selectOne(ns + "emailCheck", email);
	}

	@Override
	public int emailAuthChk(EmailChkDto dto) {
		return session.selectOne(ns + "emailAuthChk", dto);
	}

	@Override
	public MemberDto login(MemberDto dto) {
		MemberDto mem = session.selectOne(ns + "login", dto);
		return mem;
	}

	@Override
	public String findId(String findId) {
		return session.selectOne(ns + "findId", findId);
	}

	@Override
	public int findPwd(MemberDto dto) {
		return session.selectOne(ns + "idcheck", dto);
	}
	
	@Override
	public int updatePwd(MemberDto dto) {
		return session.update(ns + "updatePwd", dto);
	}

	@Override
	public int updateUserInfo(MemberDto dto) {
		return session.update(ns + "updateUserInfo", dto);
	}

	@Override
	public MemberDto userInfo(String id) {
		return session.selectOne(ns + "userInfo", id);
	}

	@Override
	public int updateUserPwd(MemberDto dto) {
		return session.update(ns + "updateUserPwd", dto);
	}

	@Override
	public int unEmailChk(String email) {
		System.out.println("dao " + email);
		return session.delete(ns + "unEmailChk", email);
	}


	
}
