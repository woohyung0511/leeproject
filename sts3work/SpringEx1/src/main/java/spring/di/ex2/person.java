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

	//���
	public void write()
	{
		System.out.println("�л����� ���");
		
		System.out.println("�б���: "+schoolname);
		System.out.println("�̸�: "+info.name);
		System.out.println("����: "+info.age);
		System.out.println("�ּ�: "+info.addr);
	}

}
