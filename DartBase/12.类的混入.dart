//可以不适用继承的方式，向类添加新功能
//一个类可以混入多个对象，遵循后者优先原则，后来混入的同名方法会覆盖之前的
mixin Base{
  void sing(String? name){
    print("$name is singing");
  }
}
mixin Base2{
  void sing(String? name){
    print("$name do not wanna sing");
  }
}

class Student with Base{
  String? name;
  int? age;
  Student({this.name,this.age});
}
class Teacher with Base,Base2{
  String? name;
  int? age;
  Teacher({this.name,this.age});
}
void main(List<String> args) {
  Student student = Student(name: "shiomi");
  Teacher teacher = Teacher(name: "kanade");
  student.sing(student.name);//shiomi is singing
  teacher.sing(teacher.name);//kanade do not wanna sing
}