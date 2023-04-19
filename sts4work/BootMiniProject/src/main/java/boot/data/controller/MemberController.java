package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@GetMapping("/member/form")
	public String memberform()
	{
		return "/member/memberform";
	}
	
	@GetMapping("/member/list")
	public String list(Model model)
	{
		//전체조회
		List<MemberDto> list=service.getAllMembers();
		
		model.addAttribute("list", list);
		model.addAttribute("count", list.size());
		
		return "/member/memberlist";
	}
	
	//중복체크
	@GetMapping("/member/idcheck")
	@ResponseBody
	public Map<String, Integer> idcheck(@RequestParam String id)
	{
		Map<String , Integer> map=new HashMap<>();
		
		//id
		int n=service.getSearchId(id);
		
		map.put("count", n); //0 or 1 {"count":0}
		
		return map;
	}
	@PostMapping("/member/insert")
	public String insert(@ModelAttribute MemberDto dto,
			HttpSession session,MultipartFile myphoto)
	{
		String path=session.getServletContext().getRealPath("/photo");
		
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName="photo_"+sdf.format(new Date())+myphoto.getOriginalFilename();
		
		//dto의 photo에 저장
		dto.setPhoto(fileName);
		
		//upload
		try {
			myphoto.transferTo(new File(path+"\\"+fileName));
			
			//db insert
			service.insertMember(dto);
			
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//return "/member/gaipsuccess";	
		return "redirect:list";
	}
	
	//나의 정보로 이동
	@GetMapping("/member/myinfo")
	public String myinfo(Model model)
	{
		List<MemberDto> list=service.getAllMembers();
		
		model.addAttribute("list",list);
		
		return "/member/myinfo";
	}
	
}