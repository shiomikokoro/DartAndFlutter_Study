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
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text("我是第${index+1}个",style: TextStyle(color: Colors.white,fontSize: 20)),
      
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("GridView示例")),
        //默认构造函数：复杂麻烦不常用不介绍
        //GridView.count() 根据次轴显示个数来定义
        //必须设置次轴显示个数，默认垂直滚动
        // body: GridView.count(
        //   crossAxisCount: 3,//次轴个数，比如水平EW滚动，次轴就是垂直SN显示的个数，反之同理
        //   mainAxisSpacing: 10,//主轴间距
        //   crossAxisSpacing: 10,//次轴间距
        //   padding: EdgeInsets.all(10),
        //   scrollDirection: Axis.vertical,//主轴方向，EW滚动Shift+滚轮
        //   children: getList(),
        // ),
        //GridView.extent() 根据次轴元素同轴方向长度最大值来定义
        // body: GridView.extent(
        //   maxCrossAxisExtent: 150,//次轴元素同轴方向长度最大值
        //   mainAxisSpacing: 10,
        //   crossAxisSpacing: 10,
        //   padding: EdgeInsets.all(10),
        //   scrollDirection: Axis.horizontal,
        //   children: getList(),
        // ),
        //GridView.builder() 懒加载，根据布局委托来构建
        body: GridView.builder(
          scrollDirection: Axis.horizontal,
          //布局委托
          //SliverGridDelegateWithFixedCrossAxisCount 根据次轴显示个数来定义
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            // childAspectRatio: 2,//宽高比，默认1，就是长方形
            mainAxisExtent: 500,//也可以用这个设置主轴长度，优先级高于childAspectRatio
          ), 
          //SliverGridDelegateWithMaxCrossAxisExtent 根据次轴元素同轴方向长度最大值来定义
          itemCount: 100,
          itemBuilder: (BuildContext buildContext,int index){
            return Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text("我是第${index+1}个",style: TextStyle(color: Colors.white,fontSize: 20)),
              
            );
          }
        ),
      ),
    );
  }
}
