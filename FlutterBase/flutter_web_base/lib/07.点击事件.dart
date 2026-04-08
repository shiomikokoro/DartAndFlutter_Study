import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}
class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "有状态组件",
      home: Scaffold(
        //topbar
        appBar: AppBar(
          title: Text("top bar/appbar"),
        ),
        //content
        body: Container(
          child: Center(
            child: GestureDetector(//手势监听
              onTap:() => print("thanks for click"),//点击事件
              onDoubleTap: () => print("thanks for dounle click"),//双击事件
              onLongPress: () => print("wow, you hold me~"),//长按事件
              child: Text("content/body"),
            ),
          ),
        ),
        //footer
        bottomNavigationBar: Container(
          height: 80,
          child: Center(
            child: TextButton(//专用点击事件的按钮，自带动画等
              onPressed: ()=>print("button click"),//被点击的时候
              child: Text("footer/bottomNavigationBar"),//按钮文本
            ),
          ),
        ),
      ),
    );
  }

}
