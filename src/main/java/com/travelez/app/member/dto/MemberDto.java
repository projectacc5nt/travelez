package com.travelez.app.member.dto;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

public class MemberDto implements Serializable {
	private String teId;
	private String tePwd;
	private String teProfile;
	private String teProfileName;
	private String teName;
	private String teEmail;
	private String tePhoneNum;
	private String teBirth;
	private String tePreferTrip;
	private String teAuth;
	
	public MemberDto() {
		
	}

	public MemberDto(String teId, String tePwd, String teProfile, String teProfileName, String teName,
			String teEmail, String tePhoneNum, String teBirth,
			String tePreferTrip, String teAuth) {
		super();
		this.teId = teId;
		this.tePwd = tePwd;
		this.teProfile = teProfile;
		this.teProfileName = teProfileName;
		this.teName = teName;
		this.teEmail = teEmail;
		this.tePhoneNum = tePhoneNum;
		this.teBirth = teBirth;
		this.tePreferTrip = tePreferTrip;
		this.teAuth = teAuth;
	}

	public MemberDto(String teId, String tePwd, String teName, String teEmail, String teEmailAuth, String teEmailKey,
			String tePhoneNum, String teBirth, String teAuth) {
		this.teId = teId;
		this.tePwd = tePwd;
		this.teName = teName;
		this.teEmail = teEmail;
		this.tePhoneNum = tePhoneNum;
		this.teBirth = teBirth;
		this.teAuth = teAuth;
	}

	public String getTeId() {
		return teId;
	}

	public void setTeId(String teId) {
		this.teId = teId;
	}

	public String getTePwd() {
		return tePwd;
	}

	public void setTePwd(String tePwd) {
		this.tePwd = tePwd;
	}

	public String getTeProfile() {
		return teProfile;
	}

	public void setTeProfile(String teProfile) {
		this.teProfile = teProfile;
	}

	public String getTeProfileName() {
		return teProfileName;
	}

	public void setTeProfileName(String teProfileName) {
		this.teProfileName = teProfileName;
	}

	public String getTeName() {
		return teName;
	}

	public void setTeName(String teName) {
		this.teName = teName;
	}

	public String getTeEmail() {
		return teEmail;
	}

	public void setTeEmail(String teEmail) {
		this.teEmail = teEmail;
	}

	public String getTePhoneNum() {
		return tePhoneNum;
	}

	public void setTePhoneNum(String tePhoneNum) {
		this.tePhoneNum = tePhoneNum;
	}

	public String getTeBirth() {
		return teBirth;
	}

	public void setTeBirth(String teBirth) {
		this.teBirth = teBirth;
	}

	public String getTePreferTrip() {
		return tePreferTrip;
	}

	public void setTePreferTrip(String tePreferTrip) {
		this.tePreferTrip = tePreferTrip;
	}

	public String getTeAuth() {
		return teAuth;
	}

	public void setTeAuth(String teAuth) {
		this.teAuth = teAuth;
	}

	@Override
	public String toString() {
		return "MemberDto [teId=" + teId + ", tePwd=" + tePwd + ", teProfile=" + teProfile + ", teProfileName="
				+ teProfileName + ", teName=" + teName + ", teEmail=" + teEmail + ", tePhoneNum=" + tePhoneNum + ", teBirth=" + teBirth
				+ ", tePreferTrip=" + tePreferTrip + ", teAuth=" + teAuth + "]";
	}
	
}
