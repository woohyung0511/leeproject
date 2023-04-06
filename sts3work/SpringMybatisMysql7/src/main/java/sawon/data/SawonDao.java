package sawon.data;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SawonDao implements SawonDaoInter {

	@Autowired
	private SqlSession session;
	
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return session.selectOne("getTotalCountOfSawon");
	}
	
	@Override
	public void insertSawon(SawonDto dto) {
		// TODO Auto-generated method stub
		session.insert("insertOfSawon", dto);
	}

	@Override
	public List<SawonDto> getAllDatas(Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.selectList("getAllDatasOfSawon",map);
	}

	@Override
	public SawonDto getData(String num) {
		// TODO Auto-generated method stub
		return session.selectOne("getOneDataOfSawon", num);
	}

	@Override
	public void updateSawon(SawonDto dto) {
		// TODO Auto-generated method stub
		session.update("updateOfSawon", dto);
		
	}

	@Override
	public void deleteSawon(String num) {
		// TODO Auto-generated method stub
		session.delete("deleteOfSawon", num);
	}
}
