package ex02_Thead;

import java.util.Scanner;


class QuizThread extends Thread{
	
	Scanner sc = new Scanner(System.in);
	int count = 0;
		
	public void startGame() {
		long startTime = System.currentTimeMillis();
		try {
			while(true) {
				int x = (int)(Math.random()*100)+1;
				int y = (int)(Math.random()*100)+1;
				System.out.printf("%d + %d = ",x,y);
				int result = sc.nextInt();
				if(x+y == result) {
					System.out.println("정답!!");
					count++;
					if(count ==5) {
						break;
					}
				}else {
					System.out.println("오답");
				}
				
			}//while
		} catch (Exception e) {
			System.out.println("정답은 정수로 입력하세요");
		}
		
		long endTime = System.currentTimeMillis();
		long time = (endTime - startTime)/1000;
		System.out.println("결과 : " + time + "초...");
	}//startGame	
}//QuizThread클래스


public class QuizMain {
	public static void main(String[] args) {
		
		QuizThread qt = new QuizThread();
		qt.start();
		qt.startGame();
		
		
	}	
}
