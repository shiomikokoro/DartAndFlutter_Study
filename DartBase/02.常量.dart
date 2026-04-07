void main(List<String> args) {
  //const
  //如果是表达式禁止使用变量运算
  //因为常量会在代码编译前被定义
  //[x] const pai = 3.1415*x;
  const pai = 3.1415;
  var r = 2;
  print(r*r*pai);//12.566

  //final
  //运行时被确定下来，也不可被修改
  final time = DateTime.now();
  final d = r*2;
  //[x] d = 5;
  print(time);//2025-12-02 16:01:07.777076
  print(d);//4
}