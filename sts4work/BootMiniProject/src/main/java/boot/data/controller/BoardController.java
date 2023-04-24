package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.BoardDto;
import boot.data.service.BoardService;
import boot.data.service.MemberService;

@Controller
public class BoardController {

	@Autowired
	BoardService service;
	
	@Autowired
	MemberService mservice;
	
	@GetMapping("/board/list")
	   public ModelAndView list(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
	      ModelAndView model = new ModelAndView();

	      // 총 글의 개수
	      int totalCount = service.getTotalCount();

	      int totalPage; // 총 페이지수
	      int startPage; // 각 블럭의 시작페이지
	      int endPage; // 각 블럭의 끝페이지
	      int start; // 각 페이지의 시작번호
	      int perPage = 10; // 한 페이지에 보여질 글의 갯수
	      int perBlock = 5; // 한 블럭당 보여지는 페이지 갯수

	      // 총 페이지 갯수
	      totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
	      // 각 블럭의 시작페이지
	      startPage = (currentPage - 1) / perBlock * perBlock + 1;
	      endPage = startPage + perBlock - 1;

	      // 총페이지=8일 경우 endpage를 8로 수정한다.
	      if (endPage > totalPage)
	         endPage = totalPage;

	      // 각 페이지에서 불러올 시작번호
	      start = (currentPage - 1) * perPage;

	      // 각 페이지에서 필요한 게시글 가져오기
	      List<BoardDto> list = service.getList(start, perPage);

	      // 각 페이지에 출력할 시작번호
	      int no = totalCount - (currentPage - 1) * perPage;

	      // 출력에 필요한 변수들을 model에 저장
	      model.addObject("totalCount", totalCount);
	      model.addObject("list", list);
	      model.addObject("totalPage", totalPage);
	      model.addObject("startPage", startPage);
	      model.addObject("endPage", endPage);
	      model.addObject("perBlock", perBlock);
	      model.addObject("currentPage", currentPage);
	      model.addObject("no", no);

	      model.setViewName("/board/boardlist");
	      return model;
	   }

	@GetMapping("/board/form")
	public String form() {

		return "/board/writeform";
	}

	@PostMapping("/board/insert")
	public String insert(@ModelAttribute BoardDto dto, HttpSession session) {
		// 업로드 할 폴더지정
		String path = session.getServletContext().getRealPath("/photo");

		// 업로드할 파일명
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		// 업로드 안 한 경우
		if (dto.getUpload().getOriginalFilename().equals(""))
			dto.setUploadfile("no");
		else { // 업로드 한 경우

			String uploadfile = "f_" + sdf.format(new Date()) + dto.getUpload().getOriginalFilename();
			dto.setUploadfile(uploadfile);

			// 실제업로드
			try {
				dto.getUpload().transferTo(new File(path + "\\" + uploadfile));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		
		//세션에서 id얻어서 dto에 저장
		String myid=(String)session.getAttribute("myid");
		dto.setMyid(myid);
		
		//이름은 memberservice에서 얻어서 dto저장
		String name=mservice.getName(myid);
		dto.setName(name);
		
		//dto에 insert
		service.insertBoard(dto);
		
		//return "redirect:list"; //일단은 list..content로 이동해 보세요
		int max=service.getMaxNum();
		
		return "redirect:content?num="+max;
	}
	
	@GetMapping("/board/content")
	public ModelAndView content(@RequestParam String num,
			@RequestParam(defaultValue = "1") int currentPage)
	{
		ModelAndView mview=new ModelAndView();
		
		service.updateReadCount(num); //조회수 증가
		
		BoardDto dto=service.getData(num);
		
		//업로드 파일의 확장자
		int dotloc=dto.getUploadfile().lastIndexOf('.'); //마지막 .의 위치
		String ext=dto.getUploadfile().substring(dotloc+1); //.의 다음 글자부터 끝까지 추출
		
		System.out.println(dotloc+","+ext);
		
		if(ext.equalsIgnoreCase("jpg")|| ext.equalsIgnoreCase("gif")||ext.equalsIgnoreCase("png")||ext.equalsIgnoreCase("jpeg"))
			mview.addObject("bupload", true);
		else
			mview.addObject("bupload",false);
		
		mview.addObject("dto", dto);
		mview.addObject("currentPage", currentPage);
		mview.setViewName("/board/content"); //이미지 인지 아닌지를 보고 출력하기 위해서
		
		return mview;
	}
	
	

}