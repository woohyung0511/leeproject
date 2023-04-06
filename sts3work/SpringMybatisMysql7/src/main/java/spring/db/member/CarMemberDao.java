package spring.db.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarMemberDao {
	
	@Autowired
	private SqlSession session;
	
	public int getTotalCount()
	{
		return session.selectOne("getTotalOfMember");
	}
	
	public List<CarMemberDto> getAllDatas()
	{
		return session.selectList("getAllDatas2");
	}
	
	public void insertMember(CarMemberDto dto)
	{
		session.insert("insertOfMember", dto); 
	}
	
	public CarMemberDto getData(String num)
	{
		return session.selectOne("getOneDataOfMember", num);
	}
	
	public void updateMember(CarMemberDto dto)
	{
		session.update("updateOfMember", dto);
	}
	
	public void deleteMember(String num)
	{
		session.delete("deleteOfMember", num);
	}

}
