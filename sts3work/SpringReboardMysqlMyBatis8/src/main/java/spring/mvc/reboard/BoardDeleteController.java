package spring.mvc.reboard;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import reboard.data.model.ReboardDao;

@Controller
public class BoardDeleteController {

	@Autowired
	ReboardDao dao;
	
	@GetMapping("/board/deletepassform")
	public ModelAndView upassform(@RequestParam int num,
			@RequestParam String currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		model.addObject("num", num);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("deletepassform");
		
		return model;
	}
	
	//����
	@PostMapping("/board/delete")
	public String delete(@RequestParam int num,
			@RequestParam String currentPage,
			@RequestParam int pass,HttpSession session)
	{
		//����� �´��� üũ
		int check=dao.getCheckPass(num, pass);
		
		if(check==0) {
			return "passfail";
		}else {
			//photo������ ���� �����
			String photo=dao.getData(num).getPhoto();
			
			if(!photo.equals("no")) {
				//,�� �и�
				String []fName=photo.split(",");
				
				//���� ���ε� ���
				String path=session.getServletContext().getRealPath("/WEB-INF/photo");
				
				for(String f:fName)
				{
					File file=new File(path+"\\"+f);
					file.delete();
				}
			}
			//db����
			dao.deleteReboard(num);
			
			return "redirect:list?currentPage="+currentPage;
		}
	}	
}