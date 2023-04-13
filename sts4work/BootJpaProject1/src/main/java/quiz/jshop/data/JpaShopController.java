package quiz.jshop.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JpaShopController {

	@Autowired
	JpaShopDao dao;
	
	@GetMapping("/")
	public String home()
	{
		return "redirect:shop/shopform";
	}
	
	@GetMapping("/shop/shopform")
	public String insertform()
	{
		return"shopaddform";
	}
	
	//insert
	@PostMapping("/shop/insert")
	public String insert(@ModelAttribute JpaShopDto dto)
	{
		dao.insertShop(dto);
		
		return"redirect:list";
	}
	
	@GetMapping("/shop/list")
	public ModelAndView list()
	{
		ModelAndView mview=new ModelAndView();
		
		List<JpaShopDto> list=dao.getAllDatas();
		
		mview.addObject("list", list);
		mview.addObject("tcount",list.size());
		
		mview.setViewName("shoplist");
		
		return mview;
	}
	
	@GetMapping("/shop/shopdetail")
	public ModelAndView detail(int num)
	{
		ModelAndView mview=new ModelAndView();
		
		JpaShopDto dto=dao.getData(num);
		
		mview.addObject("dto", dto);
		
		mview.setViewName("shopdetail");
		
		return mview;
	}
	
	@GetMapping("/shop/delete")
	public String delete(int num)
	{
		dao.deleteShop(num);
		
		return "redirect:list";
	}
	
	@GetMapping("/shop/updateform")
	public ModelAndView updateform(int num)
	{
		ModelAndView mview=new ModelAndView();
		
		JpaShopDto dto=dao.getData(num);
		
		mview.addObject("dto", dto);
		
		mview.setViewName("shopupdateform");
		
		return mview;
	}
	
	@PostMapping("/shop/update")
	public String update(JpaShopDto dto)
	{
		dao.updateShop(dto);
		
		return "redirect:list";
	}
}
