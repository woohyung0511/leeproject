package boot.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.MemberDto;
import boot.data.mapper.MemberMapperInter;

@Service
public class MemberService implements MemberServiceInter {

	@Autowired
	MemberMapperInter mapper;
	
	@Override
	public List<MemberDto> getAllMembers() {
		// TODO Auto-generated method stub
		return mapper.getAllMembers();
	}

	@Override
	public void insertMember(MemberDto dto) {
		// TODO Auto-generated method stub
		mapper.insertMember(dto);
	}

	@Override
	public int getSearchId(String id) {
		// TODO Auto-generated method stub
		return mapper.getSearchId(id);
	}

}
