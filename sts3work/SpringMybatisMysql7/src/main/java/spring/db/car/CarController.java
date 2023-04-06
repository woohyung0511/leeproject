package spring.db.car;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CarController {

	@Autowired
	MycarDao dao;
	
	@GetMapping("/samsung/list")
	public String list(Model model)
	{
		//전체 갯수
		int totalCount=dao.getTotalCount();
		
		//목록가져오기
		List<MycarDto> list=dao.getAllDatas();
		
		//request에 저장
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("list",list);
		
		return "car/carlist";
	}
	
	//입력 폼으로 가기
	@GetMapping("/samsung/writeform")
	public String carform()
	{
		return "car/writeform";
	}
	
	//insert
	@PostMapping("/samsung/write")
	public String insert(@ModelAttribute MycarDto dto)
	{
		dao.insertMyCar(dto);
		return "redirect:list";
	}
	
	//수정 폼으로 이동
	@GetMapping("/samsung/updateform")
	public String updateform(@RequestParam String num,Model model)
	{
		//dto가져오기
		MycarDto dto=dao.getData(num);
		
		//저장
		model.addAttribute("dto",dto);
		
		return "car/updateform";
	}
	
	//update
	@PostMapping("/samsung/update")
	public String update(@ModelAttribute MycarDto dto)
	{
		dao.updateMyCar(dto);
		return "redirect:list";
	}
	
	//delete
	@GetMapping("/samsung/delete")
	public String delete(@RequestParam String num)
	{
		dao.deleteMyCar(num);
		return "redirect:list";
	}
}
