package spring.mvc.reboard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import reboard.data.model.ReboardDao;
import reboard.data.model.ReboardDto;

@Controller
public class BoardUpdateController {

	@Autowired
	ReboardDao dao;
	
	@GetMapping("/board/updatepassform")
	public ModelAndView upassform(@RequestParam int num,
			@RequestParam String currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("num", num);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("updatepassform");
		
		return model;
	}
	
	@PostMapping("/board/updatepass")
	public ModelAndView upass(@RequestParam int num,
			@RequestParam int pass,
			@RequestParam int currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		//비번이 맞으면 수정 폼 ,틀리면 passfail
		int check=dao.getCheckPass(num, pass);
		
		if(check==1)
		{
			//dto얻는다(수정 폼을 가기위한)
			ReboardDto dto=dao.getData(num);
			
			model.addObject("dto", dto);
			model.addObject("currentPage", currentPage);
			model.setViewName("updateform"); //포워드
			
		}else{
			model.setViewName("passfail");
		}
		
		return model;
	}
	
	@PostMapping("/board/update")
	public String insert(@ModelAttribute ReboardDto dto,
			@RequestParam ArrayList<MultipartFile> upload,
			HttpSession session,
			@RequestParam String currentPage)
	{
		//업로드 할 실제경로
		String path=session.getServletContext().getRealPath("/WEB-INF/photo");
		
		//파일명에 사용 할 날짜
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		System.out.println(path);
		
		String photo="";
		
		//사진선택 안 했을경우 no,했을경우 ,(쉼표)로 나열 
		if(upload.get(0).getOriginalFilename().equals(""))
			photo="no";
		else {
			for(MultipartFile f:upload)
			{
				String fName="f_"+sdf.format(new Date())+f.getOriginalFilename();
				photo+=fName+",";
				
				//업로드
				try {
					f.transferTo(new File(path+"\\"+fName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			//photo에서 마지막 컴마 제거
			photo=photo.substring(0, photo.length()-1);
		}
		
		//dto에 photo넣어주기
		dto.setPhoto(photo);
		
		//update
		dao.updateReboard(dto);
		
		return "redirect:content?num="+dto.getNum()+"&currentPage="+currentPage;
	}
}