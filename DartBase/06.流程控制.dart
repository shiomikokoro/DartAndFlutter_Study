void main(List<String> args) {
  //if 
  //可以有一个条件if，也可以有两个条件if/else，也可以有多条件if/else if.../else
  int score = 60;
  if(score>=60){
    print("congraduretion");
  }else if(score>=80){
    print("nice");
  }else{
    print("noob");
  }
  //三元运算 简化版双条件if 比较表达式?成立:不成立
  String flag = 1>2?"是的，倒反天罡":"正义必胜";
  print(flag);

  //switch
  //可以不是整形 但建议弄成整形，因为很多语言不允许，下面只是实验
  String string = 'ab';
  switch(string){
    case 'ab':
      print(string);
      break;
    case 'bc':
      print(string);
      break;
    default:
      print(string);
  }

  //循环
  //while
  //do while 先执行在判断；while 先判断在循环
  //可以用break跳出循环，break后面循环控制全都不会执行
  //可以用continue跳过当此循环
  int i = 0;
  do {
    i++;
  } while (i<0);
  print(i);//1
  i = 0;//归零
  while(i<0){
    i++;
  }
  print(i);//0
  while(i<10){
    if(i==3){
      break;
      i++;//不会执行
    }
    i++;
  }
  print(i);//3

  //for循环
  //可以使用break跳出循环，break后面循环控制全都不会执行
  //可以用continue跳过“当次”循环,后面循环控制全都不会执行
  List list = [5,6,9,3];
  int num = 0;
  for(int i = 0;i<list.length;i++){//整体会循环3遍被break掉
    if(i==0){
      continue;
    }
    num++;//被跳过了一次
    if(list[i]==9){
      print(list[i]);//9
      break;
      print(list[i+1]);//不执行
    }
  }
  print(num);//2
}