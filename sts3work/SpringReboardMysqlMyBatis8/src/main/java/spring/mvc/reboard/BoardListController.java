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
				
		//블럭 < 1 2 3 4 5 >
		int totalCount=dao.getTotalCount();
		int totalPage;//총페이지수
		int startPage;//각블럭의 시작페이지
		int endPage;//각블럭의 끝페이지
		int start;//각페이지의 시작번호
		int perPage = 3;//한페이지에 보여질 글의 갯수
		int perBlock = 5; //한블럭당 보여지는 페이지
		
		//총 페이지 개수
		totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
		//각블럭의 시작페이지.. 현재페이지가 3(s:1, e:5)  6(s:6, e:10)
		startPage = (currentPage - 1) / perBlock * perBlock + 1;
		endPage = startPage + perBlock - 1;
		//총페이지가8 (6~10 ... endpage를 8로 수정해주어야함.)
		if (endPage > totalPage)
		   endPage = totalPage;
		//각페이지에서 불러올 시작번호
		start = (currentPage - 1) * perPage;
		//각페이지에서 필요한 게시글 가져오기
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