package boot.data.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class LoginController {

	@Autowired
	MemberService service;
	
	@GetMapping("/login/main")
	public String loginform(HttpSession session,Model model)
	{
		//폼의 아이디를 얻어줌
		String myid=(String)session.getAttribute("myid");
		
		//로그인 상태인지 아닌지
		String loginok=(String)session.getAttribute("loginok");
		
		//한번도 실행 안 하면 null
		if(loginok==null)
			
			return "/login/loginform";
		
		else {
			
			//로그인 중 일때 request에 로그인 한 이름 저장하기
			String name=service.getName(myid);
			model.addAttribute("name", name);
			
			return "/login/logoutform";
		}
	}
	
	@PostMapping("/login/loginprocess")
	public String loginproc(@RequestParam String id,
			@RequestParam String pass,
			@RequestParam(required = false) String cbsave,
			HttpSession session,Model model)
	{
		//id와 pass받기
		int check=service.loginIdPassCheck(id, pass); //1 or 0
		
		if(check==1) { //로그인 성공 시
			
			session.setMaxInactiveInterval(60*60*8);
			
			session.setAttribute("myid", id);
			session.setAttribute("loginok", "yes");
			session.setAttribute("saveok", cbsave);
			
			//id에 대한 데이터
			MemberDto dto=service.getDataById(id);
			
			session.setAttribute("loginphoto", dto.getPhoto());
			
			return "redirect:main";
			
		}else { //로그인 실패 시
			
			return "/member/passfail";
		}
	}
	
	@GetMapping("/login/logoutprocess")
	public String logout(HttpSession session)
	{
		session.removeAttribute("loginok");
		
		return "redirect:main";
	}
}
