package reanswer.data.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AnswerController {

	@Autowired
	ReanswerDao dao;
	
	@PostMapping("/board/ainsert")
	public String ainsert(@ModelAttribute ReanswerDto dto,
			@RequestParam int currentPage)
	{
		dao.insertReanswer(dto);
		
		return "redirect:content?num="+dto.getNum()+"&currentPage="+currentPage;
	}
}
