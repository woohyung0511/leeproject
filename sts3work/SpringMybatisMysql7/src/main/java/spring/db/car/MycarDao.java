package spring.db.car;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MycarDao {
	
	@Autowired
	private SqlSession session;
	
	//�� ����
	public int getTotalCount()
	{
		return session.selectOne("getTotalCountOfMyCar");
	}
	
	//��ü ������
	public List<MycarDto> getAllDatas()
	{
		return session.selectList("getAllDatas");
	}
	
	//insert
	public void insertMyCar(MycarDto dto)
	{
		session.insert("insertOfMyCar", dto); //id,�Ķ����
	}
	
	//���� ��
	public MycarDto getData(String num)
	{
		return session.selectOne("getOneDataOfMyCar", num);
	}
	
	//����
	public void updateMyCar(MycarDto dto)
	{
		session.update("updateOfMyCar", dto);
	}
	
	//����
	public void deleteMyCar(String num)
	{
		session.delete("deleteOfMyCar", num);
	}
}
