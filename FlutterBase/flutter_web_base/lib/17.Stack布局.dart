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
          title: Text("Stack示例"),
        ),
        body: Container(
          height: 500,
          width: double.infinity,
          color: Colors.amber,
          //Stack 堆叠布局
          //允许将多个子组件按照Z轴叠加排列。几乎在所有叠加效果的页面中出现，比如对话框、弹窗、操作菜单的浮层交互以及悬浮按钮等。
          //Stack不能设置宽高，可以用具有宽高容器父组件包裹，对Stack进行设置。
          //叠层顺序是根据子组件顺序确定的，为逆相关。
          //常见属性
          ////Positioned    直接子组件，对子组件进行精确定位控制。
          ////alignment     控制非Positioned的对齐方式
          ////clipBehavior  控制超出Stack显示范围子组件的裁剪方式
          ////children      子组件列表
          child: Stack(
            alignment: AlignmentGeometry.center,//对齐方式，默认左上
            children: [
              Container(height: 150,width:150,color: Colors.blue),//最底层
              Container(height: 100,width:100,color: Colors.green),//第三层
              Container(height: 50,width:50,color: Colors.yellow),//第二层
              Positioned(//最上层，固定
                left: 10 ,bottom: 10,//控制子组件精确位置
                // left: 0 ,bottom: 0, top: 0, right:0,//如果对相对方位/四个方位设置数值会直接拉伸宽高，让子组件的宽高设置失效。
                child: Container(height: 50,width:50,color: Colors.purple)
              )
            ],
          ),
        ),
      ),
    );
  }
}