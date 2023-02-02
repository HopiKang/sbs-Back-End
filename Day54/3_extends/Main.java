class Parent{
    public Parent(int a, int b)
}

class Child extends Parent{
    public Child(){
//        int a = 0; // 3
        super(0,0);
        int a = 0; // 3
    }
}

public class Main {
}

// 부모 클래스의 생성자를 사용하는 규칙
// 1. 먼저 자식 클래스의 인스턴스를 생성할때 부모클래스의 생성자도 반드시 불려져야 한다
// 부모클래스에 명시된 생성자가 없으면 자동으로 제공되는 부모 클래스 기본 생성자가 불려진다


// 2. 부모클래스의 기본 생성자가 없는 경우, 파라미터가 없는 생성자가 없는경우, 자식클래스에서 반드시
// 직접 코드를 작성해서 부모클래스의 생성자 호출을 시켜줘야 한다

// 3. 부모클래스의 생성자를 호출할때 자식클래스의 생성자 맨 윗줄에 적어줘야한다
// 그러니까 마치 부모클래스의 생성자가 불린 다음 자식 클래스의 생성자가 불린다고 생각하면된다

// Child c = new Child;