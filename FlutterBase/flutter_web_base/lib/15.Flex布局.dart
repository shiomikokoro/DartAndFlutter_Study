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
          title: Text("Flex示例"),
        ),
        body: Container(
          height: double.infinity,
          color: Colors.amber,
          //Flex 弹性布局
          //拥有所有线性布局的常用属性（见对应代码）
          //direction   必须属性，表示主轴方向
          //可以自定义沿某一个轴对齐，更加灵活的对轴上的元素进行尺寸比例和空间分配
          //子组件
          ////Expanded  以最大空间为基准，自动铺满，用flex分配比例
          ////Flexible  默认以最小空间为基准，包裹子元素，可用FlexFit修改基准，用flex分配比例
          child: Flex(
            direction: Axis.horizontal,//主轴方向
            children: [
              //Expanded以最大空间为基准
              //所以可以对想要需要弹性布局的组件包裹，其他的设定固定高度就行。参照15_1示例
              Expanded(flex: 2,child: Container(width: 100,height: 100,color: Colors.blue)),
              Expanded(flex: 1,child: Container(width: 100,height: 100,color: Colors.yellow)),
              //Flexible默认以最小空间为基准，可用fit属性调整
              Flexible(fit:FlexFit.tight,flex: 2,child: Container(width: 100,height: 100,color: Colors.red)),
              Flexible(fit:FlexFit.tight,flex: 1,child: Container(width: 100,height: 100,color: Colors.purple)),
            ],
          ),
        ),
      ),
    );
  }
}