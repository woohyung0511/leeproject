package spring.mvc.reboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import reanswer.data.model.ReanswerDaoInter;
import reanswer.data.model.ReanswerDto;
import reboard.data.model.ReboardDao;
import reboard.data.model.ReboardDto;

@Controller
public class BoardContentController {

	@Autowired
	ReboardDao dao;
	
	@Autowired
	ReanswerDaoInter adao;
	
	@GetMapping("/board/content")
	public ModelAndView content(@RequestParam int num,
			@RequestParam int currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		//readcount
		dao.updateReadcount(num);
		
		//dto
		ReboardDto dto=dao.getData(num);
		
		
		model.addObject("dto", dto);
		model.addObject("currentPage", currentPage);
		
		//num�� �ش��ϴ� ��� db���� �����ͼ� ������
		List<ReanswerDto> alist=adao.getAnswerList(num);
		
		//����� �������� ������ �ϹǷ�
		model.addObject("acount", alist.size());
		model.addObject("alist", alist);
		
		model.setViewName("content");
		
		return model;
	}
}
