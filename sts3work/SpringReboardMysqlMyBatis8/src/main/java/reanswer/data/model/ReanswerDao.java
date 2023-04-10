package reanswer.data.model;

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

}
