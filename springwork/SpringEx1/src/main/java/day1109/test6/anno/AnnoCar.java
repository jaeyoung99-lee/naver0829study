package day1109.test6.anno;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//@Component  //id:annoCar
@Component("mycar") // id 가 mycar 가 된다
public class AnnoCar {	
	//@Autowired  //자동 주입-에러 발생:매칭 가능한 클래스가 2개이므로 오류가 발생
	//AnnoTire annoTire;
	
	//인터페이스를 구현한 클래스가 여러개인경우 정확하게 클래스명으로 선언하면 된다
	//유일하게 때문에 알아서 자동주입된다
	@Autowired
	//AnnoCanadaTire annoTire;
	//AnnoKoreaTire annoTire;
	
	//@Resource 는 인터페이스를 구현한 클래스가 여러개일경우 콕 집어서 정해준다(누구를 주입할지)
	//@Resource(name = "annoCanadaTire")
	@Resource(name = "annoKoreaTire")
	AnnoTire annoTire;
	
	public void myCarInfo()
	{
		System.out.println("내 차의 타이어는 "+annoTire.getTireName()+" 입니다");
	}

}
