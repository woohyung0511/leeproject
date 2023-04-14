package board.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.UploadContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import board.data.BoardDao;
import board.data.BoardDto;

@Controller
public class BoardController {

	@Autowired
	BoardDao dao;
	
	@GetMapping("/")
	public String home()
	{
		return "redirect:board/list";
	}
	
	@GetMapping("/board/list")
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		
		//dao
		List<BoardDto> list=dao.getAllDatas();
		
		//저장 ..list,전체 갯수
		model.addObject("list", list);
		model.addObject("tcount", list.size());
		
		model.setViewName("list");
		
		return model;
	}
	
	@GetMapping("/board/writeform")
	public String form()
	{
		return "addform";
	}
	
	@PostMapping("/board/insert")
	public String insert(@ModelAttribute BoardDto dto,
			@RequestParam MultipartFile upload,
			HttpSession session)
	{
		/*
		 * if(!upload.isEmpty())
		 * System.out.println("파일명: "+upload.getOriginalFilename());
		 */
		
		//업로드 될 실제 경로
		String realPath=session.getServletContext().getRealPath("/save");
		System.out.println(realPath);
		
		//사진을 실제경로에 업로드 시킨 후 그 파일명을 dto의 photo에 저장
		//사진을 안 넣으면 no라고 저장
		
		String uploadName=upload.getOriginalFilename();
		
		if(upload.isEmpty())
			dto.setPhoto("no");
		
		else {
			dto.setPhoto(uploadName);	
			
			//실제 업로드
			try {
				upload.transferTo(new File(realPath+"\\"+uploadName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//db에 저장
		dao.insertBoard(dto);
		
		return "redirect:list";
	}
	
	//디테일
	@GetMapping("/board/detail")
	public ModelAndView detail(long num)
	{
		ModelAndView model=new ModelAndView();
		
		BoardDto dto=dao.getData(num);
		
		model.addObject("dto", dto);
		
		model.setViewName("detail");
		
		return model;
	}
	
	//업데이트 폼 이동
	@GetMapping("/board/updateform")
	public ModelAndView updateform(long num)
	{
		ModelAndView model=new ModelAndView();
		
		BoardDto dto=dao.getData(num);
		
		model.addObject("dto", dto);
		
		model.setViewName("updateform");
		
		return model;
	}
	
	//업데이트
	@PostMapping("/board/update")
	public String update(@ModelAttribute BoardDto dto,
			@RequestParam MultipartFile upload, HttpSession session)
	{
		
		String realPath=session.getServletContext().getRealPath("/save");
		System.out.println(realPath);
		
		//사진을 실제경로에 업로드 시킨 후 그 파일명을 dto의 photo에 저장
		//사진을 안 넣으면 no라고 저장
		
		String uploadName=upload.getOriginalFilename();
		
		if(upload.isEmpty())
			dto.setPhoto(dao.getData(dto.getNum()).getPhoto());
		
		else {
			dto.setPhoto(uploadName);	
			
			//실제 업로드
			try {
				upload.transferTo(new File(realPath+"\\"+uploadName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		dao.updateBoard(dto);
		
		return "redirect:list";
	}
	
	//삭제
	@GetMapping("/board/delete")
	public String delete(long num,
			HttpSession session)
	{
		String realPath=session.getServletContext().getRealPath("/save");
		
		String uploadName=dao.getData(num).getPhoto();
		
		File file=new File(realPath+"\\"+uploadName);
		
		if(file.exists())
			file.delete();

		dao.deleteBoard(num);
		
		return "redirect:list";
	}
}
