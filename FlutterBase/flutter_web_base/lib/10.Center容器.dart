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
        //Center 居中组件
        //将内容整体居中，正中显示，是一种特殊的Align
        //因为center没有宽高，大小取决于父组件
        //所以想要居中固定宽高的物体就用center包裹该组件
        appBar: AppBar(
          title: Text("Center示例"),
        ),
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            child: Center(
              child: Text("居中内容"),
            ),
          ),
        ),
      ),
    );
  }
}