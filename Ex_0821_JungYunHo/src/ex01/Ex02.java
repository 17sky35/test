package ex01;

public class Ex02 {
	public static void main(String[] args) {
		int sum = 0;
		for(int i = 1; i < 21;i++) {
			if(i%2 != 0 && i%3 != 0) {
				sum+=i;
			}
		}
		System.out.println("1부터 20까지의 정수 중 2 또는 3의 배수가 아닌 수의 총 합 : " + sum);
	}
}
