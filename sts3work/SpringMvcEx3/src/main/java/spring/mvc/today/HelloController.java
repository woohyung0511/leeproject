package spring.mvc.today;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {

	
	@GetMapping("/happy")
	public String happy()
	{
		return "happy";
	}
	
	@GetMapping("/hello")
	public String hello(Model model)
	{
		model.addAttribute("msg","���� �̹��� ���");
		return "hello";
	}
	
	@GetMapping("/nice/hi")
	public String nice(Model model)
	{
		model.addAttribute("name","���缮");
		model.addAttribute("addr","����� ������");
		
		return "nice";
	}
}
