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
        //Align 对齐组件
        //精确控制子组件在父组件的对齐方式，想要将组件放在特定的角落
        ////alignment     子组件在父组件的对齐方式
        ////widthFactor   Align的宽度，是子组件宽度*该因子，常在动态布局中被使用
        ////heightFactor  Align的高度，是子组件高度*该因子，常在动态布局中被使用
        appBar: AppBar(
          title: Text("Center示例"),
        ),
        body: Container(
          color: Colors.blue,
          child: Align(
            alignment: AlignmentGeometry.center,
            widthFactor: 5,
            heightFactor: 5,
            child: Icon(Icons.star,size: 150,color: Colors.amber),
          )
        ),
      ),
    );
  }
}