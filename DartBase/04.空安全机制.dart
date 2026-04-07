void main(List<String> args) {
  //在Dart中，会通过编译静态检查将运行时空指针提前暴露。
  //常用空安全操作符
  //?  可空类型 声明可空变量,不能直接声明null
  //?. 安全访问 对象为null时跳过操作返回null，客观判断
  //!. 非空断言 开发者保证变量非空（否则将在运行时报错），主观判断，开发者认为不可能为空
  //?? 空合并   左侧未null时返回右侧默认值
  String? isMayNull = null;print(isMayNull);//null
  isMayNull = 'now, is not null';print(isMayNull);//now, is not null
  String? isMayNull2 = null;
  print(isMayNull2?.startsWith("a"));//null
  // isMayNull2!.startsWith("a");//报错
  String displayName = isMayNull2 ?? "Guide";
  print(displayName);//Guide
}