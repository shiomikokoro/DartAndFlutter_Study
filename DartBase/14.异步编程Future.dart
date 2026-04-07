//Dart是单线程语言，即同时只能做一件事，耗时任务会造成程序阻塞，此时需要异步编程。
//所以多线程的时候，采用Dart的 事件循环 机制来处理耗时任务。
//首先执行同步代码、次之执行微任务队列、最后执行事件队列。

//微任务队列：Future.microtask()
//事件队列：Future、Future.delayed()、I/O操作

// Future有三个状态
// 等待：Uncompleted
// 成功：Completed with a value
// 失败：Completed with a error
void main(List<String> args) {
  //基础调用
  Future f = Future((){
    return "hello Flutter";//成功
    //如果抛出异常，就表示进程错误
    // throw Exception("unkown error");
  });
  f.then((value){
    print(value);//hello Flutter
  }).catchError((error){
    print(error);//Exception: unkown error
  });

  //多任务，链式调用，其核心是存在返回值，不一定是Future类型，如果没有返回值单纯就是基础调用。
  //只要一个then出现异常后续的then不再执行。但已经执行的操作不会回退。
  int i = 0;//操作标记符
  Future f2 = Future((){
    return "hello Flutter";
  });
  //回调地狱，保证接口顺序进行。
  f2.then((value){
    i++;
    return Future(()=>"task1");
  }).then((value){
    i++;
    return Future(()=>"$value - task2");
  }).then((value){
    i++;
    return Future(()=>"$value - task3");
  }).then((value){
    i++;
    int a = 10~/0;
    print(value);//task1 - task2 - task3
  }).catchError((error){
    print(i);//4
    print(error);//IntegerDivisionByZeroException
  });
  print(i);//0
}
