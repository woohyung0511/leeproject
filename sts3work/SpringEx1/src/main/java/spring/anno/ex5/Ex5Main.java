package spring.anno.ex5;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex5Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//어노테이션 만으로 출력해주세요....
		
		ApplicationContext app=new ClassPathXmlApplicationContext("annoContext.xml");
		
		MySqlController cont=(MySqlController)app.getBean("mysqlcont");
		
		cont.insert("이지혜");
		cont.delete("2");
		cont.select("김민지");
	}

}
