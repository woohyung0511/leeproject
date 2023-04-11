package reanswer.data.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import reboard.data.model.ReboardDao;
import reboard.data.model.ReboardDto;

@Controller
public class TestController {

	@Autowired
	ReboardDao dao;
	
	@GetMapping("/sist/list")
	public @ResponseBody List<ReboardDto> list()
	{
		return dao.getList(0, 5);
	}
	
	@GetMapping("/sist/data")
	@ResponseBody
	public ReboardDto onedata(@RequestParam int num)
	{
		return dao.getData(num);
	}
	
	@GetMapping("/rest/list")
	public String ajaxlist()
	{
		return "list";
	}
}
