package reboard.data.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReboardDao implements ReboardDaoInter {

	@Autowired
	private SqlSession session;
	
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return session.selectOne("getTotalCountOfReboard");
	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return session.selectOne("MaxnumOfReboard");
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("regroup", regroup);
		map.put("restep", restep);
		
		session.update("updateStepOfReboard", map);
	}

	@Override
	public void insertReboard(ReboardDto dto) {
		// TODO Auto-generated method stub
		int num=dto.getNum(); //0:새 글 1보다 큰 값:답글
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		
		if(num==0) //새 글
		{
			regroup=getMaxNum()+1; //num의 최댓값 +1
			restep=0;
			relevel=0;
		}else { //답글일 경우
			
			//같은 그룹중에서 전달받은 restep보다 큰 글들은 모두 +1
			updateRestep(regroup, restep);
			
			//전달받은 step과 level은 +1
			restep++;
			relevel++;
		}
		
		//바뀐값들을 다시 dto에 담는다
		dto.setRegroup(regroup);
		dto.setRestep(restep); 
		dto.setRelevel(relevel);
		
		//insert
		session.insert("insertOfReboard", dto);
	}

	@Override
	public List<ReboardDto> getList(int start, int perpage) {
		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		
		map.put("start", start);
		map.put("perpage", perpage);
		
		return session.selectList("getAllPagingOfReboard", map);
	}

	@Override
	public void updateReadcount(int num) {
		// TODO Auto-generated method stub
		session.update("updateReadCountOfReboard", num);
	}

	@Override
	public ReboardDto getData(int num) {
		// TODO Auto-generated method stub
		return session.selectOne("getDataOfReboard", num);
	}

	@Override
	public int getCheckPass(int num, int pass) {
		// TODO Auto-generated method stub
		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("num", num);
		map.put("pass", pass);
		
		return session.selectOne("checkEqualPassOfReboard", map);
	}

	@Override
	public void deleteReboard(int num) {
		// TODO Auto-generated method stub
		session.delete("deleteOfReboard", num);
	}

	@Override
	public void updateReboard(ReboardDto dto) {
		// TODO Auto-generated method stub
		session.update("updateOfReboard", dto);
	}
}