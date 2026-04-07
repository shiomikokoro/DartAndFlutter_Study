void main(List<String> args) {
  //泛型列表
  List<String> list = [];
  //[x] list.add(0);
  list.add("value");
  list.add("a");
  Map<String,int> map = {};
  //[x] map[0]=0;
  map['a']=1;

  getValue(1);//不指定传入类型
  getValue<String>('value');//指定为String

  printList(["asa",1,0.0]);//不指定参数类型
  printList<int>([1,2]);//指定为int
  
  Student s = Student();s.name=1;//不指定参数类型
  Student<String> s2 = Student();s2.name='shiomi';//指定为String
}

//泛型方法 T表示参数传入的类型 方法名后面的T限制参数类型
T getValue<T>(T value){
  return value;
}
//限制传入list的类型
void printList<T>(List<T> list){
  list.forEach(print);
}

//泛型类
class Student<T>{
  T? name;
}