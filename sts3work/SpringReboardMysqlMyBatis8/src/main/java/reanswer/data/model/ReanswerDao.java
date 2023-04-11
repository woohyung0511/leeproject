package reanswer.data.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReanswerDao implements ReanswerDaoInter {

	@Autowired
	private SqlSession session;
	
	@Override
	public void insertReanswer(ReanswerDto dto) {
		// TODO Auto-generated method stub

		session.insert("insertOfReanswer", dto);
	}

	@Override
	public List<ReanswerDto> getAnswerList(int num) {
		// TODO Auto-generated method stub
		return session.selectList("getNumAllDatasOfReanswer", num);
	}

	@Override
	public int getCheckPass(int idx, String pass) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		map.put("idx", idx);
		map.put("pass", pass);
		
		return session.selectOne("checkEqualPassOfReanswer", map);
	}

	@Override
	public void deleteReanswer(int idx) {
		// TODO Auto-generated method stub
		session.delete("deleteOfReanswer", idx);
	}
}
