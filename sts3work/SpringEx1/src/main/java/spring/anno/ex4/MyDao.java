package spring.anno.ex4;

import org.springframework.stereotype.Component;

@Component //자동으로 빈에 등록(id는 클래스명, 첫글자만 소문자로 등록)
public class MyDao implements DaoInter {

	@Override
	public void insertData(String str) {
		// TODO Auto-generated method stub

		System.out.println(str+"_데이터를 db에 추가 성공!");
	}

	@Override
	public void deleteData(String num) {
		// TODO Auto-generated method stub
		
		System.out.println(num+"_에 해당하는 데이터 삭제 성공!");
	}

}
