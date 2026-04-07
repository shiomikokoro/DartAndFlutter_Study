void main(List<String> args) {
  //String 文本变量
  String string = "I am String";//Spring声明文本变量，单双引号都可以
  String time = 'I will eat food at ${DateTime.now()}';//Spring模板字符串，用${}圈住表达式
  String friend = 'shiomi';String output = '$friend is friend';//用$ 表示属性名
  print(string+'\n' //I am String
    +time+'\n' //I will eat food at 2025-12-02 16:08:24.832058
    +output);//shiomi is friend


  //int num double 数字变量
  int friendCount = 3;//整形
  print('I have $friendCount friends.');//I have 3 friends.
  num rest = 1.5;//可整形可小数
  print('I have $rest hours to rest.');//I have 1.5 hours to rest.
  double kilo = 2.0;//小数
  print('It is $kilo kg apples');//It is 2.0 kg apples

  //int double 不可以直接用于赋值
  //[x] friendCount = kilo;
  //[x] kilo = friendCount;
  friendCount = kilo.toInt();
  kilo = friendCount.toDouble();
  print('I have $friendCount friends.');//I have 2 friends.
  print('It is $kilo kg apples');//It is 2.0 kg apples

  //num 不能直接给double赋值，但double可以给num赋值
  //[x] kilo = rest
  kilo = rest.toDouble();
  rest = kilo;
  print('It is $kilo kg apples');//It is 1.5 kg apples
  print('I have $rest hours to rest.');//I have 1.5 hours to rest.


  //bool 布尔变量
  bool worksFlag = true;
  isFinishYourWorks(worksFlag);//Yes. I finished it.
  worksFlag = false;
  isFinishYourWorks(worksFlag);//No. Not yet.


  //List 列表变量（其他语言叫数组Array）
  List students = ['shiomi','kuzushi'];
  print(students);//[shiomi, kuzushi]

  //该变量类型提供 CRUD 方法。
  //add(value) 在尾部添加
  //addAll([listValue]) 在尾部添加列表
  //remove(value) 删除满足内容的第一个
  //removeLast() 删除最后一个
  //removeRange(start, end) 删除一定范围内的，结束索引不包含在范围内,存在越界异常问题，必须在列表大小之中
  students.add('natsuko');
  print(students);//[shiomi, kuzushi, natsuko]
  students.addAll(['nanami','takashi','yumeko']);
  print(students);//[shiomi, kuzushi, natsuko, nanami, takashi, yumeko]
  students.add('natsuko');
  students.remove('natsuko');
  print(students);//[shiomi, kuzushi, nanami, takashi, yumeko, natsuko]
  students.removeLast();
  print(students);//[shiomi, kuzushi, nanami, takashi, yumeko]
  students.removeRange(0, 2);
  print(students);//[nanami, takashi, yumeko]


  //Map 字典类型（键值对）
  //键与值可以是任意变量类型
  //可惜通过键修改值。
  Map transWord = {'lunch':'午餐','morning':'早上','hello':'你好'};
  print(transWord);//{lunch: 午餐, morning: 早上, hello: 你好}
  print(transWord['lunch']);//午餐
  transWord['hello']="您好死了";
  print(transWord);//{lunch: 午餐, morning: 早上, hello: 您好死了}

  //一些常用的操作方法
  //forEach((key,value){function}) 循环遍历
  //addAll({mapValue}) 在尾部添加字典
  //containsKey(value) 是否包含某个键
  //remove(value) 删除某个键
  //clear() 清空
  transWord.forEach((key,value){
    print("$key:$value");
  });//lunch:午餐 \n morning:早上 \n hello:您好死了
  transWord.addAll({'echo':'回响'});
  print(transWord);//{lunch: 午餐, morning: 早上, hello: 您好死了, echo: 回响}
  print(transWord.containsKey('hello'));//true
  transWord.remove('echo');
  print(transWord);//{lunch: 午餐, morning: 早上, hello: 您好死了}
  transWord.clear();
  print(transWord);//{}


  //dynamic 动态类型
  //允许变量的类型在运行时自由改变，并跳过编辑时检查
  dynamic free = 'free';
  free = 1; free = []; free = false; free = {};

  //与var的区别
  //var根据初始值判断类型，确定类型后类型固定，有编译检查，仅限推断出的属性和方法。
}

void isFinishYourWorks(bool flag){
  if(flag){
    print('Yes. I finished it.');
  }else{
    print('No. Not yet.');
  }
}