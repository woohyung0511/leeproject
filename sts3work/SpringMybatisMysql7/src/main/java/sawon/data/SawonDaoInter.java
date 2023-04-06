package sawon.data;

import java.util.List;
import java.util.Map;

public interface SawonDaoInter {

	public int getTotalCount();
	public void insertSawon(SawonDto dto);
	public List<SawonDto> getAllDatas(Map<String, String> map);
	public SawonDto getData(String num);
	public void updateSawon(SawonDto dto);
	public void deleteSawon(String num);
}
