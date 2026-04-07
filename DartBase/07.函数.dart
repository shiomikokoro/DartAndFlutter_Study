
//function 代码组合和复用的核心单元
//返回类型 函数名(参数...){ 函数体 [return 返回数据;] }
//void 就表示没有返回值，不需要return
//如果什么都不写，代表返回数据是dynamic
double plus(double a,double b){
  double num = a+b;
  return num;
}
//Dart中函数不支持重载，但有类似搭配
//可选位置参数用[]包裹，且类型后面必须接空安全机制
String fun1(String a,[String? b,String? c]){return a+(b??'')+(c??'');}
//可选命名参数用{}包裹，且类型后面必须接空安全机制
//flutter最常见
void fun2(int a,{int? b,double? c}){}
//内部判断类型
void fun3(num x){
  if(x is int){print('is int');}
  else if(x is double){print('is double');}
}

//匿名函数
//没有函数名的函数，可以作为参数被调用，可以直接调用参数名执行函数。
Function test = (){
  print("test");
};
void onTest(Function a){
  a();
}

//箭头函数
//函数体只有一行代码时
//函数名 ()=> 代码逻辑。不需要写（也不能写）return。
add (int a,int b)=> a+b;
void main(List<String> args) {
  print(plus(2, 3));//5.0
  fun1('a');fun1('a','b');fun1('a','b','c');
  fun2(1);fun2(5,b:6);fun2(5,c:6);fun2(5,b:6,c:7);
  fun3(0.0);//is double
  test();
  onTest(test);
}