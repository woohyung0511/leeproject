package boot.test;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

	@GetMapping("/test")
	public TestDto hello()
	{
		TestDto dto=new TestDto();
		
		dto.setName("전재준");
		dto.setAddr("서울시 강남구");
		
		return dto;
	}
}
