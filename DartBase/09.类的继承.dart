class Parent{
  String? name;
  int? age;
  Parent({this.name,this.age});
  Parent.noAge({this.name});
  void study(){print("Parent: $name is studying");}
}
//extends 继承父类
class Child extends Parent{
  //但继承中，子类不会继承父类的构造函数，必须使用super关键字保证父类正确初始化
  Child({String? name,int? age});//Child({String? name,int? age}):super(name:name,age:age);
  Child.noAge({String? name}):super(name:name);
  //默认构造函数可语法糖为如下，命名构造函数无法使用
  // Child({super.name,super.age});

  //可以使用override重写父类方法
  @override
  void study() {
    //调用父类的方法
    // super.study();
    //重写
    print("Child: $name is studying");
  }
}

void main(List<String> args) {
  Child child = Child(name: "shiomi",age: 1);
  Child child2 = Child.noAge(name: "kokoro");
  child.study();//Parent: null is studying / 重写后 Child: null is studying
  child2.study();//Parent: kokoro is studying / 重写后 Child: kokoro is studying
}