package spring.di.ex2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex2Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ApplicationContext context=new ClassPathXmlApplicationContext("appContext2.xml");
				
		//MyInfo
		Myinfo my=(Myinfo)context.getBean("my");
		
		//°ªÈ®ÀÎ
		System.out.println(my.toString());
		System.out.println(my);
		
		//person
		person p=(person)context.getBean("person");
		p.write();
	}

}
