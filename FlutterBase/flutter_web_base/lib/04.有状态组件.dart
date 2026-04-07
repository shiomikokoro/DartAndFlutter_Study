import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}
//第一个类 对外 接受和定义最终参数，核心作用创建State对象
class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

//第二个类 内部类 管理可变的数据和业务逻辑 并渲染视图
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
            child: Text("content/body"),
          ),
        ),
        //footer
        bottomNavigationBar: Container(
          height: 80,
          child: Center(
            child: Text("footer/bottomNavigationBar"),
          ),
        ),
      ),
    );
  }

}
