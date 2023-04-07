package spring.mvc.reboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import reboard.data.model.ReboardDao;
import reboard.data.model.ReboardDto;

@Controller
public class BoardListController {

	@Autowired
	ReboardDao dao;
	
	@GetMapping("/")
	public String start()
	{
		return "redirect:board/list";
	}
	
	@GetMapping("/board/list")
	public ModelAndView list(@RequestParam(value="currentPage",defaultValue = "1") int currentPage)
	{
		ModelAndView model=new ModelAndView();
				
		//�� < 1 2 3 4 5 >
		int totalCount=dao.getTotalCount();
		int totalPage;//����������
		int startPage;//������ ����������
		int endPage;//������ ��������
		int start;//���������� ���۹�ȣ
		int perPage = 3;//���������� ������ ���� ����
		int perBlock = 5; //�Ѻ��� �������� ������
		
		//�� ������ ����
		totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
		//������ ����������.. ������������ 3(s:1, e:5)  6(s:6, e:10)
		startPage = (currentPage - 1) / perBlock * perBlock + 1;
		endPage = startPage + perBlock - 1;
		//����������8 (6~10 ... endpage�� 8�� �������־����.)
		if (endPage > totalPage)
		   endPage = totalPage;
		//������������ �ҷ��� ���۹�ȣ
		start = (currentPage - 1) * perPage;
		//������������ �ʿ��� �Խñ� ��������
		List<ReboardDto> list = dao.getList(start, perPage);

		int no=totalCount -(currentPage-1)*perPage;
		
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		model.addObject("totalPage", totalPage);
		model.addObject("startPage", startPage);
		model.addObject("endPage", endPage);
		model.addObject("perBlock", perBlock);
		model.addObject("currentPage", currentPage);
		model.addObject("no", no);
			
		model.setViewName("boardlist");
		
		return model;
		}
	}