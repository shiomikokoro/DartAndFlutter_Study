import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  List<Widget> getList(){
    return List.generate(10,(index)=>Container(height: 100,width:100,color: Colors.blue));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Warp示例"),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.amber,
          //Warp 流式布局
          //用于应对Column/Row/Flex超出内容不能换行的问题
          //html中的float布局，类似Flex加了换行特性
          //常见属性
          ////direction     主轴方向
          ////spacing       主轴上子组件间距
          ////runSpacing    次轴上子组件间距
          ////alignment     主轴上对齐方式
          ////runAlignment  次轴上对齐方式
          ////这里的主轴和次轴与前面的主轴和交叉轴概念不同，这里的主轴是根据direction属性的值确认的，另一个轴则相反
          child: Wrap(
            direction: Axis.vertical,
            spacing: 10,//主轴上子组件间距
            runSpacing: 10,//次轴上子组件间距
            children: getList(),
          ),
        ),
      ),
    );
  }
}