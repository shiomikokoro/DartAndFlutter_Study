import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Center示例"),
        ),
        body: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(50)
          ),
          //padding 内边距组件
          //为子组件添加内边距，可以单独设置子组件的内边距
          ////padding 设置内边距的大小和方向，同上是EdgeInsets类设置
          child: Padding(
            // padding: EdgeInsets.only(left: 50,top: 50),//针对性设置
            padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),//对边设置
            // padding: EdgeInsetsGeometry.fromLTRB(left, top, right, bottom),//类css全变单独设置
            child: Container(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}