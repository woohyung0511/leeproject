package boot.data.mapper;

import java.util.List;
import java.util.Map;

import boot.data.dto.SmartDto;

public interface SmartMapperInter {

	public void insertShop(SmartDto dto);
	public List<SmartDto> getShopList(Map<String, Integer> map);
	public int getTotalCount();
	public SmartDto getSangpum(int num);
	public void deleteShop(int num);
}
