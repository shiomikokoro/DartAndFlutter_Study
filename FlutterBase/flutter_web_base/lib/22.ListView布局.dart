import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  List<Widget> getList(){
    return List.generate(50,(index)=>Container(
      margin: EdgeInsets.only(left: 10,right: 10),
      height: 100,
      width:double.infinity,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text("我是第${index+1}个",style: TextStyle(color: Colors.white,fontSize: 30)),
      
    ));
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ListView示例")),
        //默认构造函数ListView()，一次性加载所有数据，仅适用于静态有限数据
        // body: ListView(
        //   padding:EdgeInsets.only(left: 10,right: 10),
        //   children: getList(),
        // ),
        //ListView.bulid()
        //按需构建，不会初始化全部列表，而是根据用户的滚动行为，动态创建和销毁列表项。
        //同时需要两个属性itemCount、itemBuilder
        // body: ListView.builder(
        //   itemCount: 100,
        //   itemBuilder: (BuildContext BuildContext,int index){
        //     print("create $index element");//动态创建检查
        //     return Container(
        //       margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
        //       height: 100,
        //       width:double.infinity,
        //       color: Colors.blue,
        //       alignment: Alignment.center,
        //       child: Text("我是第${index+1}个",style: TextStyle(color: Colors.white,fontSize: 30)),
              
        //     );
        //   }
        // ),
        //ListView.separated()
        //除了按需构建，还提供分割线设计，可以塞AD等其他内容
        //同时需要三个属性itemCount、itemBuilder、separatorBuilder
        body: ListView.separated(
          itemCount: 100,
          itemBuilder: (BuildContext BuildContext,int index){
            print("create $index element");//动态创建检查
            return Container(
              margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
              height: 100,
              width:double.infinity,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text("我是第${index+1}个",style: TextStyle(color: Colors.white,fontSize: 30)),
              
            );
          },
          separatorBuilder: (context, index) =>
            (index+1)%20!=0?Container():Container(height: 10,width: double.infinity,color: Colors.amber,)
        ),
      ),
    );
  }
}
