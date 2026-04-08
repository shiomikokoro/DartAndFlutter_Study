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
        //Container 多功能组合容器
        //容器大小优先级：父组件约束>constraints约束>明确宽高>自适应
        //通过decoration属性实现视觉效果，与color属性互斥
        //存在内外边距、对齐方式、矩阵变换（旋转、倾斜、平移等）的控制
        //常见属性
        ////alignment                 控制子组件再容器内的对齐方式，Alignment.center（居中）
        ////width/height/constraints  设置宽/高/更细致的尺寸约束
        ////padding/margin            内外边距
        ////color/decoration          颜色/更复杂的背景
        ////transform                 矩阵变换
        ////child                     唯一的、直接的子组件
        body: Container(
          width: 200,
          height: 200,
          margin: EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 3,color: Colors.amber)
          ),
          transform: Matrix4.rotationZ(0.05),//弧度
          child: Text("hello, Container",style: TextStyle(color: Colors.white,fontSize: 20),),
        ),
      ),
    );
  }
}