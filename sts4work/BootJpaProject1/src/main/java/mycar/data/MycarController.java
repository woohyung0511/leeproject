package mycar.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MycarController {

	@Autowired
	MycarDao dao;
	
	/*
	 * @GetMapping("/") public String home() { return "redirect:car/carform"; }
	 */
	
	@GetMapping("/car/carform")
	public String form()
	{
		return "caraddform";
	}
	
	//insert
	@PostMapping("/car/insert")
	public String insert(@ModelAttribute MycarDto dto )
	{	
		dao.insertCar(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/car/list")
	public ModelAndView list()
	{
		ModelAndView mview=new ModelAndView();
		
		mview.setViewName("carlist");
		
		//저장
		List<MycarDto> list=dao.getAllDatas();
		
		//저장
		mview.addObject("list", list);
		mview.addObject("tcount", list.size());
		
		return mview;
	}
	
	@GetMapping("/car/deleteform")
	public String delete(@RequestParam long num)
	{
		dao.delete(num);
		
		return "redirect:list";
	}
	
	@GetMapping("/car/updateform")
	public ModelAndView updateform(long num)
	{
		ModelAndView mview=new ModelAndView();
		
		//dao
		MycarDto dto=dao.getData(num);
		
		//request에 저장
		mview.addObject("dto", dto);
		
		//포워드
		mview.setViewName("carupdateform");
		
		return mview;
	}
	
	//수정
	@GetMapping("/car/update")
	public String update(@ModelAttribute MycarDto dto)
	{
		dao.updateCar(dto);
		
		return "redirect:list";
	}
}
