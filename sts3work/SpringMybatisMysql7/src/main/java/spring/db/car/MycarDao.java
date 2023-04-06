package spring.db.car;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MycarDao {
	
	@Autowired
	private SqlSession session;
	
	//총 갯수
	public int getTotalCount()
	{
		return session.selectOne("getTotalCountOfMyCar");
	}
	
	//전체 데이터
	public List<MycarDto> getAllDatas()
	{
		return session.selectList("getAllDatas");
	}
	
	//insert
	public void insertMyCar(MycarDto dto)
	{
		session.insert("insertOfMyCar", dto); //id,파라미터
	}
	
	//수정 폼
	public MycarDto getData(String num)
	{
		return session.selectOne("getOneDataOfMyCar", num);
	}
	
	//수정
	public void updateMyCar(MycarDto dto)
	{
		session.update("updateOfMyCar", dto);
	}
	
	//삭제
	public void deleteMyCar(String num)
	{
		session.delete("deleteOfMyCar", num);
	}
}
