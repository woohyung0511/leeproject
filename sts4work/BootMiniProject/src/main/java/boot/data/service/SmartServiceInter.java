package boot.data.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.SmartDto;

@Mapper
public interface SmartServiceInter {

	public void insertShop(SmartDto dto);
	public List<SmartDto> getShopList(int start, int perpage);
	public int getTotalCount();
	public SmartDto getSangpum(int num);
	public void deleteShop(int num);
}
