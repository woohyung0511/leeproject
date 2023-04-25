package boot.data.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.BoardAnswerDto;
import boot.data.service.BoardAnserService;
import boot.data.service.MemberService;

@RestController
public class BbAnswerController {

	@Autowired
	MemberService memService;
	
	@Autowired
	BoardAnserService bbservice;
	
	@PostMapping("/board/ainsert")
	public void answerinsert(@ModelAttribute BoardAnswerDto dto,
			HttpSession session)
	{
		//세션에 로그인 한 아이디 얻기
		String myid=(String)session.getAttribute("myid");
		
		//아이디를 넘겨서 이름 가져오기
		String name=memService.getName(myid);
		
		//dto에 넣기
		dto.setMyid(myid);
		dto.setName(name);
		
		//insert
		bbservice.insertAnswer(dto);
	}
	
	//list
	@GetMapping("/board/alist")
	public List<BoardAnswerDto> alist(String num)
	{
		return bbservice.getAllAnswers(num);
	}
	
	//delete
	@GetMapping("/board/delete")
	public void delete (String idx)
	{
		bbservice.deleteAnswer(idx);
	}
	
	@GetMapping("/board/aupdateform")
	public BoardAnswerDto getAnswer(String idx)
	{
		return bbservice.getAnswer(idx);
	}
	
	@PostMapping("/board/aupdate")
	public void update(BoardAnswerDto dto)
	{
		bbservice.updateAnswer(dto);
	}
	
}
