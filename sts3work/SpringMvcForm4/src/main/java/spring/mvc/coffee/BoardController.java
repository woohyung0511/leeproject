package spring.mvc.coffee;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")
public class BoardController {

	@GetMapping("/fomr1")
	public String form1()
	{
		return "board/writeform";
	}
	
	@PostMapping("/process1")
	public ModelAndView process1(@RequestParam String name,
			@RequestParam String date,
			@RequestParam String gender,
			@RequestParam(required = false) String msg,
			@RequestParam(defaultValue = "1") int currentPage)
	{
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("name",name);
		mview.addObject("date",date);
		mview.addObject("gender",gender);
		mview.addObject("msg",msg);
		mview.addObject("currentPage",currentPage);
		
		mview.setViewName("board/result");
		
		return mview;
	}
	
	@GetMapping("/result2")
	public String resultt2(Model model)
	{
		model.addAttribute("myimg","../image/toy01.png");
		model.addAttribute("title","좋아하는 토이스토리 캐릭터");
		
		return "board/result2";
	}
}
