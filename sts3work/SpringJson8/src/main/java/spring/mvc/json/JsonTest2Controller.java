package spring.mvc.json;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController /* JsonÀü¿ëÀÌ¹Ç·Î ÀÏ¹İ¸Ş¼­µå ¾È µÊ */
public class JsonTest2Controller {

	@GetMapping("/list2")
	public List<PhotoDto> list2()
	{
		List<PhotoDto> list=new ArrayList<PhotoDto>();
		
		list.add(new PhotoDto("µÈÀåÂî°³", "µÈÀåÂî°³.PNG"));
		list.add(new PhotoDto("¶±ººÀÌ", "¶±ººÀÌ.PNG"));
		list.add(new PhotoDto("¶ó¸é", "¶ó¸é.PNG"));
		list.add(new PhotoDto("ºñºö¹ä", "ºñºö¹ä.PNG"));
		list.add(new PhotoDto("ÇÇÀÚ", "ÇÇÀÚ.PNG"));
		
		return list;
	}
	
}
