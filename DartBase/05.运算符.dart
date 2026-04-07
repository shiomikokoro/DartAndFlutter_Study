void main(List<String> args) {
  //算数运算符
  // +  -  *  /  ~/   %
  // 加 减 乘 除 整除 取余
  //整除是向下取整，所以如果要声明变量，必须用int或num
  //取余可以为小数
  //当然浮点数无法被计算机二进制精确表达，所有计算都有问题，只不过据大部分被抵消了（实际上还是有问题的）
  double num1 = 5.6;double num2 = 2;
  print(num1+num2);//7.6
  print(num1-num2);//3.5999999999999996
  print(num1*num2);//11.2
  print(num1/num2);//2.8
  print(num1~/num2);//2
  print(num1%num2);//1.5999999999999996

  //赋值运算符
  //  =   +=   -=   *=   /=   %=
  // 赋值 加等 减等 乘等 除等 余等
  //除等 结果未必是整数，所以变量得是double类型
  //num1 = num1 % num2
  num1 %= num2;
  print(num1);

  //比较运算符
  //  ==  !=    >     >=     <     <=
  // 相等 不等 大于 大于等于 小于 小于等于
  //返回结果是bool类型
  print(num1>=num2);//false

  //逻辑运算符
  //&& || !
  //与 或 非
  //其实也可以用&和|，但双符号如果第一个判断出情况，不需要判断后续情况，看下发灰体
  bool a = true;bool b = false;
  print(b&&a);//false
  print(a||b);//true
  print(!a);//false
}