package spring.db.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CarMemberController {

	@Autowired
	CarMemberDao dao;
	
	@GetMapping("/member/list")
	public String list(Model model)
	{
		int totalCount=dao.getTotalCount();
		
		List<CarMemberDto> list=dao.getAllDatas();
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);
		
		return "carmember/memberlist";
	}
	
	@GetMapping("/member/writeform")
	public String memberform()
	{
		return "carmember/writeform";
	}
	
	@PostMapping("/member/write")
	public String insert(@ModelAttribute CarMemberDto dto)
	{
		dao.insertMember(dto);
		return "redirect:list";
	}
	
	@GetMapping("/member/updateform")
	public String updateform(@RequestParam String num, Model model)
	{
		CarMemberDto dto=dao.getData(num);
		
		model.addAttribute("dto", dto);
		
		return "carmember/updateform";
	}
	
	@PostMapping("/member/update")
	public String update(@ModelAttribute CarMemberDto dto)
	{
		dao.updateMember(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/member/delete")
	public String delete(@RequestParam String num)
	{
		dao.deleteMember(num);
		return "redirect:list";
	}
}
