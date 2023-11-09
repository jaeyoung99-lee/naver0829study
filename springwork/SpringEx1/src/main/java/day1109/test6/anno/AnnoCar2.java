package day1109.test6.anno;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;

@Component("mycar2") 
@AllArgsConstructor
public class AnnoCar2 {	
	AnnoKoreaTire koreaTire;	
	AnnoCanadaTire canadaTire;
	
	public void myCarInfo()
	{
		System.out.println("내 차의 타이어는 "+koreaTire.getTireName()+" 입니다");
		System.out.println("겨울용 타이어는 "+canadaTire.getTireName()+"입니다");
	}

}
