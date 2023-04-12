package boot.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.model.personDTO;

@Controller
public class FormController {

	@GetMapping("/sist/form1")
	public String form1()
	{
		return "form/form1"; //WEB-INF/board/form/form1.jsp
	}
	
	@GetMapping("/sist/form2")
	public String form2()
	{
		return "form/form2";
	}
	
	@GetMapping("/sist/form3")
	public String form3()
	{
		return "form/form3";
	}
	
	@PostMapping("/sist/read1")
	public ModelAndView result1(@RequestParam String name,
			@RequestParam int java,
			@RequestParam int spring)
	{
		ModelAndView model=new ModelAndView();

		//저장
		model.addObject("name",name);
		model.addObject("java",java);
		model.addObject("spring",spring);
		
		//포워드 경로
		model.setViewName("result/result1");
		
		return model;
	}
	
	@PostMapping("/sist/read2")
	public String result2(@ModelAttribute("dto") personDTO dto)
	{	
		return "result/result2";
	}
	
	@PostMapping("/sist/read3")
	//map으로 읽을경우 폼의 name이 key값으로 입력값이 value값으로 저장
	public ModelAndView result3(@RequestParam Map<String, String> map)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("name", map.get("name"));
		model.addObject("blood",map.get("blood"));
		model.addObject("hp",map.get("hp"));
		
		model.setViewName("result/result3");
		
		return model;
	}
}
