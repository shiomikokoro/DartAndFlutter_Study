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
          title: Text("Column示例"),
        ),
        body: Container(
          color: Colors.amber,
          //Column 线性布局
          //绝大多数的列表元素都能看到它的身影，比如登录表单、设置列表、卡片布局、商品图文混排
          //注意事项
          ////不支持滚动，内容超出需要ListView或SingleChildScrollView包裹
          ////需要明确尺寸约束，父组件大小会直接形象Column的大小和布局行为
          ////避免过渡嵌套影响性能
          //常规属性
          ////mainAxisAlignment   控制主轴（垂直）方向上的对齐方式
          ////crossAxisAlignment  控制交叉轴（水平）方向上的对齐方式
          ////mainAxisSize        决定Column本身在垂直方向上的尺寸策略，是占满空间，还是仅包裹子组件
          ////children            需要垂直的子组件列表
          child: Column(
            //主轴对齐
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,//两头对齐
            // mainAxisAlignment: MainAxisAlignment.spaceAround,//分散对齐
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,//平均对齐
            // mainAxisAlignment: MainAxisAlignment.start,//头部对齐，默认
            // mainAxisAlignment: MainAxisAlignment.end,//尾部对齐
            mainAxisAlignment: MainAxisAlignment.center,//中部对齐
            //交叉轴对齐
            // crossAxisAlignment: CrossAxisAlignment.start,//左侧对齐
            // crossAxisAlignment: CrossAxisAlignment.end,//右侧对齐
            crossAxisAlignment: CrossAxisAlignment.center,//中部对齐
            spacing: 10,//两者间距
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(width: 100,height: 100,color: Colors.blue),
              Container(width: 100,height: 100,color: Colors.blue),
              Container(width: 100,height: 100,color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}