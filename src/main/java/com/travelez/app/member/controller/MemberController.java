package com.travelez.app.member.controller;

import java.io.File;



import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.travelez.app.member.dto.EmailChkDto;
import com.travelez.app.member.dto.MemberDto;
import com.travelez.app.member.mail.MailHandler;
import com.travelez.app.member.mail.TempKey;
import com.travelez.app.member.service.MemberService;
import com.travelez.app.member.util.fileUtil;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberService service;
	
	@Autowired
	JavaMailSender mailSender;
	
	@GetMapping(value = "home.do")
	public String home() {
		System.out.println("MemberController home" + new Date());
		
		return "member/home";
	}
	
	@GetMapping(value = "regi.do")
	public String regi() {
		System.out.println("MemberController regi" + new Date());
		
		return "member/regi";
	}
	
	@ResponseBody
	@PostMapping(value = "idcheck.do")
	public String idcheck(String id) {
		System.out.println("MemberController idcheck " + new Date());
		
		boolean isS = service.idCheck(id);
		if(isS == true) {	// id가 있음 
			return "NO";
		}
		
		return "YES";	// id가 없음 
	}
	
	@ResponseBody
	@PostMapping(value = "emailChksend.do")
	public String emailChksend( EmailChkDto dto, 
								@RequestParam(value="usermail")
								String usermail) throws Exception {
		
		System.out.println("MemberController emailChksend " + new Date());
		// 이메일 중복확인 후 사용가능하면 이메일전송
		boolean emailS = service.emailCheck(usermail);
		if(emailS == true) {
			return "NO";
		} else {
			String mailKey = new TempKey().getKey(6,false);
			dto.setTeEmailKey(mailKey);
			dto.setTeEmail(usermail);

			boolean emailready = service.updateEmailKey(dto);

			if(emailready) {
				MailHandler sendMail = new MailHandler(mailSender);
				sendMail.setSubject("여행이지 인증메일입니다.");
				sendMail.setText(
						"<h1>여행이지 메일인증</h1>"
								+	"<br><br>"
								+	"<p>이메일 인증코드는 <b>" + mailKey + "</b> 입니다.</p><br>"
								+	"<p>사이트로 돌아가서 인증코드를 입력해주세요</p>");
				sendMail.setFrom("tripeasyyy@gmail.com", "여행이지");
				sendMail.setTo(dto.getTeEmail());
				sendMail.send();

				return "updateSuccess";

			}else {
				boolean isS = service.insertEmailKey(dto);
				if(isS) {
					MailHandler sendMail = new MailHandler(mailSender);
					sendMail.setSubject("여행이지 인증메일입니다.");
					sendMail.setText(
							"<h1>여행이지 메일인증</h1>"
									+	"<br><br>"
									+	"<p>이메일 인증코드는 <b>" + mailKey + "</b> 입니다.</p><br>"
									+	"<p>사이트로 돌아가서 인증코드를 입력해주세요</p>");
					sendMail.setFrom("tripeasyyy@gmail.com", "여행이지");
					sendMail.setTo(dto.getTeEmail());
					sendMail.send();

					return "success";
				}else {
					return "fail";
				}

			}	
		}
			
	}
	
	@ResponseBody
	@PostMapping(value = "mailKeyChk.do")
	public String mailKeyChk (EmailChkDto dto) throws Exception {
		System.out.println("MemberController mailKeyChk " + new Date());
		
		EmailChkDto echk = service.emailKeyChk(dto);
		
		System.out.println(echk);
		
		if(echk != null) {
			service.updateMailAuth(dto);
			return "OK";
		}else {
			return "FAIL";
		}
	}
	@PostMapping(value = "registerAf.do")
	public String registerAf(	Model model,
								MemberDto dto,
								@RequestParam(value="fileload", required = false)
								MultipartFile fileload,
								HttpServletRequest req) {
		
		System.out.println("MemberController registerAf " + new Date());
		
		if(!fileload.isEmpty()) {
	
			// upload의 경로 설정
			// server
//			String uploadPath = req.getServletContext().getRealPath("/asset/uploadProfile/");
			String uploadPath = "/Users/ksy/git/travelez/src/main/webapp/asset/images/uploadProfile";
			
			System.out.println("uploadPath : " + uploadPath);
			// filename 취득
			String filename = fileload.getOriginalFilename();
			
			// 파일명을 충돌되지 않는 명칭(Date)으로 변경
			String newfilename = fileUtil.getNewFileName(filename);
			dto.setTeProfileName(newfilename);	// 변경된 파일명
			// DB에 파일경로 저장 
			String filePath = "../asset/images/uploadProfile/" + newfilename;
			dto.setTeProfile(filePath);
	
			File file = new File(uploadPath + "/" + newfilename);
			
			try {
				// 실제로 파일 생성 + 기입 = 업로드 
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				
				// db에 저장
				boolean isS = service.addMember(dto);
				String message = "";
				if(isS) {
					message = "MEMBER_ADD_YES";
				}else {
					message = "MEMBER_ADD_NO";
				}
				model.addAttribute("message", message);
				return "member/message";
				
			} catch (IOException e) {
				e.printStackTrace();
				String message = "MEMBER_ADD_NO";
				return "member/message";
			}
		}else {
			dto.setTeProfile("../asset/images/profile.png");
			// db에 저장
			boolean isS = service.addMember(dto);
			String message = "";
			if(isS) {
				message = "MEMBER_ADD_YES";
			}else {
				message = "MEMBER_ADD_NO";
			}
			model.addAttribute("message", message);
			return "member/message";
		}
	}
	@ResponseBody
	@PostMapping(value = "emailAuthChk.do")
	public String emailAuthChk(EmailChkDto dto) {
		System.out.println("MemberController emailAuthChk " + new Date());
		
		boolean isS = service.emailAuthChk(dto);
		if(isS == true) {	// 인증완료
			return "YES";
		}
		
		return "NO";	// 인증안함 
	}
	
	@GetMapping(value = "login.do")
	public String login() {
		System.out.println("MemberController login" + new Date());
		
		return "member/login";
	}
	
	@ResponseBody
	@PostMapping(value = "loginAf.do")
	public String loginAf(HttpServletRequest req, MemberDto dto) {
		System.out.println("MemberController loginAf " + new Date());
		
		System.out.println(dto);
		
		MemberDto login = service.login(dto);
		
		System.out.println(login);
		
		if(login != null) {
			req.getSession().setAttribute("login", login);
			return "LOGIN_OK";
		}else {
			return "LOGIN_FAIL";
		}
	}
	@GetMapping(value = "logout.do")
	public String logout(HttpServletRequest req, MemberDto dto) {
		System.out.println("MemberController logout" + new Date());
		HttpSession session = req.getSession();
		session.setAttribute("login", dto);
		System.out.println("로그아웃 되었습니다.");
		
		return "member/home";
	}
	@GetMapping(value="findAccount.do")
	public String findAccount() {
		System.out.println("MemberController findAccount" + new Date());
		
		return "member/findAccount";
	}
	
	@ResponseBody
	@PostMapping(value="findId.do")
	public String findId(	EmailChkDto dto, 
							@RequestParam(value="usermail")
							String usermail) throws Exception {
	
			System.out.println("MemberController findId" + new Date());
			
			String mailKey = new TempKey().getKey(6,false);
			dto.setTeEmailKey(mailKey);
			dto.setTeEmail(usermail);
	
			boolean isS = service.updateEmailKey(dto);
			
			if(isS) {
	
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("여행이지 인증메일입니다.");
			sendMail.setText(
					"<h1>여행이지 메일인증</h1>"
							+	"<br><br>"
							+	"<p>이메일 인증코드는 <b>" + mailKey + "</b> 입니다.</p><br>"
							+	"<p>사이트로 돌아가서 인증코드를 입력해주세요</p>");
			sendMail.setFrom("tripeasyyy@gmail.com", "여행이지");
			sendMail.setTo(dto.getTeEmail());
			sendMail.send();
	
			
			return "success";
		} else {
			return "fail";
		}
	}
	
	@ResponseBody
	@PostMapping(value = "idChk.do")
	public String idChk (EmailChkDto dto) throws Exception {
		System.out.println("MemberController idChk " + new Date());
		
		EmailChkDto echk = service.emailKeyChk(dto);
		String findId = "";
		if(echk !=null) {
			findId = service.findId(echk.getTeEmail());
		} else {
			findId = "fail";
		}
		return findId;

	}
	@ResponseBody
	@PostMapping(value="findPwd.do")
	public String findPwd(EmailChkDto dto, MemberDto mdto) throws Exception {
	
		System.out.println("MemberController findId" + new Date());
		boolean pwdEmailS = service.findPwd(mdto);
		
		if(pwdEmailS) {
			String mailKey = new TempKey().getKey(6,false);
			dto.setTeEmailKey(mailKey);
			dto.setTeEmail(mdto.getTeEmail());
	
			boolean isS = service.updateEmailKey(dto);
			
			if(isS) {
	
				MailHandler sendMail = new MailHandler(mailSender);
				sendMail.setSubject("여행이지 인증메일입니다.");
				sendMail.setText(
						"<h1>여행이지 메일인증</h1>"
								+	"<br><br>"
								+	"<p>이메일 인증코드는 <b>" + mailKey + "</b> 입니다.</p><br>"
								+	"<p>사이트로 돌아가서 인증코드를 입력해주세요</p>");
				sendMail.setFrom("tripeasyyy@gmail.com", "여행이지");
				sendMail.setTo(dto.getTeEmail());
				sendMail.send();
		
				
				return "success";
			} else {
				return "fail";
			}
		}else {
			return "fail";
		}
	}
	@ResponseBody
	@PostMapping(value = "pwdChk.do")
	public String pwChk (MemberDto dto) throws Exception {
		
		System.out.println("MemberController pwChk " + new Date());

		boolean isS = service.updatePwd(dto);
		if(isS) {
			return "OK";
		}else {
			return "FAIL";
		}

	}
}
