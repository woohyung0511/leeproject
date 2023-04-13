package quiz.jshop.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JpaShopDao {

	@Autowired
	JpaShopDaoInter shopInter;
	
	//insert
	public void insertShop(JpaShopDto dto)
	{
		shopInter.save(dto);
	}
	
	public List<JpaShopDto> getAllDatas()
	{
		return shopInter.findAll();
	}
	
	public JpaShopDto getData(int num)
	{
		return shopInter.getReferenceById(num);
	}
	
	public void deleteShop(int num)
	{
		shopInter.deleteById(num);
	}
	
	public void updateShop(JpaShopDto dto)
	{
		shopInter.save(dto);
	}
}
