package spring.mvc.json;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StartController {

	@GetMapping("/")
	public String home()
	{
		return "start";
	}
	
	@GetMapping("/jsonex1")
	public String ex1()
	{
		return "ex1";
	}
	
	@GetMapping("/jsonex2")
	public String ex2()
	{
		return "ex2";
	}
	
	@GetMapping("/jsonex3")
	public String ex3()
	{
		return "ex3";
	}
}
