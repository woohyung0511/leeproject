package spring.mvc.json;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController /* Json�����̹Ƿ� �Ϲݸ޼��� �� �� */
public class JsonTest2Controller {

	@GetMapping("/list2")
	public List<PhotoDto> list2()
	{
		List<PhotoDto> list=new ArrayList<PhotoDto>();
		
		list.add(new PhotoDto("�����", "�����.PNG"));
		list.add(new PhotoDto("������", "������.PNG"));
		list.add(new PhotoDto("���", "���.PNG"));
		list.add(new PhotoDto("�����", "�����.PNG"));
		list.add(new PhotoDto("����", "����.PNG"));
		
		return list;
	}
	
}
