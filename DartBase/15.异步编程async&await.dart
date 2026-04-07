//只有当await对象的future执行成功之后才会执行后续操作。
void main(List<String> args) {
  test();
}
void test() async{
  int i = 0;
  String? result;
  try{
    result = await Future((){
      // int a = 10 ~/ 0;
      return "test";
    });
    i++;
  }catch(error){
    print(error);
  }
  print(i);//不报错1，报错0
  print(result);//不报错test，报错null
}
void test2() async{
  //也可以使用delayed延迟几秒表示该方法异步执行了几秒判断。
  try {
    await Future.delayed(Duration(seconds: 3));
    print("test2");
  } catch (e) {
    print(e);
  }
}