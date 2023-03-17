package com.travelez.app.member.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travelez.app.member.dao.MemberDao;
import com.travelez.app.member.dto.EmailChkDto;
import com.travelez.app.member.dto.MemberDto;
import com.travelez.app.member.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService{
	
	// Dao 접근(생성)
	@Autowired
	MemberDao dao;
	
	@Override
	public boolean insertEmailKey(EmailChkDto dto) {
		int count = dao.insertEmailKey(dto);
		return count>0?true:false;
	}

	@Override
	public boolean updateEmailKey(EmailChkDto dto) {
		int count = dao.updateEmailKey(dto);
		return count>0?true:false;
	}

	@Override
	public EmailChkDto emailKeyChk(EmailChkDto dto) {
		return dao.emailKeyChk(dto);
	}

	@Override
	public int updateMailAuth(EmailChkDto dto) {
		return dao.updateMailAuth(dto);
	}

	@Override
	public boolean idCheck(String id) {
		int count = dao.idCheck(id);
		return count>0?true:false;
	}

	@Override
	public boolean addMember(MemberDto dto) {
		int count = dao.addMember(dto);
		return count>0?true:false;
	}

	@Override
	public boolean emailCheck(String email) {
		int count = dao.emailCheck(email);
		return count>0?true:false;
	}

	@Override
	public boolean emailAuthChk(EmailChkDto dto) {
		int count = dao.emailAuthChk(dto);
		return count>0?true:false;
	}

	@Override
	public MemberDto login(MemberDto dto) {
		return dao.login(dto);
	}

	@Override
	public String findId(String findId) {
		return dao.findId(findId);
	}

	@Override
	public boolean updatePwd(MemberDto dto) {
		int count = dao.updatePwd(dto);
		return count>0?true:false;
	}

	@Override
	public boolean findPwd(MemberDto dto) {
		int count = dao.findPwd(dto);
		return count>0?true:false;
	}

	@Override
	public boolean updateUserInfo(MemberDto dto) {
		int count = dao.updateUserInfo(dto);
		return count>0?true:false;
	}

	@Override
	public MemberDto userInfo(String id) {
		return dao.userInfo(id);
	}

	@Override
	public boolean updateUserPwd(MemberDto dto) {
		int count = dao.updateUserPwd(dto);
		return count>0?true:false;
	}

	@Override
	public boolean unEmailChk(String email) {
		System.out.println("service " + email);
		int count = dao.unEmailChk(email);
		return count>0?true:false;
	}
	

}
