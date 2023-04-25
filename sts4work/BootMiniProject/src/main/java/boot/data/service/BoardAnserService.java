package boot.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.BoardAnswerDto;
import boot.data.mapper.BoardAnswerMapperInter;

@Service
public class BoardAnserService implements BoardAnswerServiceInter {

	@Autowired
	BoardAnswerMapperInter mapper;
	
	@Override
	public void insertAnswer(BoardAnswerDto dto) {
		// TODO Auto-generated method stub
		mapper.insertAnswer(dto);
	}

	@Override
	public List<BoardAnswerDto> getAllAnswers(String num) {
		// TODO Auto-generated method stub
		return mapper.getAllAnswers(num);
	}

	@Override
	public BoardAnswerDto getAnswer(String idx) {
		// TODO Auto-generated method stub
		return mapper.getAnswer(idx);
	}

	@Override
	public void updateAnswer(BoardAnswerDto dto) {
		// TODO Auto-generated method stub
		mapper.updateAnswer(dto);
	}

	@Override
	public void deleteAnswer(String idx) {
		// TODO Auto-generated method stub
		mapper.deleteAnswer(idx);
	}

}
