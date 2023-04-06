package spring.di.ex2;

public class person {

	String schoolname;
	Myinfo info;
	
	public person(Myinfo info) {
		super();
		this.info=info;
	}
	
	public void setSchoolName(String schoolName) {
		this.schoolname=schoolName;	
	}

	//출력
	public void write()
	{
		System.out.println("학생정보 출력");
		
		System.out.println("학교명: "+schoolname);
		System.out.println("이름: "+info.name);
		System.out.println("나이: "+info.age);
		System.out.println("주소: "+info.addr);
	}

}
