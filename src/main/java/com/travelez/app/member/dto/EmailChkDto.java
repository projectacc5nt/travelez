package com.travelez.app.member.dto;

import java.io.Serializable;

public class EmailChkDto implements Serializable{
	private String teEmail;
	private String teEmailAuth;
	private String teEmailKey;
	
	public EmailChkDto() {
		
	}

	public EmailChkDto(String teEmail, String teEmailAuth, String teEmailKey) {
		super();
		this.teEmail = teEmail;
		this.teEmailAuth = teEmailAuth;
		this.teEmailKey = teEmailKey;
	}
	

	public EmailChkDto(String teEmail, String teEmailKey) {
		super();
		this.teEmail = teEmail;
		this.teEmailKey = teEmailKey;
	}

	public String getTeEmail() {
		return teEmail;
	}

	public void setTeEmail(String teEmail) {
		this.teEmail = teEmail;
	}

	public String getTeEmailAuth() {
		return teEmailAuth;
	}

	public void setTeEmailAuth(String teEmailAuth) {
		this.teEmailAuth = teEmailAuth;
	}

	public String getTeEmailKey() {
		return teEmailKey;
	}

	public void setTeEmailKey(String teEmailKey) {
		this.teEmailKey = teEmailKey;
	}

	@Override
	public String toString() {
		return "EmailChkDto [teEmail=" + teEmail + ", teEmailAuth=" + teEmailAuth + ", teEmailKey=" + teEmailKey + "]";
	}
	
	
}
